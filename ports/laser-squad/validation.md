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
  and the installed support image at `21BCH-284DH` must not be modified by
  drawing.
- **Gameplay input:** verify `Q`, `A`, `O`, `P`, and Space through the
  store/tactical control path, not only in menus. Control-selection options
  1-3 must use the TVC joystick (row 8: fire, arrows; Space is also fire) with the same
  fire/up/down/right/left action bits; option 4 remains keyboard.
- **Aiming directions:** P moves right, O left, Q up, A down. Check single-pixel
  movement through four- and eight-pixel boundaries. The corrected plotter
  passed 21 controlled calls in `lsqd-aim.rtvcsnap.zip`, checking coordinates,
  video addresses, split-plane masks, and original collision masks.
- **Firing crosshair:** from `lsql-fire.rtvcsnap.zip`, move or blink the firing
  cursor. Its original 21-pixel XOR cross must appear in cyan at the target
  position, and toggling it must not recolor or damage the trajectory circles.
- **Drawing performance:** run the draw-timing probe described below. Raw
  large-glyph and temporary-descriptor callers use the correctness fallback at
  U0 `3EC0H`; keep those off the main map path.
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
- **Support placement:** the loader support source and resident destination
  both occupy `21BCH-281BH`. Its `LDIR` is in place, the 1,632-byte image must
  match the generated support TOML, and the `1BB3H-21B2H` native font must
  remain below it.
- **Hidden VID0 code:** `3C00H-3CA2H` must match the hidden conversion code
  (`verify.py` compares the generated TOML with `LOADER.CAS`). Only
  `TVC_CONVERT_PAIR` may change at run time.
  Screen clears must leave the complete `3000H-3FFFH` tail unchanged,
  including the converter's nibble table in the `3000H` page.
- **Multi-load:** verify the direct payload at `B621H-FFFFH` matches the
  selected original TAP block. Verify the matching `Gxx.CAS` is then loaded as
  `1640H` bytes at `2880H` and `1800H` bytes at `4000H`, and that its
  `5481H-5483H` pens replace `TVC_PALETTES` pens 1-3. `verify.py` checks
  `G64`/`G65` tile by tile against the CPC tape and `G66`/`G68` against an
  independent fixed-palette Spectrum conversion.
- **CPC graphics:** scenario 1 deployment and tactical screens must show the
  CPC tiles in black/bright red/bright magenta/white, with the Assassins'
  deployment squares red and the droids' squares magenta, and red CPC soldier
  sprites after deployment. Scenario 2 must use bright blue/dim cyan/white and
  match the CPC 464 layout tile for tile. Scenario 3 must use dim yellow/bright red/
  bright yellow and the `68H` expansion bright red/dim yellow/bright yellow,
  with CPC tiles from Side B.
- **Firing collisions:** after `python3 build.py`, run
  `python3 experiments/draw-timing/plot_attribute_check.py`; it must print
  `PASS`. In play, shots must stop at walls that share a cell with a unit
  blob, and moving the aiming cross across a wall must leave the wall intact.
- **Deployment scroll:** from the deployment screen with the cursor at the
  right edge, one scroll must finish within about 0.15 s of emulated time
  (it took about 1.5 s through the raw `E65FH` path before the CPC tables).
- **Save/load:** from the game option menu, press `2`. The mounted writable DSK
  must contain one `SAVE.CAS` with a 16-byte data-file header and `49DFH`
  payload identical to the pre-save `B621H-FFFFH` memory. Saving again must
  update that slot; header byte 14 must hold the scenario ID (`64H`-`68H`).
  Press `3`, then choose scenario `4` (saved game): the payload must be
  restored, `B15BH` must be `00H`, and `2880H`/`4000H` must again equal that
  scenario's `Gxx.CAS`. On 2026-10-16 this was checked by overwriting both
  ranges and the palette before loading a scenario 1 save; both were restored
  exactly and the tactical map drew correctly. A save written before this
  change has no ID and keeps the resident tiles. Removing the save file
  must leave `B15BH` nonzero on load. Rebuilding the generated DSK starts with
  no save slot. A user save from the second scenario (turn 3), loaded from a
  fresh scenario-menu snapshot, restored all `49DFH` bytes with `B15BH=00H`,
  then continued with joystick fire (Space) to a correctly drawn tactical map;
  `B0C7H` remains the default joystick method after such a load.

## Draw-timing Probe

After changing a renderer, run `python3 build.py`, then from the port:

```sh
python3 experiments/draw-timing/draw_timing.py --compare build/draw-baseline
python3 experiments/draw-timing/plot_sweep.py <reference-build-dir> --count 600
```

`draw_timing.py` installs the build into `lsql-fire.rtvcsnap.zip` and times
13 routines (clear, both map loops, one tile, raw glyph, normal and inverse
text, double-height text, three plot modes, firing view and exit) against the
pristine `LSCODE`. `--save DIR` stores each routine's VID0, attribute, `5DA5H`,
and `5D00H` output, and `--compare DIR` reports any byte difference. The
ignored `build/draw-baseline` was saved from the build before the drawing
speed pass. `plot_sweep.py` compares the `844CH` plotter with an older build
directory over seeded random palettes, attributes, coordinates, modes, and
old VRAM bytes.

Record from the drawing speed pass (2026-10-12):

- All 13 routines matched the baseline output byte for byte. Timings are in
  [notes.md](notes.md#drawing-speed-pass).
- The plotter sweep matched all 430 mode 0-2 cases. The 170 mode-3
  differences are the intended return to the original set behavior.
- A real-disk boot from `boot12dos.rtvcsnap.zip` (DSK in A and B,
  `load "*"` injected) drew the title, scenario, controls, level, and
  team/armour screens correctly. The armour screen covers double-height text,
  inverse `70H` text, and raw-glyph soldier icons. Across the scenario 1
  multi-load, only the `TVC_CONVERT_PAIR` memo byte changed in the hidden VID0
  code.

Manual checks still due after this pass: scroll the tactical map in all four
directions, blink and move the map cursor, enter and leave the firing view
and unit information, and confirm text screens and highlights.

## Beeper Audio Probe

`verify.py` checks the translated speaker bytes and that the only remaining
`OUT (FEH)` instructions in `LS2.CAS` are the unreachable ones at `5E37H` and
`B1A5H`.

A differential probe used `lsql-fire.rtvcsnap.zip` in a headless emulator.
It ran each routine with the original and then the patched `LSCODE` bytes,
behind a `DI` harness, using breakpoints on every speaker `OUT`:

- effect player `B5BEH`, all 13 effects: identical write count, level sequence
  (`00H/10H` mapped to `81H/BDH`), write-to-write T-state intervals, and final
  `B5B3H-B5BDH` state;
- chirp `8F2CH`, six consecutive calls from `5D7BH=01H`: identical write
  roles and `5D7BH-5D7DH` state, with interval changes of exactly +3, +36/38,
  and +18 T;
- `TVC_RANDOM_BEEP`: only `81H`/`BDH`, each matching the `R` bit it read.

Leave interrupts disabled in such harnesses: this snapshot resumes with them
enabled, and firmware interrupts add thousands of T-states between writes.
Screenshots taken while breakpoints stop the emulator at every speaker write
can show a partial frame of diagonal stripes; that is not a rendering fault.

In a real-disk boot from `boot12dos.rtvcsnap.zip`, the first stage left the
port `05H` mirror `0B12H` at `0FH`. It was unchanged after `LS2` and after
loading scenario 1, which continued to the controls menu.

Manual listening check: menu and selection sounds, unit movement, a fired
projectile (falling chirp), and an explosion. A user-confirmed `rtvc` run
reported working audio. In the firing snapshot, the
keyboard method plays effect 11 while idle and effect 5 on entering aim mode.

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

- none `FFH`, Fire `FEH`, Up `FDH`, Down `FBH`, Right `F7H`, Left `EFH`.

The scan was later extended so Space (row 7, C5) also returns Fire, because the
built-in keyboard joystick has no fire contact. The row 8 results above are
unchanged; re-run the probe with Space held to confirm `FEH`.

Option 4 remains the keyboard handler. Interactive play with a host joystick or
arrow keys plus Tab is a manual regression.
