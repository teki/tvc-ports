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
from graphics import (
    FONT_NATIVE_SIZE,
    LARGE_HIGH_SIZE,
    LARGE_LOW_SIZE,
    convert_bitmap_byte,
    extract_large_graphics,
    extract_main_font,
    split_large_graphics,
)
from media import read_tap_block_data, read_tvc_cas, sha256_file
from rtvc import parse_rtvc_toml, run_tool


EXPECTED_PATCHED_CAS = {
    "LOADER.CAS": ("lasersqd_loader.cas", "caee2031e70a52c61ad52f913c64be5fdb370f290aa59f468b1a8ca5c219dafd"),
    "LS1.CAS": ("lasersqd_ls_7530_tvc.cas", "3db8073b5e2ec7413b18856a9040327bb72518b2c85513d49d457c9eed7db934"),
    "LS2.CAS": ("lasersqd_lscode_5e28_tvc.cas", "6c9172655cc6017423434ad8f210153ff485e53c278cefc7f593b5de0bac864f"),
}

EXPECTED_PATCHED_SIZES = {
    "LOADER.CAS": 3809,
    "LS1.CAS": 2320,
    "LS2.CAS": 22665,
}


def reference_bitmap_byte(value):
    """Encode one row independently, one pixel and plane pair at a time."""
    output = bytearray(2)
    for pixel in range(8):
        if value & (0x80 >> pixel):
            output[pixel // 4] |= 0x88 >> (pixel % 4)
    return bytes(output)


def expected_sizes():
    sizes = dict(EXPECTED_PATCHED_SIZES)
    for block_name in laser_build.MULTILOAD_BLOCKS:
        sizes[f"{block_name}.CAS"] = 144 + 0x49DF
    for block_name in laser_build.NATIVE_GRAPHICS_BLOCKS:
        sizes[f"{block_name}.CAS"] = 144 + LARGE_LOW_SIZE + LARGE_HIGH_SIZE
    return sizes


def parse_directory(text: str):
    entries = {}
    for line in text.splitlines():
        match = re.fullmatch(r"(\S+)\s+(\d+)\s*", line)
        if match:
            entries[match.group(1)] = int(match.group(2))
    return entries


def verify():
    for value in range(0x100):
        if convert_bitmap_byte(value) != reference_bitmap_byte(value):
            raise ValueError(f"native row conversion failed for {value:02X}H")

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
        lscode = read_tap_block_data(source_tap, 5)
        expected_font = extract_main_font(lscode)
        loader = read_tvc_cas(build_dir / "lasersqd_loader.cas")
        symbols = parse_rtvc_toml(
            build_dir / "lasersqd_loader_bootstrap.toml"
        )["symbols"]
        font_offset = symbols["TVC_NATIVE_FONT"] - loader.load_address
        actual_font = loader.payload[font_offset:font_offset + FONT_NATIVE_SIZE]
        if actual_font != expected_font:
            raise ValueError("LOADER.CAS does not contain the converted main font")

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

        native_graphics_files = 0
        for block_name, block_index in laser_build.NATIVE_GRAPHICS_BLOCKS.items():
            scenario = read_tap_block_data(source_tap, block_index)
            expected = extract_large_graphics(scenario)
            low, high = split_large_graphics(expected)
            if len(low) != LARGE_LOW_SIZE or len(high) != LARGE_HIGH_SIZE:
                raise ValueError(f"{block_name}.CAS has an invalid native split")
            cas = read_tvc_cas(build_dir / f"{block_name.lower()}.cas")
            if cas.file_type != 0 or cas.auto_run:
                raise ValueError(f"{block_name}.CAS has unexpected TVC metadata")
            if cas.load_address != 0x19EF:
                raise ValueError(f"{block_name}.CAS has unexpected load address")
            if cas.payload != expected:
                raise ValueError(
                    f"{block_name}.CAS does not match converted TAP block {block_index}"
                )
            native_graphics_files += 1

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
        print(f"verified {native_graphics_files} offline-converted graphics CAS payloads")
        print(f"verified {len(entries)} DSK directory entries")
        print("Laser Squad clean build smoke checks passed")


if __name__ == "__main__":
    verify()
