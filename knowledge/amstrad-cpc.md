# Amstrad CPC Software and Translation Notes

This is an indexed placeholder for verified CPC-to-TVC porting knowledge. Do
not fill it with generic hardware-manual material or assumptions copied from
Spectrum work.

Add sections when a real CPC port establishes them:

- supported source model and firmware/ROM version;
- firmware entry points and calling conventions;
- keyboard and joystick paths;
- display modes, memory layout, palette, and CRTC-visible assumptions;
- interrupts and timing;
- sound;
- AMSDOS, cassette, and disk loaders;
- common game code patterns; and
- tested TVC translation strategies.

Exact CPC hardware facts should live in an emulator-oriented hardware
reference if and when `rtvc` implements that machine. This file should retain
the software and porting consequences.

## Display Modes and TVC Translation

Verified on Laser Squad (2026-10-16): a CPC mode 1 byte uses the same pixel
layout as a TVC GRAPHICS 4 byte. Pixel n (0 = leftmost) takes its low bit
from bit 7-n and its high bit from bit 3-n. Pre-coloured mode 1 graphics can
therefore be copied to TVC VRAM byte for byte; only the four palette entries
need mapping, because the CPC has 27 colors and the TVC 16. A mode 1 byte
covers four pixels in both cases, so a 16-pixel-wide CPC tile keeps its byte
width on the TVC. The TVC 4-color screen is 256 pixels wide against the
CPC's 320, so a CPC screen layout does not fit; reuse the tiles inside the
existing layout.

Pastel CPC colors have no TVC equivalent. Laser Squad maps pink to bright red,
pastel magenta to bright magenta, pastel blue to bright blue, and the CPC's
half-level cyan to dim cyan; see `CPC_TO_TVC_COLOR` in
[cpc_graphics.py](../ports/laser-squad/cpc_graphics.py).

## Tape Images

`.cdt` files are TZX images. Game loaders often use turbo blocks (`11H`) with
Spectrum-style flag and XOR checksum bytes instead of the firmware's 2 KiB
records. Laser Squad's loader fills memory downward, so its block data is
stored in reverse order. Find a block's load address by matching reversed
data against RAM from rtvc's CPC 464 emulator; see the Laser Squad notes.

## Tooling

rtvc's experimental CPC 464 (`rtvc --cpc -H -t game.cdt`) loads such tapes
at warp speed and saves `.rtvcsnap` snapshots whose `VID ` chunk holds the
CRTC registers, mode, and pens. Loading a snapshot drops the inserted tape, so
start from a cold boot when a later tape block is needed.
