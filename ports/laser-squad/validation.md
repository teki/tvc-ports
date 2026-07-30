# Laser Squad Validation

## Automated Smoke Check

Run after changing preparation, assembly sources, loader behavior, build logic,
or shared tools:

```sh
python3 verify.py
```

The command:

1. acquires the source archive when absent and verifies its ZIP and TAP hashes;
2. regenerates and hash-checks the TAP description;
3. builds all port components in a temporary directory;
4. checks the three patched CAS hashes and compares all four complete scenario
   CAS payloads with their exact TAP blocks; and
5. checks every filename and size in the generated DSK directory.

It leaves no generated build output in the port. On the first run it populates
the ignored source-download cache.

## Build for Interactive Testing

```sh
python3 build.py
```

Start `rtvc` with `dist/lasersqd_tvc.dsk`.

## Known-good Emulator Scenario

1. Boot/load the generated DSK.
2. Confirm the initial questions draw correctly.
3. Enter the player count and player setup.
4. Confirm the shopping screen draws without corruption.
5. Confirm the game accepts `Q`, `A`, `O`, `P`, and Space.
6. Exercise at least one later multi-load transition.

A user-confirmed `rtvc` run passed initial drawing, player setup,
shopping-screen drawing, and the required keyboard controls. This is the
minimum regression scenario after changing graphics, interrupts, keyboard, or
runtime loading.

## Focused Regression Checks

- **Palette:** `(PRESS 1 OR 2)` and the control-selection screen must use
  bright cyan for Spectrum ink 4 without changing color after the key press.
  The following screen clear must apply bright green and retain the normal-game
  palette on later clears. Re-entering control selection must select cyan
  again. Unsupported visible inks must remain visible.
- **Team/armour palette:** from `lsq-lvlsel.rtvcsnap.zip`, press `1`. The
  `9D55H` team-setup clear must select black/green/cyan/yellow. Spectrum green,
  cyan, and yellow must remain distinct; Spectrum white may use bright cyan.
- **Placement palette:** the common `A370H` placement clear must select
  black/green/bright-blue/bright-red. Blue/cyan team fields and units become
  blue; red/yellow team fields and units become red; equal-color `D` glyphs
  remain visible in black; and green terrain remains green. Test both players
  and a screen where both teams' fields are visible.
- **Gameplay palette restore:** after final placement, the `5E92H` hook must
  select profile 2 before the original `B1F7H` clear. Normal gameplay must
  return to black/green/cyan/yellow rather than retaining the placement
  profile.
- **Paper/inverse rendering:** the selected soldier name has Spectrum
  attribute `70H` and must render as black text on a bright-yellow background,
  not yellow text on black. Ordinary attributes with paper 0 must retain their
  black backgrounds. Move the current-person selection in both directions;
  the old and new two-row highlights must redraw immediately.
- **Mapped-color collision:** after weapon selection is completed, the
  Spectrum cyan-on-blue `PRESS FIRE TO END SELECTION` banner maps to
  black-on-cyan, never cyan-on-cyan. Cyan weapon graphics on black must remain
  cyan.
- **Numeric input:** press and release `1` and `2`; both the release loop and
  selection call must advance.
- **Interrupt/drawing:** allow the shopping screen to draw with interrupts
  active. Coordinates must remain in range and the support image at
  `2000H-2FFFH` must not be modified by drawing.
- **Gameplay input:** verify `Q`, `A`, `O`, `P`, and Space through the
  store/tactical control path, not only in menus.
- **Firing crosshair:** from `lsql-fire.rtvcsnap.zip`, move or blink the firing
  cursor. Its original 21-pixel XOR cross must appear in cyan at the target
  position, and toggling it must not recolor or damage the trajectory circles.
- **Multi-load:** verify the direct payload at `B621H-FFFFH` matches the
  selected original TAP block.

## Unsplit Multi-load Validation

The direct one-file path was validated in `rtvc` from the clean TVC 1.2
VT-DOS boot snapshot. The page-0 support routine was called in mode 1 with
block ID `64H`; it returned through the success path with mapper shadow `B0H`
and game success flag `00H`. Raw U2/U3 memory at `B621H-FFFFH` matched all
`49DFH` bytes of `LASERSQD.TAP` block 6.

## Diagnostic Snapshot Record

The copied snapshots under `experiments/snapshots/` remain ignored because
they are local diagnostic states rather than stable test fixtures:

- `nogreen.rtvcsnap.zip`: palette-index-zero regression;
- `baddraw.rtvcsnap.zip`: pre-keypress intermittent drawing corruption; and
- `problem.rtvcsnap.zip`: missing gameplay-key mappings.

For deterministic reproduction, load the relevant snapshot, issue a
frame-duration `key_press` (for example key code `49` for `1`), and start a
bounded instruction trace before the input is consumed.

## Migration Baseline

The standalone build produced a byte-identical DSK to the last image generated
in `rtvc/data/porting`:

```text
8d0634e74a759f03b7b44e1bab031bdccd3cbd390aee221110311b7c4e4d736b
```

This hash records the migration baseline. `verify.py` deliberately validates
the component hashes and disk directory instead of requiring all future
compatible `rtvc-dsk` versions to preserve container bytes.
