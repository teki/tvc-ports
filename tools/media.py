"""Reusable source-media and TVC cassette helpers for game ports."""

from __future__ import annotations

from dataclasses import dataclass
import hashlib
from pathlib import Path
import shutil
import tempfile
from urllib.request import Request, urlopen
from zipfile import ZipFile


CAS_HEADER_SIZE = 144
CAS_APPLICATION_HEADER = 0x80
CAS_PAYLOAD = 0x90


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def verify_sha256(path: Path, expected: str):
    actual = sha256_file(path)
    if actual != expected:
        raise ValueError(
            f"{path.name} SHA-256 mismatch: expected {expected}, found {actual}"
        )


def _write_atomic(path: Path, data: bytes):
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(dir=path.parent, delete=False) as output:
        temporary = Path(output.name)
        output.write(data)
    temporary.replace(path)


def ensure_zip_member(
    *,
    url: str,
    archive_path: Path,
    archive_sha256: str,
    member_name: str,
    output_path: Path,
    output_sha256: str,
) -> Path:
    """Download a verified ZIP if needed and materialize one verified member."""
    if output_path.is_file():
        verify_sha256(output_path, output_sha256)
        if archive_path.is_file():
            verify_sha256(archive_path, archive_sha256)
        return output_path

    archive_path.parent.mkdir(parents=True, exist_ok=True)
    if not archive_path.is_file():
        request = Request(url, headers={"User-Agent": "tvc-ports/1.0"})
        with tempfile.NamedTemporaryFile(
            dir=archive_path.parent, delete=False
        ) as output:
            temporary = Path(output.name)
            try:
                with urlopen(request) as response:
                    shutil.copyfileobj(response, output)
            except BaseException:
                temporary.unlink(missing_ok=True)
                raise
        try:
            verify_sha256(temporary, archive_sha256)
            temporary.replace(archive_path)
        except BaseException:
            temporary.unlink(missing_ok=True)
            raise
    else:
        verify_sha256(archive_path, archive_sha256)

    with ZipFile(archive_path) as archive:
        try:
            data = archive.read(member_name)
        except KeyError as error:
            raise ValueError(
                f"{archive_path.name} does not contain {member_name}"
            ) from error

    actual = hashlib.sha256(data).hexdigest()
    if actual != output_sha256:
        raise ValueError(
            f"{member_name} SHA-256 mismatch: "
            f"expected {output_sha256}, found {actual}"
        )
    _write_atomic(output_path, data)
    return output_path


def read_tap_blocks(path: Path) -> list[bytes]:
    tape = path.read_bytes()
    blocks = []
    offset = 0
    while offset < len(tape):
        if offset + 2 > len(tape):
            raise ValueError("truncated TAP block length")
        length = int.from_bytes(tape[offset : offset + 2], "little")
        offset += 2
        end = offset + length
        if length < 2 or end > len(tape):
            raise ValueError(f"invalid TAP block {len(blocks)}")
        block = tape[offset:end]
        checksum = 0
        for value in block:
            checksum ^= value
        if checksum:
            raise ValueError(f"invalid checksum in TAP block {len(blocks)}")
        blocks.append(block)
        offset = end
    return blocks


def read_tap_block_data(path: Path, index: int) -> bytes:
    try:
        block = read_tap_blocks(path)[index]
    except IndexError as error:
        raise ValueError(f"TAP block {index} not found") from error
    return block[1:-1]


@dataclass(frozen=True)
class TvcCas:
    payload: bytes
    file_type: int
    auto_run: bool
    load_address: int


def write_tvc_cas(
    path: Path,
    payload: bytes,
    *,
    file_type: int = 0,
    auto_run: bool = False,
    load_address: int = 0x19EF,
):
    path.parent.mkdir(parents=True, exist_ok=True)
    size = CAS_HEADER_SIZE + len(payload)
    blocks, remainder = divmod(size, 128)
    cas = bytearray(size)
    cas[0] = 0x11
    cas[2:4] = blocks.to_bytes(2, "little")
    cas[4:6] = remainder.to_bytes(2, "little")
    cas[CAS_APPLICATION_HEADER] = 0
    cas[CAS_APPLICATION_HEADER + 1] = file_type
    cas[CAS_APPLICATION_HEADER + 2 : CAS_APPLICATION_HEADER + 4] = (
        len(payload).to_bytes(2, "little")
    )
    cas[CAS_APPLICATION_HEADER + 4] = 0xFF if auto_run else 0
    cas[CAS_APPLICATION_HEADER + 7 : CAS_APPLICATION_HEADER + 9] = (
        load_address.to_bytes(2, "little")
    )
    cas[CAS_PAYLOAD:] = payload
    path.write_bytes(cas)


def read_tvc_cas(path: Path) -> TvcCas:
    cas = path.read_bytes()
    if len(cas) < CAS_HEADER_SIZE or cas[0] != 0x11:
        raise ValueError(f"{path} is not a supported TVC CAS file")
    blocks = int.from_bytes(cas[2:4], "little")
    remainder = int.from_bytes(cas[4:6], "little")
    if blocks * 128 + remainder != len(cas):
        raise ValueError(f"{path} has inconsistent outer CAS size metadata")
    payload_size = int.from_bytes(
        cas[CAS_APPLICATION_HEADER + 2 : CAS_APPLICATION_HEADER + 4], "little"
    )
    if CAS_PAYLOAD + payload_size != len(cas):
        raise ValueError(f"{path} has inconsistent application payload size")
    return TvcCas(
        payload=cas[CAS_PAYLOAD:],
        file_type=cas[CAS_APPLICATION_HEADER + 1],
        auto_run=cas[CAS_APPLICATION_HEADER + 4] != 0,
        load_address=int.from_bytes(
            cas[CAS_APPLICATION_HEADER + 7 : CAS_APPLICATION_HEADER + 9],
            "little",
        ),
    )
