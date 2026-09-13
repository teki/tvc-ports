# Laser Squad TVC joystick control selection

## Approved scope

Map control-selection options 1-3 to the TVC joystick. Option 4 remains the
existing keyboard handler. Preserve the original four-choice menu, `B0C7H`
method byte, dispatcher at `B0C8H`, and the shared active-low action byte.

## Decisions

- Option 1 Sinclair (`B0E8H`), option 2 Kempston (`B0FDH`), and option 3
  Protek/AGF/cursor (`B117H`) all produce fire/up/down/right/left in bits 0-4.
  Replace those three hardware readers with one TVC row-8 joystick scan.
- Option 4 at `B136H` stays `TVC_GAME_KEYS` (`Q`/`A`/`O`/`P`/Space).
- Remove the Sinclair number-key compatibility reader; numeric menus already
  use the translated `KEY-SCAN` path.

## Integration

- Add `TVC_JOYSTICK` in `ports/laser-squad/src/lasersqd_loader.asm`.
- Overlay `B0E8H`, `B0FDH`, and `B117H` to that routine through `build.py`.
- Update verification baselines, notes, and focused regression checks.

## Validation

Run clean `verify.py`. Probe the three option entries and the action-bit
mapping in an isolated headless emulator. Keep generated evidence ignored.
