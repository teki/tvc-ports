# Laser Squad Native Graphics Progress

## Current State

The main-game native graphics conversion is implemented and validated. The
one-time title renderer remains on its existing compatibility path.

## Completed

- Confirmed the baseline keeps `4000H-57FFH` as a Spectrum bitmap shadow and
  expands every drawn cell through a 256-byte runtime packing table.
- Confirmed the port currently targets GRAPHICS 4 in VID0 and temporarily maps
  VID0 into page 2 only while drawing.
- Identified the main static sources at `B139H` (8-byte glyphs) and `E8DFH`
  (32-byte four-quadrant glyphs), plus the direct Spectrum pixel plotter at
  `8444H` and the attribute highlighter at `693FH`.
- Added `graphics.py` to convert Spectrum bitmap rows into two-byte GRAPHICS 4
  slot masks during the build.
- Embedded converted font codes `20H-7FH` in `LOADER.CAS` and generated one
  `Gxx.CAS` native large-graphics table for every scenario payload.
- Loaded the 185-glyph scenario table into `2880H-3EBFH` and `4000H-57FFH`,
  leaving 320 bytes below the relocated `SP=4000H` and using no extra video
  bank.
- Replaced the normal, double-height, and four-quadrant main-game renderers
  with direct native VID0 writers.
- Replaced the common Spectrum pixel plotter and attribute-only highlighter so
  crosshair XOR, collision state, palette profiles, and inverse selection work
  without a bitmap shadow.
- Removed the compatibility packing table and dead shadow renderer from the
  relocated support image.
- Verified all four original scenario files byte-for-byte, all four converted
  graphics files byte-for-byte, and the complete 11-file DSK directory.
- Runtime-tested the ID `64H` loader, inverse team selection, weapon banner,
  and firing crosshair.
- Measured representative calls at 1,272 cycles for normal drawing and 3,389
  cycles for large drawing, versus 2,414/6,438 for the compatibility renderer
  and 655/1,853 for the original Spectrum routines.

## Next

- Exercise every scenario and expansion branch during normal play.
- Convert the one-time title renderer if startup performance becomes important.
