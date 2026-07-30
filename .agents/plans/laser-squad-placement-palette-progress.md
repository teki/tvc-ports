# Laser Squad Placement Palette Progress

## Current State

Complete.

## Completed

- Compared four placement and two gameplay screenshot pairs.
- Confirmed the current profile collapses blue/cyan and red/yellow, causing
  the collision fallback to render both `D` glyphs in black.
- Chose a placement-only black/green/bright-blue/bright-red profile with
  explicit user approval.
- Traced the common placement clear to `A370H`.
- Traced the post-placement gameplay clear entry to `5E92H` -> `B1F7H`.
- Added profile 3: `00H,50H,41H,44H`
  (black/green/bright-blue/bright-red).
- Added its Spectrum map:
  `00H,02H,03H,03H,01H,02H,03H,01H`.
- Patched `A370H` to select profile 3 before its original clear.
- Patched `5E92H` to select profile 2 before its original `B1F7H` clear.
- Injected the assembled support and overlay into the level-selection
  snapshot and reached the traced placement boundary.
- Visually confirmed true blue deployment fields, black `D` glyphs, blue
  deployed units, and preserved green terrain.
- Directly exercised the gameplay helper and confirmed it reached `B1F7H`
  with palette ID `2`.
- Updated the expected loader/LSCODE CAS hashes and loader size.
- `verify.py` passed:
  - three patched CAS hashes;
  - four complete scenario payloads; and
  - seven exact DSK directory entries.

## Next Steps

- Confirm the red-team placement field and post-placement gameplay screen in a
  normal interactive run.
