# Laser Squad Drawing Optimization Progress

## Current State

Implemented and validated.

## Completed

- Identified the nested nibble/slot encoder call chain as the main per-cell
  conversion cost.
- Replaced it with one page-aligned 256-byte ink/paper/nibble table while
  retaining the existing palette selector and collision fallback.
- Added build-time checks for the table's fixed address, all 256 encoded
  values, and the support image's upper bound.
- Reduced a representative `TVC_REDRAW_SHADOW_CELL` call from 5,926 to 2,414
  emulated Z80 cycles: 2.46 times faster, or 59.3% fewer cycles.
- Replayed `lsql-fire.rtvcsnap.zip`; normal colors, yellow trajectory circles,
  and the cyan firing cross remained correct.
- Corrected the loader regression reported during full-disk testing: the
  enlarged embedded support overlapped its destination, so its startup copy
  now runs backward with `LDDR`. The build rejects `LDIR` for overlapping
  ranges.
- Ran the real loader through both disk reads in `rtvc`, stopped immediately
  after relocation, and compared all 1,792 installed bytes at `2000H-26FFH`
  with the assembled support image. They matched exactly, and the following
  scenario-selection screen rendered without corruption.
- Passed the clean port verifier.

## Next

- Continue converting individual graphics producers to native TVC data when
  profiling shows the compatibility renderer remains a bottleneck.
