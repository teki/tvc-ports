# Laser Squad Native Graphics

## Goal

Replace the main-game runtime Spectrum-bitmap expansion with graphics converted
offline to TVC GRAPHICS 4 data, while preserving the original game logic,
rendering interfaces, palette decisions, and screen-dependent behavior.

## Constraints

- Target a 64K TVC and use VID0 only.
- Do not depend on VID1, VID2, or an off-screen video bank.
- Keep the original verified TAP payload as the build authority.
- Preserve game control flow and patch only hardware-specific graphics paths.
- Preserve inverse-paper rendering, palette-profile mapping, collision results,
  and direct pixel operations.
- Keep generated converted assets ignored; regenerate them during every build.

## Implementation

1. Inventory static glyph ranges, renderer entry points, direct bitmap and
   attribute access, and free address space in the main program.
2. Add a reproducible extractor/converter that reads the verified source
   payload, expands the selected one-bit graphics to TVC-native row data, and
   emits a generated binary with structural checks.
3. Patch the generated native data into unused 64K CPU memory and replace the
   normal, double-height, and large renderers with direct VID0 routines.
4. Port direct bitmap pixel operations and attribute-only redraws so no game
   decision relies on the retired Spectrum bitmap shadow.
5. Remove the compatibility packing table and bitmap-shadow writes once all
   consumers are translated.
6. Compare cycle counts with the Spectrum routines and the compatibility
   baseline, then run the clean verifier and focused emulator scenarios.

## Validation

- Prove converted data byte-for-byte against an independent reference encoder.
- Reject overlap with the support image, stack, live workspace, and original
  payload regions.
- Verify the 64K mapper/display path uses VID0 only.
- Recheck title/main screens, inverse selection, weapon banner, placement and
  gameplay palettes, firing crosshair, and direct-pixel collision behavior.
- Record representative Spectrum, compatibility, and native cycle counts.

