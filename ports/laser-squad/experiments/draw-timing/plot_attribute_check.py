#!/usr/bin/env python3
"""Experiment: 844CH plotter collision and XOR across attribute changes.

A wall pixel drawn under one attribute must still block a shot after its cell
takes another attribute (an object or marker in the same 8x8 cell), and two
XORs (the aiming cross) must restore it. Run `python3 build.py` first.
"""

import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import draw_timing as dt  # noqa: E402

emu = dt.Emulator(8097)
b = dt.Build(dt.BUILD if len(sys.argv) < 2 else pathlib.Path(sys.argv[1]))
b.install(emu)
def attr_addr(x, y):
    X, Y = x + 8, y + 8
    return 0x5800 + (Y // 8) * 32 + X // 8
def vram(x, y):
    X, Y = x + 8, y + 8
    emu.command(cmd="write_port", port=0x02, value=0x90)
    v = emu.read(0x8000 + Y * 64 + X // 4, 1)[0]
    emu.map_game()
    return v
def plot(x, y, mode):
    dt.call(emu, 0x844C, 0, None, [(0x5DA3, [y, x, 0, mode])])
    return emu.read(0x5DA5, 1)[0]
ok = True
for wall, other in ((0x45, 0x46), (0x47, 0x42), (0x44, 0x46), (0x46, 0x45)):
    for px in range(8):
        x, y = 40 + px, 40
        emu.write(attr_addr(x, y), [wall])
        plot(x, y, 1)                      # clear
        plot(x, y, 0)                      # wall pixel in wall ink
        drawn = vram(x, y)
        emu.write(attr_addr(x, y), [other])
        coll = plot(x, y, 0)                # bullet test under other attribute
        emu.write(attr_addr(x, y), [wall]); plot(x, y, 0)   # restore wall ink
        before = vram(x, y)
        emu.write(attr_addr(x, y), [other])
        plot(x, y, 2); mid = vram(x, y); plot(x, y, 2); after = vram(x, y)
        good = coll == (0x80 >> ((x + 8) & 7)) and after == before and mid != before
        ok &= good
        if not good:
            print(f"attr {wall:02X}->{other:02X} x={x}: coll={coll:02X} before={before:02X} mid={mid:02X} after={after:02X}")
        plot(x, y, 1); empty = plot(x, y, 0)
        if empty != 0: print("empty collision", hex(empty)); ok = False
        plot(x, y, 1)
print("PASS" if ok else "FAIL")
emu.close()
