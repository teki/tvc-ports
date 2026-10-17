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
    convert_bitmap_byte,
    convert_large_glyph,
    extract_main_font,
)
import cpc_graphics
from media import read_tap_block_data, read_tvc_cas, sha256_file
from rtvc import parse_rtvc_toml, run_tool


EXPECTED_PATCHED_CAS = {
    "LOADER.CAS": ("lasersqd_loader.cas", "3f4e274397ca6bf3547cd721569349d88229f5303a90555dbb2bdbb9ace5a03e"),
    "LS1.CAS": ("lasersqd_ls_7530_tvc.cas", "ed0fc35f04f9d8355e64cb774bfec5c67a1eacac4ad42de704c5c39ef0b83ddc"),
    "LS2.CAS": ("lasersqd_lscode_5e28_tvc.cas", "3c1949d703ddf75b008d00e7a3e1377df828fd2c0836f0bc8dd15c7722a3b360"),
}

EXPECTED_PATCHED_SIZES = {
    "LOADER.CAS": 3921,
    "LS1.CAS": 2330,
    "LS2.CAS": 22665,
}

# Translated speaker writes in LS2: TVC port 06H with amplitude 0 (81H) or 15
# (BDH). The only OUT (FEH) left are in the replaced entry and tape loader.
EXPECTED_SOUND_PATCHES = {
    0x8F47: bytes.fromhex("3ebdd306"),
    0x8F52: bytes.fromhex("3e81d306"),
    0x8F5D: bytes.fromhex("cd14b6"),
    0x94E0: bytes.fromhex("cd14b6"),
    0xB5BD: bytes.fromhex("81"),
    0xB5F3: bytes.fromhex("ee3c"),
    0xB5F8: bytes.fromhex("d306"),
    0xB614: bytes.fromhex("ed5fe6103e8128023ebdd306c9"),
}
UNREACHABLE_SPECTRUM_SPEAKER_WRITES = [0x5E37, 0xB1A5]

# One palette for every screen, initially scenario 1's CPC pens: black, bright
# red, bright magenta, and bright white. Spectrum inks map as the CPC colours
# them. Each Gxx file carries its scenario's own palette at 5480H.
EXPECTED_PALETTES = bytes((0x00, 0x44, 0x45, 0x55))
# Expected TVC palettes and the CPC Gate Array pens they come from, per scenario.
EXPECTED_SCENARIO_PALETTES = {
    "G64": (bytes((0x47, 0x4F, 0x4B)), bytes((0x00, 0x44, 0x45, 0x55))),  # pink, pastel magenta, white
    "G65": (bytes((0x5F, 0x46, 0x4B)), bytes((0x00, 0x41, 0x11, 0x55))),  # pastel blue, cyan, white
    "G66": (bytes((0x4E, 0x4C, 0x4A)), bytes((0x00, 0x14, 0x44, 0x54))),  # orange, bright red, bright yellow
    "G68": (bytes((0x4E, 0x5E, 0x4A)), bytes((0x00, 0x44, 0x14, 0x54))),  # orange, yellow, bright yellow
}
# E65FH door states whose CPC column is 0 but the Spectrum logic reaches:
# scenario 1's sliding door closes from 95 to 44, drawn as the closed double
# door (tile 43) like its twin 104.
EXPECTED_DOOR_TILES = {"G64": {0x2C: 43}}
EXPECTED_INK_PALETTE_MAPS = bytes((0, 2, 1, 1, 2, 2, 3, 3) * 7)
REFERENCE_SLOT_BYTES = (0x00, 0xF0, 0x0F, 0xFF)


def reference_bitmap_byte(value):
    """Encode one row independently, one pixel and plane pair at a time."""
    output = bytearray(2)
    for pixel in range(8):
        if value & (0x80 >> pixel):
            output[pixel // 4] |= 0x88 >> (pixel % 4)
    return bytes(output)


def reference_spectrum_tile(scenario, attribute, glyph):
    """Convert one Spectrum glyph to fixed-palette native bytes independently."""
    source_start = LARGE_SOURCE_ADDR - SCENARIO_ADDR + glyph * 32
    source = scenario[source_start:source_start + 32]
    ink = EXPECTED_INK_PALETTE_MAPS[attribute & 7]
    paper = EXPECTED_INK_PALETTE_MAPS[(attribute >> 3) & 7]
    if paper and ink == paper:
        ink = 0
    output = bytearray()
    for left, right in ((0, 8), (16, 24)):
        for row in range(8):
            for value in (source[left + row], source[right + row]):
                for mask in reference_bitmap_byte(value):
                    output.append(
                        (REFERENCE_SLOT_BYTES[ink] & mask)
                        | (REFERENCE_SLOT_BYTES[paper] & ~mask & 0xFF)
                    )
    return bytes(output)


def check_native_graphics(block_name, scenario, cpc, payload):
    """Check a Gxx file against the CPC tape or the Spectrum source."""
    low = payload[:LARGE_LOW_SIZE]
    high = payload[LARGE_LOW_SIZE:]

    def tile(number):
        if number < 89:
            return low[number * 64:number * 64 + 64]
        return high[(number - 89) * 64:(number - 89) * 64 + 64]

    palette = high[0x1480:0x1484]
    map_column = high[0x1500:0x1500 + LARGE_GLYPH_COUNT]
    temp_column = high[0x1600:0x1600 + 160]
    glyph_map = high[0x1700:0x1800]
    descriptors = scenario[
        LARGE_DESCRIPTOR_ADDR - SCENARIO_ADDR:
        LARGE_DESCRIPTOR_ADDR - SCENARIO_ADDR + LARGE_DESCRIPTOR_SIZE
    ]
    temp = scenario[0xE65F - SCENARIO_ADDR:0xE65F - SCENARIO_ADDR + 320]
    if any(value != 0xFF and value >= 171 for value in glyph_map):
        raise ValueError(f"{block_name}.CAS glyph map references a missing tile")
    if tile(0) != bytes(64):
        raise ValueError(f"{block_name}.CAS tile 0 is not blank")

    if cpc is None:
        for descriptor in range(LARGE_GLYPH_COUNT):
            attribute, glyph = descriptors[descriptor * 2:descriptor * 2 + 2]
            expected = reference_spectrum_tile(scenario, attribute, glyph)
            if tile(map_column[descriptor]) != expected:
                raise ValueError(
                    f"{block_name}.CAS descriptor {descriptor:02X}H differs"
                )
        if temp_column != bytes([0xFE] * 160) or glyph_map != bytes([0] + [0xFF] * 255):
            raise ValueError(f"{block_name}.CAS fallback lookups are not raw")
        if palette != EXPECTED_PALETTES:
            raise ValueError(f"{block_name}.CAS fallback palette differs")
        return "Spectrum"

    def cpc_bytes(address, size):
        return cpc[address - 0x6369:address - 0x6369 + size]

    expected_pens, expected_palette = EXPECTED_SCENARIO_PALETTES[block_name]
    if cpc_bytes(0x644E, 3) != expected_pens:
        raise ValueError(f"{block_name} CPC pens differ from the recorded tape")
    if palette != expected_palette:
        raise ValueError(f"{block_name}.CAS palette differs from the CPC pens")

    door_column = bytearray(cpc_bytes(0x93FF, 160))
    for descriptor, door_tile in EXPECTED_DOOR_TILES.get(block_name, {}).items():
        if door_column[descriptor] != 0:
            raise ValueError(f"{block_name} CPC E65FH {descriptor:02X}H is not blank")
        door_column[descriptor] = door_tile
    for column, source_column, count, name in (
        (map_column, cpc_bytes(0x949F, LARGE_GLYPH_COUNT), LARGE_GLYPH_COUNT, "E79FH"),
        (temp_column, door_column, 160, "E65FH"),
    ):
        for descriptor in range(count):
            value = column[descriptor]
            source = source_column[descriptor]
            if value < 0xFE:
                if value != source:
                    raise ValueError(f"{block_name}.CAS {name} {descriptor:02X}H differs")
            elif value == 0xFE and source < 171:
                live = temp[descriptor * 2 + 1] if name == "E65FH" else None
                if live is None or glyph_map[live] != source:
                    raise ValueError(
                        f"{block_name}.CAS {name} {descriptor:02X}H defers wrongly"
                    )
            elif value != 0xFE:
                raise ValueError(f"{block_name}.CAS {name} {descriptor:02X}H is invalid")
    for number in range(1, 171):
        if tile(number) != cpc_bytes(0x953F + number * 64, 64):
            raise ValueError(f"{block_name}.CAS tile {number} differs from the CPC tape")
    return "CPC"


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
        for addr, expected in EXPECTED_SOUND_PATCHES.items():
            offset = addr - 0x5E28
            if bytes(lscode_cas.payload[offset:offset + len(expected)]) != expected:
                raise ValueError(f"LS2.CAS speaker translation differs at {addr:04X}H")
        payload = lscode_cas.payload
        speaker_writes = [
            0x5E28 + i for i in range(len(payload) - 1)
            if payload[i] == 0xD3 and payload[i + 1] == 0xFE
        ]
        if speaker_writes != UNREACHABLE_SPECTRUM_SPEAKER_WRITES:
            raise ValueError(
                "LS2.CAS has untranslated OUT (FEH) at "
                + ", ".join(f"{a:04X}H" for a in speaker_writes)
            )
        save_entry = symbols["TVC_SAVELOAD"]
        if lscode_call(0xB15C) != bytes((0xC3, save_entry & 0xFF, save_entry >> 8)):
            raise ValueError("LS2.CAS save/load entry is not hooked")
        multiload_offset = symbols["TVC_MULTILOAD"] - loader.load_address
        scenario_id = runtime_support("TVC_SCENARIO_ID")
        if loader.payload[multiload_offset:multiload_offset + 3] != bytes(
            (0x32, scenario_id & 0xFF, scenario_id >> 8)
        ):
            raise ValueError("TVC_MULTILOAD does not record the block ID in A")
        if symbols["TVC_NATIVE_FONT_END"] > laser_build.TVC_SUPPORT_ADDR:
            raise ValueError("native font overlaps resident support")
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

        hidden_start = symbols["TVC_HIDDEN_CODE_IMAGE"]
        hidden_end = symbols["TVC_HIDDEN_CODE_IMAGE_END"]
        hidden_offset = hidden_start - loader.load_address
        expected_hidden = loader.payload[
            hidden_offset:hidden_offset + hidden_end - hidden_start
        ]
        hidden_document = parse_rtvc_toml(
            build_dir / "lasersqd_tvc_hidden_video.toml"
        )
        hidden_segment = hidden_document["segments"][0]
        if hidden_segment["addr"] != symbols["TVC_HIDDEN_CODE_RUN"]:
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
        cpc_tapes = laser_build.source_cdt()
        for block_name, (block_index, flag) in laser_build.NATIVE_GRAPHICS_BLOCKS.items():
            scenario = read_tap_block_data(source_tap, block_index)
            cpc = cpc_graphics.read_cpc_scenario(cpc_tapes, flag)
            cas = read_tvc_cas(build_dir / f"{block_name.lower()}.cas")
            if cas.file_type != 0 or cas.auto_run:
                raise ValueError(f"{block_name}.CAS has unexpected TVC metadata")
            if cas.load_address != 0x19EF:
                raise ValueError(f"{block_name}.CAS has unexpected load address")
            if len(cas.payload) != LARGE_LOW_SIZE + LARGE_HIGH_SIZE:
                raise ValueError(f"{block_name}.CAS has an invalid native size")
            source = check_native_graphics(block_name, scenario, cpc, cas.payload)
            print(f"verified {block_name}.CAS against {source} graphics")
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
        print(f"verified {native_graphics_files} native graphics CAS payloads")
        print(f"verified {len(entries)} DSK directory entries")
        print("Laser Squad clean build smoke checks passed")


if __name__ == "__main__":
    verify()
