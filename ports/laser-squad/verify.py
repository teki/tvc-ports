#!/usr/bin/env python3
"""Clean-build and smoke-check the Laser Squad TVC disk image."""

from __future__ import annotations

from pathlib import Path
import re
import sys
import tempfile


PORT_ROOT = Path(__file__).resolve().parent
REPO_ROOT = PORT_ROOT.parents[1]
sys.path.insert(0, str(REPO_ROOT / "tools"))

import build as laser_build
from media import read_tap_block_data, read_tvc_cas, sha256_file
from rtvc import run_tool


EXPECTED_PATCHED_CAS = {
    "LOADER.CAS": ("lasersqd_loader.cas", "d1266b889c17dd95b60445f9ad818bae8b1b7f9e2c9b2d2dd0024a70428c0e56"),
    "LS1.CAS": ("lasersqd_ls_7530_tvc.cas", "3db8073b5e2ec7413b18856a9040327bb72518b2c85513d49d457c9eed7db934"),
    "LS2.CAS": ("lasersqd_lscode_5e28_tvc.cas", "3d46e19a0dfdf5648bf190c0f944b0d479258aebcf4b792e21123f9be344acee"),
}

EXPECTED_PATCHED_SIZES = {
    "LOADER.CAS": 1534,
    "LS1.CAS": 2320,
    "LS2.CAS": 22665,
}


def expected_sizes():
    sizes = dict(EXPECTED_PATCHED_SIZES)
    for block_name in laser_build.MULTILOAD_BLOCKS:
        sizes[f"{block_name}.CAS"] = 144 + 0x49DF
    return sizes


def parse_directory(text: str):
    entries = {}
    for line in text.splitlines():
        match = re.fullmatch(r"(\S+)\s+(\d+)\s*", line)
        if match:
            entries[match.group(1)] = int(match.group(2))
    return entries


def verify():
    with tempfile.TemporaryDirectory(prefix="laser-squad-verify-") as temporary:
        root = Path(temporary)
        build_dir = root / "build"
        dist_dir = root / "dist"
        disk = laser_build.build(build_dir, dist_dir)

        for disk_name, (build_name, expected_hash) in EXPECTED_PATCHED_CAS.items():
            path = build_dir / build_name
            actual = sha256_file(path)
            if actual != expected_hash:
                raise ValueError(
                    f"{disk_name} SHA-256 mismatch: "
                    f"expected {expected_hash}, found {actual}"
                )
            cas = read_tvc_cas(path)
            expected_file_type = 1 if disk_name == "LOADER.CAS" else 0
            if cas.file_type != expected_file_type:
                raise ValueError(f"{disk_name} has unexpected TVC file type")
            if cas.auto_run != (disk_name == "LOADER.CAS"):
                raise ValueError(f"{disk_name} has unexpected autorun metadata")
            if cas.load_address != 0x19EF:
                raise ValueError(f"{disk_name} has unexpected load address")

        source_tap = laser_build.SOURCES_DIR / "LASERSQD.TAP"
        scenario_files = 0
        for block_name, block_index in laser_build.MULTILOAD_BLOCKS.items():
            payload = read_tap_block_data(source_tap, block_index)
            disk_name = f"{block_name}.CAS"
            cas = read_tvc_cas(build_dir / disk_name.lower())
            if cas.file_type != 0 or cas.auto_run:
                raise ValueError(f"{disk_name} has unexpected TVC metadata")
            if cas.load_address != 0x19EF:
                raise ValueError(f"{disk_name} has unexpected load address")
            if cas.payload != payload:
                raise ValueError(
                    f"{disk_name} does not match TAP block {block_index}"
                )
            scenario_files += 1

        result = run_tool(
            "rtvc-dsk",
            ["dir", disk],
            cwd=PORT_ROOT,
            capture_output=True,
        )
        entries = parse_directory(result.stdout)
        sizes = expected_sizes()
        if entries != sizes:
            raise ValueError(
                f"unexpected DSK directory\nexpected: {sizes}\n"
                f"found: {entries}"
            )

        print(f"verified {len(EXPECTED_PATCHED_CAS)} patched CAS hashes")
        print(f"verified {scenario_files} scenario CAS payloads against the TAP")
        print(f"verified {len(entries)} DSK directory entries")
        print("Laser Squad clean build smoke checks passed")


if __name__ == "__main__":
    verify()
