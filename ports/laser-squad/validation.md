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
4. checks the three patched CAS hashes and compares all 16 scenario CAS
   payloads with their exact TAP slices; and
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

- **Palette:** `(PRESS 1 OR 2)` and other Spectrum ink-4 text must be visibly
  green, never black. Unsupported visible inks must remain visible.
- **Numeric input:** press and release `1` and `2`; both the release loop and
  selection call must advance.
- **Interrupt/drawing:** allow the shopping screen to draw with interrupts
  active. Coordinates must remain in range and the support image at
  `2000H-2FFFH` must not be modified by drawing.
- **Gameplay input:** verify `Q`, `A`, `O`, `P`, and Space through the
  store/tactical control path, not only in menus.
- **Multi-load:** verify the reconstructed payload at `B621H-FFFFH` matches the
  selected original TAP block.

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
