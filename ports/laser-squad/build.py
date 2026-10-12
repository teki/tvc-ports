#!/usr/bin/env python3
"""Build the Laser Squad TVC disk image from tracked sources."""

import argparse
import pathlib
import sys


PORT_ROOT = pathlib.Path(__file__).resolve().parent
REPO_ROOT = PORT_ROOT.parents[1]
sys.path.insert(0, str(REPO_ROOT / "tools"))

from media import read_tap_block_data, read_tvc_cas, write_tvc_cas
from graphics import (
    FONT_NATIVE_SIZE,
    LARGE_HIGH_SIZE,
    LARGE_LOW_SIZE,
    extract_descriptor_large_graphics,
    extract_main_font,
    split_large_graphics,
)
from rtvc import (
    parse_rtvc_toml,
    read_single_segment,
    run_tool,
    write_single_segment,
)
from prepare import prepare as prepare_sources


SRC_DIR = PORT_ROOT / "src"
SOURCES_DIR = PORT_ROOT / "sources"
WORK_DIR = PORT_ROOT / "build"
OUT_DIR = PORT_ROOT / "dist"
DISK = OUT_DIR / "lasersqd_tvc.dsk"
LOADER_CAS = WORK_DIR / "lasersqd_loader.cas"
FIRST_BLOCK_CAS = WORK_DIR / "lasersqd_ls_7530_tvc.cas"
SECOND_BLOCK_CAS = WORK_DIR / "lasersqd_lscode_5e28_tvc.cas"
LOADER_BOOTSTRAP_ASM = SRC_DIR / "lasersqd_loader.asm"
LOADER_BOOTSTRAP_TOML = WORK_DIR / "lasersqd_loader_bootstrap.toml"
TVC_SUPPORT_TOML = WORK_DIR / "lasersqd_tvc_support.toml"
TVC_FONT_TOML = WORK_DIR / "lasersqd_tvc_font.toml"
TVC_HIDDEN_VIDEO_TOML = WORK_DIR / "lasersqd_tvc_hidden_video.toml"

FIRST_BLOCK_ADDR = 0x7530
SECOND_BLOCK_ADDR = 0x5E28
FIRST_BLOCK_DISK_NAME = "LS1.CAS"
SECOND_BLOCK_DISK_NAME = "LS2.CAS"
TVC_SUPPORT_ADDR = 0x21BC
MULTILOAD_BLOCKS = {
    "L64": 6,
    "L65": 7,
    "L66": 8,
    "L68": 9,
}
NATIVE_GRAPHICS_BLOCKS = {
    "G64": 6,
    "G65": 7,
    "G66": 8,
    "G68": 9,
}


def run(name, args):
    run_tool(name, args, cwd=PORT_ROOT)


def build_first_block(first_block_toml, first_block_bin):
    original_toml = WORK_DIR / "lasersqd_ls_7530_original.toml"
    patch_toml = WORK_DIR / "lasersqd_ls_7530_tvc_patches.toml"
    run(
        "rtvc-asm",
        [
            "--origin", "7530H", str(SRC_DIR / "lasersqd_ls_7530.asm"),
            "-o", str(original_toml),
        ],
    )
    block = bytearray(read_single_segment(original_toml))
    run(
        "rtvc-asm",
        [
            "--origin", "7530H", str(SRC_DIR / "lasersqd_ls_7530_tvc.asm"),
            "-o", str(patch_toml),
        ],
    )
    patches = parse_rtvc_toml(patch_toml).get("segments", [])
    for segment in patches:
        offset = segment["addr"] - FIRST_BLOCK_ADDR
        if offset < 0:
            raise ValueError(f"first-stage patch begins below {FIRST_BLOCK_ADDR:04X}H")
        end = offset + len(segment["bytes"])
        if end > len(block):
            block.extend([0x00] * (end - len(block)))
        block[offset:end] = bytes(segment["bytes"])
    first_block_bin.write_bytes(block)
    write_single_segment(
        first_block_toml,
        "src/lasersqd_ls_7530.asm + src/lasersqd_ls_7530_tvc.asm",
        FIRST_BLOCK_ADDR,
        block,
    )


def build_second_block(second_block_toml, second_block_bin, support_addresses):
    source_tap = SOURCES_DIR / "LASERSQD.TAP"
    patch_toml = WORK_DIR / "lasersqd_lscode_5e28_tvc_patches.toml"
    block = bytearray(read_tap_block_data(source_tap, 5))
    if len(block) != 0x57F9:
        raise ValueError(f"unexpected LSCODE size {len(block):04X}H")
    definitions = []
    for name, address in support_addresses.items():
        definitions.extend(["-d", f"{name}={address:04X}H"])
    run(
        "rtvc-asm",
        [
            "--origin", "5E28H", str(SRC_DIR / "lasersqd_lscode_5e28_tvc.asm"),
            *definitions,
            "-o", str(patch_toml),
        ],
    )
    for segment in parse_rtvc_toml(patch_toml).get("segments", []):
        offset = segment["addr"] - SECOND_BLOCK_ADDR
        end = offset + len(segment["bytes"])
        if offset < 0 or end > len(block):
            raise ValueError("second-stage patch lies outside the original LSCODE payload")
        block[offset:end] = bytes(segment["bytes"])
    second_block_bin.write_bytes(block)
    write_single_segment(
        second_block_toml,
        "sources/LASERSQD.TAP block 5 + src/lasersqd_lscode_5e28_tvc.asm",
        SECOND_BLOCK_ADDR,
        block,
    )


def build_loader_cas(first_block_size, second_block_size, native_font):
    definitions = [
        "-d", f"FIRST_BLOCK_SIZE={first_block_size:04X}H",
        "-d", f"SECOND_BLOCK_SIZE={second_block_size:04X}H",
    ]
    run(
        "rtvc-asm",
        [
            "--format",
            "cas",
            *definitions,
            str(LOADER_BOOTSTRAP_ASM),
            "-o",
            str(LOADER_CAS),
        ]
    )
    run(
        "rtvc-asm",
        [
            *definitions,
            str(LOADER_BOOTSTRAP_ASM),
            "-o",
            str(LOADER_BOOTSTRAP_TOML),
        ]
    )
    document = parse_rtvc_toml(LOADER_BOOTSTRAP_TOML)
    symbols = document["symbols"]
    hidden_code_start = symbols["TVC_HIDDEN_CODE_IMAGE"]
    hidden_end = symbols["TVC_HIDDEN_CODE_IMAGE_END"]
    if hidden_end - hidden_code_start > 0x400:
        raise ValueError("loader hidden VID0 copy engine exceeds its 1 KiB reservation")
    font_start = symbols["TVC_NATIVE_FONT"]
    font_end = symbols["TVC_NATIVE_FONT_END"]
    if font_end - font_start != FONT_NATIVE_SIZE:
        raise ValueError("loader native-font reservation has the wrong size")
    if font_end > TVC_SUPPORT_ADDR:
        raise ValueError("loader native font overlaps resident TVC support")
    if len(native_font) != FONT_NATIVE_SIZE:
        raise ValueError("converted native font has the wrong size")
    cas = read_tvc_cas(LOADER_CAS)
    offset = font_start - cas.load_address
    end = offset + len(native_font)
    if offset < 0 or end > len(cas.payload):
        raise ValueError("loader native-font reservation lies outside its payload")
    payload = bytearray(cas.payload)
    if any(payload[offset:end]):
        raise ValueError("loader native-font reservation is not empty")
    payload[offset:end] = native_font
    write_tvc_cas(
        LOADER_CAS,
        payload,
        file_type=cas.file_type,
        auto_run=cas.auto_run,
        load_address=cas.load_address,
    )
    write_single_segment(
        TVC_FONT_TOML,
        "offline-converted LSCODE printable font",
        font_start,
        native_font,
    )


def loader_support_addresses():
    document = parse_rtvc_toml(LOADER_BOOTSTRAP_TOML)
    symbols = document.get("symbols", {})
    source_base = symbols["TVC_SUPPORT_IMAGE"]
    names = (
        "TVC_MAIN_ENTRY",
        "TVC_JOYSTICK",
        "TVC_KEY_SCAN",
        "TVC_CONTROLS_SCREEN_CLEAR",
        "TVC_CONTROLS_SELECTED",
        "TVC_TEAM_SETUP_CLEAR",
        "TVC_PLACEMENT_SCREEN_CLEAR",
        "TVC_MOVEMENT_SCREEN_CLEAR",
        "TVC_MOVEMENT_COMPLETE",
        "TVC_FIRE_SCREEN_CLEAR",
        "TVC_FIRE_SCREEN_EXIT",
        "TVC_UNIT_INFO_SCREEN_CLEAR",
        "TVC_UNIT_INFO_SCREEN_EXIT",
        "TVC_STORE_ATTRIBUTE_AND_REDRAW",
        "TVC_GAME_KEYS",
        "TVC_MULTILOAD",
        "TVC_CLEAR_SCREEN",
        "TVC_DRAW_NORMAL",
        "TVC_DRAW_DOUBLE",
        "TVC_DRAW_LARGE",
        "TVC_DRAW_LARGE_GRID",
        "TVC_DRAW_TILE",
        "TVC_PLOT_PIXEL",
    )
    addresses = {
        name: TVC_SUPPORT_ADDR + symbols[name] - source_base
        for name in names
    }
    addresses["TVC_SAVELOAD"] = symbols["TVC_SAVELOAD"]
    addresses["TVC_DRAW_LARGE_LOOKUP_MAPPED"] = symbols[
        "TVC_DRAW_LARGE_LOOKUP_MAPPED_RUN"
    ]
    return addresses


def write_loader_support_toml():
    document = parse_rtvc_toml(LOADER_BOOTSTRAP_TOML)
    symbols = document["symbols"]
    segment = document["segments"][0]
    source_base = symbols["TVC_SUPPORT_IMAGE"]
    source_end = symbols["TVC_SUPPORT_IMAGE_END"]
    support_size = source_end - source_base
    runtime_end = TVC_SUPPORT_ADDR + support_size
    source_and_destination_overlap = (
        source_base < runtime_end and TVC_SUPPORT_ADDR < source_end
    )
    if source_and_destination_overlap and source_base != TVC_SUPPORT_ADDR:
        copy_direction = symbols["TVC_SUPPORT_COPY_DIRECTION"] - segment["addr"]
        instruction = bytes(segment["bytes"][copy_direction:copy_direction + 2])
        expected = b"\xED\xB0" if TVC_SUPPORT_ADDR < source_base else b"\xED\xB8"
        mnemonic = "forward LDIR" if expected == b"\xED\xB0" else "backward LDDR"
        if instruction != expected:
            raise ValueError(
                f"overlapping TVC support relocation must use {mnemonic}"
            )
    start = symbols["TVC_SUPPORT_IMAGE"] - segment["addr"]
    end = symbols["TVC_SUPPORT_IMAGE_END"] - segment["addr"]
    if runtime_end > symbols["TVC_LARGE_NATIVE_LOW_RUN"]:
        raise ValueError(
            f"TVC support overlaps native graphics RAM: end {runtime_end:04X}H"
        )
    write_single_segment(
        TVC_SUPPORT_TOML,
        "relocated TVC_SUPPORT_IMAGE from src/lasersqd_loader.asm",
        TVC_SUPPORT_ADDR,
        bytes(segment["bytes"][start:end]),
    )


def write_hidden_video_toml():
    document = parse_rtvc_toml(LOADER_BOOTSTRAP_TOML)
    symbols = document["symbols"]
    loader = read_tvc_cas(LOADER_CAS)
    source_start = symbols["TVC_HIDDEN_CODE_IMAGE"]
    source_end = symbols["TVC_HIDDEN_CODE_IMAGE_END"]
    offset = source_start - loader.load_address
    payload = loader.payload[offset : offset + source_end - source_start]
    write_single_segment(
        TVC_HIDDEN_VIDEO_TOML,
        "relocated hidden VID0 drawing code",
        symbols["TVC_HIDDEN_CODE_RUN"],
        payload,
    )


def build(build_dir, out_dir):
    global WORK_DIR, OUT_DIR, DISK
    global LOADER_CAS, FIRST_BLOCK_CAS, SECOND_BLOCK_CAS
    global LOADER_BOOTSTRAP_TOML, TVC_SUPPORT_TOML
    global TVC_FONT_TOML, TVC_HIDDEN_VIDEO_TOML

    WORK_DIR = build_dir
    OUT_DIR = out_dir
    DISK = OUT_DIR / "lasersqd_tvc.dsk"
    LOADER_CAS = WORK_DIR / "lasersqd_loader.cas"
    FIRST_BLOCK_CAS = WORK_DIR / "lasersqd_ls_7530_tvc.cas"
    SECOND_BLOCK_CAS = WORK_DIR / "lasersqd_lscode_5e28_tvc.cas"
    LOADER_BOOTSTRAP_TOML = WORK_DIR / "lasersqd_loader_bootstrap.toml"
    TVC_SUPPORT_TOML = WORK_DIR / "lasersqd_tvc_support.toml"
    TVC_FONT_TOML = WORK_DIR / "lasersqd_tvc_font.toml"
    TVC_HIDDEN_VIDEO_TOML = WORK_DIR / "lasersqd_tvc_hidden_video.toml"

    WORK_DIR.mkdir(parents=True, exist_ok=True)
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    prepare_sources(WORK_DIR)

    first_block_toml = WORK_DIR / "lasersqd_ls_7530_tvc.toml"
    first_block_bin = WORK_DIR / "LS1TVC.BIN"
    second_block_toml = WORK_DIR / "lasersqd_lscode_5e28_tvc.toml"
    second_block_bin = WORK_DIR / "LS2TVC.BIN"

    build_first_block(first_block_toml, first_block_bin)
    lscode = read_tap_block_data(SOURCES_DIR / "LASERSQD.TAP", 5)
    second_block_size = len(lscode)
    build_loader_cas(
        first_block_bin.stat().st_size,
        second_block_size,
        extract_main_font(lscode),
    )
    write_loader_support_toml()
    write_hidden_video_toml()
    build_second_block(
        second_block_toml,
        second_block_bin,
        loader_support_addresses(),
    )
    write_tvc_cas(FIRST_BLOCK_CAS, first_block_bin.read_bytes())
    write_tvc_cas(SECOND_BLOCK_CAS, second_block_bin.read_bytes())
    multiload_cas = {}
    for block_name, block_index in MULTILOAD_BLOCKS.items():
        payload = read_tap_block_data(SOURCES_DIR / "LASERSQD.TAP", block_index)
        if len(payload) != 0x49DF:
            raise ValueError(f"unexpected {block_name} payload size {len(payload):04X}H")
        disk_name = f"{block_name}.CAS"
        cas_path = WORK_DIR / disk_name.lower()
        write_tvc_cas(cas_path, payload)
        multiload_cas[disk_name] = cas_path
    native_graphics_cas = {}
    for block_name, block_index in NATIVE_GRAPHICS_BLOCKS.items():
        scenario = read_tap_block_data(SOURCES_DIR / "LASERSQD.TAP", block_index)
        low, high = split_large_graphics(extract_descriptor_large_graphics(scenario))
        if len(low) != LARGE_LOW_SIZE or len(high) != LARGE_HIGH_SIZE:
            raise ValueError(f"unexpected {block_name} native graphics split")
        disk_name = f"{block_name}.CAS"
        cas_path = WORK_DIR / disk_name.lower()
        write_tvc_cas(cas_path, low + high)
        native_graphics_cas[disk_name] = cas_path
    if second_block_bin.stat().st_size != second_block_size:
        raise ValueError("patched LSCODE size changed")

    if DISK.exists():
        DISK.unlink()
    run("rtvc-dsk", ["new720", str(DISK)])
    run(
        "rtvc-dsk",
        ["put", f"{DISK}:LOADER.CAS", str(LOADER_CAS)],
    )
    run(
        "rtvc-dsk",
        ["put", f"{DISK}:{FIRST_BLOCK_DISK_NAME}", str(FIRST_BLOCK_CAS)],
    )
    run(
        "rtvc-dsk",
        ["put", f"{DISK}:{SECOND_BLOCK_DISK_NAME}", str(SECOND_BLOCK_CAS)],
    )
    for disk_name, cas_path in multiload_cas.items():
        run(
            "rtvc-dsk",
            ["put", f"{DISK}:{disk_name}", str(cas_path)],
        )
    for disk_name, cas_path in native_graphics_cas.items():
        run(
            "rtvc-dsk",
            ["put", f"{DISK}:{disk_name}", str(cas_path)],
        )
    run("rtvc-dsk", ["dir", str(DISK)])
    return DISK


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--build-dir", type=pathlib.Path, default=WORK_DIR)
    parser.add_argument("--dist-dir", type=pathlib.Path, default=OUT_DIR)
    arguments = parser.parse_args()
    build(arguments.build_dir.resolve(), arguments.dist_dir.resolve())
