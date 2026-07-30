# Laser Squad Palette Profiles Progress

## Current State

Complete. The hardcoded main-game palette has been replaced by selectable
four-byte profiles.

## Completed

- Confirmed from the TVC palette-port encoding that bright cyan is `51H`;
  `42H` sets an ignored palette bit and selects no RGB channel.
- Confirmed the requested write belongs to the later main-game palette, not
  the separate title-stage palette.
- Changed the main-game palette source and updated its notes and regression
  expectation.
- Added control-screen and normal-game palette profiles.
- Updated the common clear routine to apply the selected profile.
- Added a `B0ADH` hook to select cyan before drawing the control screen.
- Changed the `B0C3H` hook to select green for the next clear without
  recoloring the current screen.
- Traced `lsq-lvlsel.rtvcsnap.zip` after pressing `1`; the team/armour setup
  reaches its clear at `9D55H`.
- Added profile-specific Spectrum-ink maps.
- Added team profile 2: black/green/cyan/yellow, with white mapped to cyan.
- Patched `9D55H` to select profile 2 before clearing.
- Confirmed the selected team member uses Spectrum attribute `70H`
  (black ink on bright-yellow paper).
- Updated the shared cell renderer to map ink and paper independently and
  combine both colors into each GRAPHICS 4 output byte.
- Confirmed the remaining visible failure came from the direct attribute store
  at `6941H`, which changed the shadow without redrawing TVC VRAM.
- Replaced the original `693FH-6942H` store boundary with a compatibility call
  that preserves its result and redraws each changed selection cell.
- Added a black-ink fallback when ink and non-black paper collapse onto the
  same profile slot, fixing the cyan-on-cyan weapon-selection banner without
  changing cyan-on-black graphics.
- Updated the expected loader and LSCODE CAS hashes and loader size.

## Validation Run

- Inspected the assembled profile table:
  - profile 0 is `00H,51H,54H,44H`;
  - profile 1 is `00H,50H,54H,44H`;
  - profile 2 is `00H,50H,51H,54H`.
- Inspected the assembled hooks:
  - `B0ADH` calls the profile-0 control-screen clear helper;
  - `B0C3H` calls the profile-1 selection helper;
  - the selection helper does not write palette ports directly;
  - `9D55H` calls the profile-2 team-setup clear helper.
- Inspected the assembled profile-2 ink map:
  `00H,02H,03H,02H,01H,02H,03H,02H`, keeping green, cyan, and
  yellow distinct while mapping white to cyan.
- Inspected the assembled attribute and nibble paths: both ink and paper are
  mapped through the active profile, and the encoder combines the set-bit ink
  mask with the complemented paper mask.
- Inspected the assembled selection patch: `693FH-6942H` is replaced by
  `CALL 20EAH` plus `NOP`; the helper performs the original `OR 40H`, shadow
  store, and `HL` increment around a row/column-derived cell redraw.
- Inspected the assembled collision path: equal non-black ink and paper slots
  replace only the ink slot with black; black paper returns before the
  fallback, preserving cyan-on-black weapon graphics.
- `verify.py` passed:
  - three patched CAS hashes;
  - four complete scenario payloads; and
  - seven exact DSK directory entries.

## Next Steps

- Confirm the cyan-to-green transition and the black-on-yellow `70H`
  selection highlight visually in the emulator, then exercise the in-game
  change-controls path.
