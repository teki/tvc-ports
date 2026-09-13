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
4. checks the three patched CAS hashes and the loader-resident converted font;
5. compares all four complete scenario CAS payloads with their exact TAP blocks
   and all four native graphics files with fresh offline conversions; and
6. checks every filename and size in the generated 11-file DSK directory.

It leaves no generated build output in the port. On the first run it populates
the ignored source-download cache.

## Build for Interactive Testing

```sh
python3 build.py
```

Start `rtvc` with `dist/lasersqd_tvc.dsk`.

For the fast VT-DOS snapshot, mount the generated DSK in both A and B because
the snapshot preserves drive B as the selected controller drive:

```sh
rtvc -d dist/lasersqd_tvc.dsk -d dist/lasersqd_tvc.dsk \
  ../../../rtvc/snapshots/boot12dos.rtvcsnap.zip
```

At the BASIC prompt enter `load "*"` and press Return.

For debugger automation, use the shared
[TVC BASIC screen-character injection procedure](../../knowledge/tvc.md#basic-retained-screen-characters-and-command-injection).
Do not synthesize the command as a sequence of key events.

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
  black/grey/cyan/yellow. Blue/cyan team fields and units become cyan;
  red/yellow team fields and units become yellow; equal-color `D` glyphs
  remain visible in black; and green terrain becomes grey. Test both players
  and a screen where both teams' fields are visible.
- **Movement/tactical palettes:** `B1F7H` must select profile 4 so the hidden-
  movement screen is black/cyan/yellow/magenta. Its return through `5E95H`
  must apply profile 5 before tactical drawing, producing black/yellow/green/
  cyan rather than retaining movement or deployment colors. Spectrum blue
  floor grids must use the green slot; cyan overlays stay cyan.
- **Unit-information palette:** the `875AH` clear must select profile 1 without
  changing its original `46H` attribute, and must not recolor the resident
  map-glyph cache. The `8875H` exit must restore profile 5 before clearing and
  redrawing the tactical map.
- **Firing palette:** the `8497H` clear must select profile 6 without changing
  its original `45H` attribute. Walls must remain neutral, trajectory markers
  yellow, and the crosshair cyan. The `85C3H` exit must restore profile 5
  before clearing and redrawing the tactical map.
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
  active. Coordinates must remain in range, the stack must stay below `4000H`,
  and the installed support image at `2120H-284FH` must not be modified by
  drawing.
- **Gameplay input:** verify `Q`, `A`, `O`, `P`, and Space through the
  store/tactical control path, not only in menus. Control-selection options
  1-3 must use the TVC joystick (row 8: Tab/Fire, arrows) with the same
  fire/up/down/right/left action bits; option 4 remains keyboard.
- **Aiming directions:** P moves right, O left, Q up, A down. Check single-pixel
  movement through four- and eight-pixel boundaries. The corrected plotter
  passed 21 controlled calls in `lsqd-aim.rtvcsnap.zip`, checking coordinates,
  video addresses, split-plane masks, and original collision masks.
- **Firing crosshair:** from `lsql-fire.rtvcsnap.zip`, move or blink the firing
  cursor. Its original 21-pixel XOR cross must appear in cyan at the target
  position, and toggling it must not recolor or damage the trajectory circles.
- **Drawing performance:** a synthetic black-paper normal glyph takes 1,226
  emulated Z80 cycles; the pristine Spectrum routine takes 655. Raw large-glyph
  and temporary-descriptor callers now use the correctness fallback at U0
  `3EC0H`; keep those off the main map path.
- **Descriptor-native map draw:** the `612AH` 11-by-11 loop must perform one
  VID0 map and one restore, with mapper shadow `0003H` returning to `B0H`.
  From `lsql-fire.rtvcsnap.zip`, the old batched mask/recolor path takes 645,618
  cycles, the four-quadrant descriptor path takes 380,671, and the scanline-
  ordered unrolled path takes 269,472 cycles (4.31 frames, 86.2 ms). The
  11,840-byte resident table must match a model built from the live `E79FH`
  attributes, `E8DFH` glyphs, active palette map, and collision fallback; the
  measured profile-3 comparison matched all bytes. A controlled raw glyph must
  also match all 64 screen bytes and restore mapper shadow `0003H` to `B0H`.
  Reapplying an unchanged palette must skip the 1,295,276-cycle table rebuild.
- **CRTC paper height:** from the start of the loader, CRTC R6 must be `30H`,
  producing 48 four-raster rows (192 active lines). The title, scenario, and
  control-selection screens must render cleanly; frame timing, start address,
  and cursor IRQ settings remain unchanged.
- **Support relocation:** the loader-resident support source at
  `211EH-284DH` overlaps its higher `2120H-284FH` runtime destination. The
  loader must use backward `LDDR`, and the installed 1,840-byte image must
  match the generated support TOML before entering the main game.
- **Hidden native fonts:** before the first VT-DOS call, VID0 offsets
  `3000H-35FFH` and `3600H-3BFFH` must match the offline slot-1/slot-2 font
  variants, and `3C00H-3E93H` must match the hidden drawing/conversion code.
  Screen clears must leave the complete `3000H-3FFFH` tail unchanged.
- **Multi-load:** verify the direct payload at `B621H-FFFFH` matches the
  selected original TAP block. Verify the matching `Gxx.CAS` is then loaded as
  `1640H` bytes at `2880H` and `1800H` bytes at `4000H`, with both ranges equal
  to the offline conversion of that scenario's `E8DFH-FFFEH` table.

## Unsplit Multi-load Validation

The direct one-file path was validated in `rtvc` from the clean TVC 1.2
VT-DOS boot snapshot. The page-0 support routine was called in mode 1 with
block ID `64H`; it returned through the success path with mapper shadow `B0H`
and game success flag `00H`. Raw U2/U3 memory at `B621H-FFFFH` matched all
`49DFH` bytes of `LASERSQD.TAP` block 6. The same request then loaded the one
`G64.CAS` file in two ROM block reads; `2880H-3EBFH` and `4000H-57FFH` matched
the generated native graphics payload byte-for-byte.

## Native Graphics Record

- The build converts all printable main-font glyphs (`20H-7FH`) and embeds the
  resulting 1,536 bytes in `LOADER.CAS`.
- Each scenario converts all 185 large glyphs at `E8DFH-FFFEH` into an
  11,840-byte `Gxx.CAS`. The original `Lxx.CAS` stays byte-identical to its TAP
  block.
- Main-game normal, double-height, and large renderers consume native masks
  directly. The common `844CH` plot path performs native set, clear, and XOR
  operations and preserves the game's collision result at `5DA5H`.
- The native attribute highlighter was visually checked on the team setup
  screen: the current soldier is black on bright yellow, and the old/new cells
  redraw when selection changes.
- The firing snapshot was visually checked: yellow trajectory circles and the
  21-pixel XOR cross are both visible without corrupting each other.
- The main-game path uses VID0 only and no Spectrum bitmap shadow. The one-time
  first-stage title screen still uses its existing compatibility shadow.

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

## Aiming and Shooting Collision Audit

Using `rtvc/snapshots/lsqd-aim.rtvcsnap.zip` with the rebuilt resident support
in a separate headless emulator, controlled calls passed:

- 384 plotter cases: attributes `41,42,44,45,46,47,70,4D`, X=24..31,
  Y=43, empty/occupied source pixels, and modes 0/1/2. Check complete output
  byte, original collision mask (or unchanged sentinel for clear/XOR), and
  mapper restoration. Seed neighbouring pixels with mixed ink/paper.
- Original `8974H`: a new point at (31,43) with an old trail point at
  (28,43), for both empty and occupied new points. The old point clears
  while `5DA5H` retains the new point's collision.
- Original `8B7AH`: center (31,43), mixed cyan/black bitmap. Compare the
  first draw against the 21 signed coordinate pairs at `8B50H`, then call
  again and compare all 12,288 visible bytes with the initial background.
  `5DA5H` remains unchanged on both calls.

Coordinates above include the original 8-pixel inset. Routine probes disable
interrupts, select game mapper `B0H`, and use a reserved test stack. These
checks do not substitute for full weapon/damage gameplay scenarios.

## Palette Refinement Probe

Using `rtvc/snapshots/boot12dos.rtvcsnap.zip` with the rebuilt resident support
in a separate headless emulator, the assembled phase hooks passed:

- `875AH` preserves attribute `46H`, selects profile 1, restores the large-table
  loaded flag, and leaves a sentinel at `2880H` plus the table's tactical
  palette id unchanged.
- `8875H` restores profile 5, skips the glyph rebuild, and keeps that sentinel.
- `B1F7H` selects profile 4 with the same cache preservation.
- Deployment attributes `0DH`/`16H`/`04H` map to black-on-cyan, black-on-yellow,
  and grey-on-black. Tactical `01H`/`0DH`/`05H` map to green-on-black,
  cyan-on-green, and cyan-on-black.
- Profile 3 hardware bytes are `00H,15H,51H,54H`; profile 5 maps Spectrum blue
  to slot 2.

No suitable unit-information snapshot was available for a visual return-to-map
check. Interactive inspection of that screen remains a manual regression.

## Joystick Control Probe

Using `rtvc/snapshots/boot12dos.rtvcsnap.zip` with the rebuilt resident support
in a separate headless emulator, Sinclair (`B0E8H`), Kempston (`B0FDH`), and
Protek/AGF/cursor (`B117H`) all returned the same TVC joystick action byte:

- none `FFH`, Tab/Fire `FEH`, Up `FDH`, Down `FBH`, Right `F7H`, Left `EFH`.

Option 4 remains the keyboard handler. Interactive play with a host joystick or
arrow keys plus Tab is a manual regression.


