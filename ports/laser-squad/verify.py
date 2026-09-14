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
    LARGE_DESCRIPTOR_ADDR,
    LARGE_DESCRIPTOR_SIZE,
    LARGE_GLYPH_COUNT,
    LARGE_HIGH_SIZE,
    LARGE_LOW_SIZE,
    LARGE_SOURCE_ADDR,
    LARGE_SOURCE_SIZE,
    SCENARIO_ADDR,
    colorize_native,
    convert_bitmap_byte,
    convert_large_glyph,
    extract_main_font,
    split_large_graphics,
)
from media import read_tap_block_data, read_tvc_cas, sha256_file
from rtvc import parse_rtvc_toml, run_tool


EXPECTED_PATCHED_CAS = {
    "LOADER.CAS": ("lasersqd_loader.cas", "95b7d5299d900df5def6c210d97f4e570c205d51c3887312f8ee23811b095859"),
    "LS1.CAS": ("lasersqd_ls_7530_tvc.cas", "3b8efc05885080fd82704b01b2cc7b3604530871c6637f4ad4fb80235dcddf8f"),
    "LS2.CAS": ("lasersqd_lscode_5e28_tvc.cas", "65fb4de0f55b1ed984a382aac2f4311adfbb96af380d8fafc7851d341809871b"),
}

EXPECTED_PATCHED_SIZES = {
    "LOADER.CAS": 7715,
    "LS1.CAS": 2320,
    "LS2.CAS": 22665,
}

EXPECTED_PALETTES = bytes((
    0x00, 0x51, 0x54, 0x44,
    0x00, 0x50, 0x54, 0x44,
    0x00, 0x50, 0x51, 0x54,
    0x00, 0x15, 0x51, 0x54,
    0x00, 0x51, 0x54, 0x45,
    0x00, 0x54, 0x50, 0x51,
    0x00, 0x15, 0x54, 0x51,
))

EXPECTED_INK_PALETTE_MAPS = bytes((
    0, 1, 3, 3, 1, 1, 2, 2,
    0, 1, 3, 3, 1, 1, 2, 2,
    0, 2, 3, 2, 1, 2, 3, 2,
    0, 2, 3, 3, 1, 2, 3, 1,
    0, 1, 3, 3, 1, 1, 2, 2,
    0, 2, 1, 1, 2, 3, 1, 1,
    0, 3, 1, 1, 1, 3, 2, 1,
))


def reference_bitmap_byte(value):
    """Encode one row independently, one pixel and plane pair at a time."""
    output = bytearray(2)
    for pixel in range(8):
        if value & (0x80 >> pixel):
            output[pixel // 4] |= 0x88 >> (pixel % 4)
    return bytes(output)


def reference_descriptor_graphics(scenario):
    """Build the expected table independently in scenario-descriptor order."""
    descriptor_start = LARGE_DESCRIPTOR_ADDR - SCENARIO_ADDR
    source_start = LARGE_SOURCE_ADDR - SCENARIO_ADDR
    descriptors = scenario[
        descriptor_start:descriptor_start + LARGE_DESCRIPTOR_SIZE
    ]
    source = scenario[source_start:source_start + LARGE_SOURCE_SIZE]
    if len(descriptors) != LARGE_DESCRIPTOR_SIZE or len(source) != LARGE_SOURCE_SIZE:
        raise ValueError("scenario is missing large-graphics data")
    output = bytearray()
    for descriptor in range(LARGE_GLYPH_COUNT):
        glyph = descriptors[descriptor * 2 + 1]
        if glyph >= LARGE_GLYPH_COUNT:
            raise ValueError(f"descriptor {descriptor:02X}H has invalid glyph")
        start = glyph * 32
        glyph_source = source[start:start + 32]
        for left, right in ((0, 8), (16, 24)):
            for row in range(8):
                output.extend(reference_bitmap_byte(glyph_source[left + row]))
                output.extend(reference_bitmap_byte(glyph_source[right + row]))
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
    ordered_probe = bytes(range(32))
    expected_probe = bytearray()
    for left, right in ((0, 8), (16, 24)):
        for row in range(8):
            expected_probe.extend(reference_bitmap_byte(ordered_probe[left + row]))
            expected_probe.extend(reference_bitmap_byte(ordered_probe[right + row]))
    if convert_large_glyph(ordered_probe) != expected_probe:
        raise ValueError("large-glyph scanline ordering failed")

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
        palette_offset = symbols["TVC_PALETTES"] - loader.load_address
        actual_palettes = loader.payload[
            palette_offset:palette_offset + len(EXPECTED_PALETTES)
        ]
        if actual_palettes != EXPECTED_PALETTES:
            raise ValueError("LOADER.CAS has unexpected TVC palette profiles")
        maps_offset = symbols["TVC_INK_PALETTE_MAPS"] - loader.load_address
        actual_maps = loader.payload[
            maps_offset:maps_offset + len(EXPECTED_INK_PALETTE_MAPS)
        ]
        if actual_maps != EXPECTED_INK_PALETTE_MAPS:
            raise ValueError("LOADER.CAS has unexpected Spectrum ink maps")
        support_base = symbols["TVC_SUPPORT_IMAGE"]
        lscode_cas = read_tvc_cas(build_dir / "lasersqd_lscode_5e28_tvc.cas")

        def runtime_support(name):
            return laser_build.TVC_SUPPORT_ADDR + symbols[name] - support_base

        def lscode_call(addr):
            offset = addr - 0x5E28
            return bytes(lscode_cas.payload[offset:offset + 3])

        def expected_call(name):
            target = runtime_support(name)
            return bytes((0xCD, target & 0xFF, target >> 8))

        def expected_jump(name):
            target = runtime_support(name)
            return bytes((0xC3, target & 0xFF, target >> 8))

        if lscode_call(0x875A) != expected_call("TVC_UNIT_INFO_SCREEN_CLEAR"):
            raise ValueError("LS2.CAS unit-information entry is not hooked")
        if lscode_call(0x8875) != expected_call("TVC_UNIT_INFO_SCREEN_EXIT"):
            raise ValueError("LS2.CAS unit-information exit is not hooked")
        if lscode_call(0xB1F7) != expected_call("TVC_MOVEMENT_SCREEN_CLEAR"):
            raise ValueError("LS2.CAS hidden-movement entry is not hooked")
        if runtime_support("TVC_UNIT_INFO_SCREEN_EXIT") != runtime_support(
            "TVC_FIRE_SCREEN_EXIT"
        ):
            raise ValueError("unit-information and firing exits must share restoration")
        joystick = expected_jump("TVC_JOYSTICK")
        if lscode_call(0xB0E8) != joystick:
            raise ValueError("LS2.CAS Sinclair control is not hooked to the TVC joystick")
        if lscode_call(0xB0FD) != joystick:
            raise ValueError("LS2.CAS Kempston control is not hooked to the TVC joystick")
        if lscode_call(0xB117) != joystick:
            raise ValueError("LS2.CAS cursor control is not hooked to the TVC joystick")
        if lscode_call(0xB136) != expected_jump("TVC_GAME_KEYS"):
            raise ValueError("LS2.CAS keyboard control is not hooked")
        save_entry = symbols["TVC_SAVELOAD"]
        if lscode_call(0xB15C) != bytes((0xC3, save_entry & 0xFF, save_entry >> 8)):
            raise ValueError("LS2.CAS save/load entry is not hooked")
        multiload_offset = symbols["TVC_MULTILOAD"] - loader.load_address
        if loader.payload[multiload_offset:multiload_offset + 2] != b"\xfe\x64":
            raise ValueError("TVC_MULTILOAD does not start from the block ID in A")
        if symbols["TVC_NATIVE_FONT_END"] > laser_build.TVC_SUPPORT_ADDR:
            raise ValueError("native font overlaps resident support")
        if not (
            support_base
            <= symbols["TVC_COPY_SAFE_AND"]
            < symbols["TVC_SUPPORT_IMAGE_END"]
        ):
            raise ValueError("native color masks must remain in resident U0 support")
        save_header = symbols["TVC_SAVE_HEADER"] - loader.load_address
        if loader.payload[save_header:save_header + 16] != (
            b"\x00\x00\xdf\x49" + bytes(12)
        ):
            raise ValueError("LOADER.CAS save header is not a 49DFH data file")
        save_name = symbols["TVC_SAVE_NAME"] - loader.load_address
        if loader.payload[save_name:save_name + 5] != b"\x04SAVE":
            raise ValueError("LOADER.CAS save slot is not SAVE.CAS")
        font_offset = symbols["TVC_NATIVE_FONT"] - loader.load_address
        actual_font = loader.payload[font_offset:font_offset + FONT_NATIVE_SIZE]
        if actual_font != expected_font:
            raise ValueError("LOADER.CAS does not contain the converted main font")
        for slot in (1, 2):
            start = symbols[f"TVC_NATIVE_FONT_SLOT{slot}_SOURCE"] - loader.load_address
            actual_variant = loader.payload[start:start + FONT_NATIVE_SIZE]
            if actual_variant != colorize_native(expected_font, slot):
                raise ValueError(
                    f"LOADER.CAS does not contain the slot-{slot} main-font variant"
                )

        hidden_start = symbols["TVC_NATIVE_FONT_SLOT1_SOURCE"]
        hidden_end = symbols["TVC_HIDDEN_CODE_IMAGE_END"]
        hidden_offset = hidden_start - loader.load_address
        expected_hidden = loader.payload[
            hidden_offset:hidden_offset + hidden_end - hidden_start
        ]
        hidden_document = parse_rtvc_toml(
            build_dir / "lasersqd_tvc_hidden_video.toml"
        )
        hidden_segment = hidden_document["segments"][0]
        if hidden_segment["addr"] != symbols["TVC_NATIVE_FONT_SLOT1_RUN"]:
            raise ValueError("hidden VID0 payload has an unexpected runtime address")
        if bytes(hidden_segment["bytes"]) != expected_hidden:
            raise ValueError("hidden VID0 payload does not match LOADER.CAS")
        if hidden_document["next_addr"] > 0xC000:
            raise ValueError("hidden VID0 payload exceeds its mapped page")

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
            expected = reference_descriptor_graphics(scenario)
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
