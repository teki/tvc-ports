#!/usr/bin/env python3
"""Experiment: differential sweep of the native 844CH pixel plotter.

Runs the same seeded set of plot cases against two builds (for example the
committed build in a temporary directory and the working build) and reports
any difference in the written VID0 byte, the 5DA5H collision byte, or the
restored mapper shadow.
"""

import argparse
import pathlib
import random
import sys

from draw_timing import BUILD, HARNESS, HARNESS_END, SNAPSHOT, Build, Emulator

ATTRIBUTES = (0x00, 0x01, 0x04, 0x05, 0x06, 0x07, 0x0D, 0x16, 0x38, 0x41, 0x42,
              0x44, 0x45, 0x46, 0x47, 0x4D, 0x56, 0x70, 0x7F, 0xC5)
PALETTES = (1, 2, 3, 5, 6)


def cases(count, seed):
    rng = random.Random(seed)
    for _ in range(count):
        yield (rng.choice(PALETTES), rng.choice(ATTRIBUTES), rng.randrange(0, 232),
               rng.randrange(0, 176), rng.randrange(4), rng.randrange(256))


def run(build_dir, case_list, port):
    build = Build(build_dir)
    emu = Emulator(port)
    results = []
    current = None
    try:
        for palette, attribute, x, y, mode, old in case_list:
            if palette != current:
                emu.command(cmd="load_snapshot", path=str(SNAPSHOT))
                emu.command(cmd="pause")
                build.install(emu, palette)
                current = palette
            sx, sy = x + 8, y + 8
            vram = 0x8000 + sy * 64 + sx // 4
            cell = 0x5800 + (sy // 8) * 32 + sx // 8
            harness = bytes((
                0xF3, 0x3E, 0x90, 0xD3, 0x02,          # DI; map VID0 in page 2
                0x3E, old, 0x32, vram & 0xFF, vram >> 8,
                0x3E, 0xB0, 0xD3, 0x02,                # restore game map
                0xCD, 0x4C, 0x84,                      # CALL 844CH
                0x18, 0xFE,
            ))
            emu.map_game()
            emu.write(cell, [attribute])
            emu.write(0x5DA3, [y, x, 0xA5, mode])
            emu.write(HARNESS, harness)
            emu.command(cmd="set_register", name="SP", value=0x3FFE)
            emu.command(cmd="set_register", name="PC", value=HARNESS)
            end = HARNESS + len(harness) - 2
            emu.command(cmd="breakpoint_add", addr=end)
            emu.command(cmd="continue")
            emu.wait_breakpoint()
            emu.command(cmd="breakpoint_remove", addr=end)
            byte = emu.read(vram - 0x8000, 1, "vid0")[0]
            collision = emu.read(0x5DA5, 1)[0]
            mapper = emu.read(0x0003, 1)[0]
            results.append((byte, collision, mapper))
    finally:
        emu.close()
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("reference", type=pathlib.Path,
                        help="build directory of the reference plotter")
    parser.add_argument("--build-dir", type=pathlib.Path, default=BUILD)
    parser.add_argument("--count", type=int, default=600)
    parser.add_argument("--seed", type=int, default=844)
    arguments = parser.parse_args()
    case_list = sorted(cases(arguments.count, arguments.seed))
    expected = run(arguments.reference, case_list, 8101)
    actual = run(arguments.build_dir, case_list, 8102)
    failures = 0
    by_mode = {}
    for case, want, got in zip(case_list, expected, actual):
        by_mode.setdefault(case[4], [0, 0])[0] += 1
        if want != got:
            failures += 1
            by_mode[case[4]][1] += 1
            if failures <= 20:
                print(f"case {case}: reference {want} build {got}")
    print(f"{len(case_list)} cases, {failures} differences")
    for mode, (total, diff) in sorted(by_mode.items()):
        print(f"  mode {mode}: {total} cases, {diff} differences")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
