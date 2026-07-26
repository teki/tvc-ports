#!/usr/bin/env python3
"""Rebuild the canonical and loader-wait SkoolKit disassemblies."""

from __future__ import annotations

from pathlib import Path
import subprocess
import sys


DISASSEMBLY_DIR = Path(__file__).resolve().parent
PORT_ROOT = DISASSEMBLY_DIR.parent
sys.path.insert(0, str(PORT_ROOT))

from prepare import acquire_source
from media import verify_sha256


SKOOL_BIN = Path(sys.executable).parent


def command(name: str) -> Path:
    path = SKOOL_BIN / name
    if not path.is_file():
        raise FileNotFoundError(
            f"cannot find {name} beside {sys.executable}; "
            "run this script with the disassembly virtual environment"
        )
    return path


def run(name: str, *arguments):
    subprocess.run(
        [str(command(name)), *(str(argument) for argument in arguments)],
        cwd=DISASSEMBLY_DIR,
        check=True,
    )


def capture(path: Path, name: str, *arguments):
    with path.open("wb") as output:
        subprocess.run(
            [str(command(name)), *(str(argument) for argument in arguments)],
            cwd=DISASSEMBLY_DIR,
            check=True,
            stdout=output,
        )


def verify_outputs():
    for line in (DISASSEMBLY_DIR / "SHA256SUMS").read_text().splitlines():
        expected, filename = line.split(maxsplit=1)
        verify_sha256(DISASSEMBLY_DIR / filename, expected)


def rebuild():
    tape = acquire_source()
    capture(DISASSEMBLY_DIR / "tape-info.txt", "tapinfo.py", tape)

    canonical_snapshot = DISASSEMBLY_DIR / "lasersqd.z80"
    run(
        "tap2sna.py",
        "--ram",
        "load=4,30000",
        "--ram",
        "load=6,24104",
        "--start",
        "24104",
        "--stack",
        "24100",
        tape,
        canonical_snapshot,
    )
    canonical_control = DISASSEMBLY_DIR / "lasersqd.ctl"
    capture(
        canonical_control,
        "sna2ctl.py",
        "--comments",
        "--handle-rst",
        "--hex",
        "--start",
        "0x5E28",
        "--end",
        "0xB621",
        canonical_snapshot,
    )
    canonical_skool = DISASSEMBLY_DIR / "lasersqd.skool"
    capture(
        canonical_skool,
        "sna2skool.py",
        "--comments",
        "--handle-rst",
        "--hex",
        "-c",
        canonical_control,
        canonical_snapshot,
    )
    capture(
        DISASSEMBLY_DIR / "lasersqd.asm",
        "skool2asm.py",
        "--create-labels",
        "--hex",
        canonical_skool,
    )
    capture(
        DISASSEMBLY_DIR / "snapshot-info.txt",
        "snapinfo.py",
        canonical_snapshot,
    )

    loader_snapshot = DISASSEMBLY_DIR / "lasersqd-loader-wait.z80"
    run("tap2sna.py", tape, loader_snapshot)
    loader_control = DISASSEMBLY_DIR / "lasersqd-loader-wait.ctl"
    capture(
        loader_control,
        "sna2ctl.py",
        "--comments",
        "--handle-rst",
        "--hex",
        loader_snapshot,
    )
    loader_skool = DISASSEMBLY_DIR / "lasersqd-loader-wait.skool"
    capture(
        loader_skool,
        "sna2skool.py",
        "--comments",
        "--handle-rst",
        "--hex",
        "-c",
        loader_control,
        loader_snapshot,
    )
    capture(
        DISASSEMBLY_DIR / "lasersqd-loader-wait.asm",
        "skool2asm.py",
        "--create-labels",
        "--hex",
        loader_skool,
    )

    verify_outputs()


if __name__ == "__main__":
    rebuild()
