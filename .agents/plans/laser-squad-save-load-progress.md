# Laser Squad disk save/load progress

## Current state

Disk save and saved-game load are implemented. A later boot failure was a
blank scenario menu: color prep patched hidden-VID0 immediates while page 2 was
still U2, corrupting LSCODE and leaving the copy loop uncolored. The AND/XOR
masks now live in resident U0. Support occupies `21BCH-2852H`.

## Findings

- Mode 0 saves B621H-FFFFH (`49DFH` bytes); mode 1 loads a scenario or saved
  game, with B=67H for the latter. Mode 2 is verify.
- B1C3H expects B15BH=0 after a successful load.
- TVC 1.2 VT-DOS writes through device 50H and reads through D0H.
- The native font now occupies `1BBCH-21BBH`, resident support `21BCH-2852H`,
  and hidden VID0 code `3C00H-3F2EH`; these ranges do not overlap.
- `TVC_PREPARE_NATIVE_COLOR` must write its masks in U0 because it reads
  `B239H` before mapping VID0.
- VT-DOS GUI disk output persists to the host DSK. Headless `rtvc` does not
  flush dirty disk bytes, so persistent-file tests use the GUI process.

## Completed

- Added one fixed `SAVE.CAS` data-file slot and mode-67 saved-game read through
  the original B15CH transport boundary.
- Rebuilt the native large-glyph cache after saved-game read.
- Moved mapped-only drawing helpers into hidden VID0 to preserve the native
  font and support ranges.
- Kept the native color AND/XOR masks in U0 after the hidden-VID0 move blanked
  the scenario menu.
- `TVC_MULTILOAD` now starts from the block ID left in `A` by `TVC_SAVELOAD`.
- A clean BASIC `load "*"` boot reached the scenario menu with colored text
  and loaded scenario 1 through to the controls screen.

## Next steps

Repeat a clean BASIC boot through scenario 1, then the visible save/load
scenario. Older snapshots taken before the `21BCH` support move remain invalid.
