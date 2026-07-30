# Laser Squad Fire Crosshair Progress

## Current State

Implemented and validated.

## Completed

- Reproduced the missing cross from `lsql-fire.rtvcsnap.zip`.
- Confirmed gameplay input and the target coordinates continue to update.
- Identified `8B7AH` as the 21-pixel XOR cross routine.
- Confirmed its direct `8444H` bitmap writes bypass all current TVC redraw
  hooks.
- Routed its four callers through a page-0 wrapper that redraws only affected
  character cells.
- Confirmed the plus-shaped cross appears in cyan after a toggle from the
  supplied snapshot.
- Updated the patched CAS hashes and sizes.

## Validation

- `python3 build.py`: passed.
- `python3 verify.py`: passed.
