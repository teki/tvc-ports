# Laser Squad TVC beeper audio

## Scope

Translate Laser Squad's Spectrum beeper output to the TVC sound DAC. The
original effect player, effect table, sweep and noise algorithms, call sites,
and sound state stay intact; only the speaker writes and the TVC sound-hardware
setup are translated.

## Source inventory

A byte scan of every loaded TAP block (`LS`, `LSCODE`, and all seven scenario
payloads) for `OUT (FEH),A`, `OUT (C),r`, and calls to ROM `BEEPER` found three
sound routines, all in `LSCODE`. The title block only sets the border, the
scenario payloads contain no speaker writes or calls into these routines, and
`79D1H` is data, not an `OUT (C)`.

| Routine | Speaker writes | Behavior |
| --- | --- | --- |
| `B5BEH` effect player | `B5F8H` | Plays one of 13 ten-byte records from `B531H` (index in `A`), copied to `B5B3H-B5BCH`: outer count, inner count, then four `(delta, period)` pairs. Each pass toggles the speaker four times with delays `period * 63 T`, then adds each delta to its period. `B5D5H` (`LB5BE_0`) replays the live, already-advanced state, which callers use to continue a sweep. About 23 call sites cover menus, selection, movement, and combat. |
| `8F2CH` projectile chirp | `8F49H` on, `8F53H` off, `8F60H` random | Square half-periods of `5D7BH` delay units; the period grows by 3 per pass up to `D2H` and persists across calls. `89B1H` resets it to 1 at the start of each shot, so pitch falls as the projectile travels. Called per trajectory step from `89B1H` and `8A20H`. |
| `9475H` explosion | `94E4H` random | Writes `R AND 10H` once per particle per animation step, interleaved with the plotter calls. `L9517H` jumps to `94E0H`, so that entry address must stay valid. |

`B5BDH` (speaker state) and `5D7BH`/`5D7CH` (chirp period and accumulator)
are referenced only by their own routines. The saved range `B621H-FFFFH`
contains none of them. Border bits 0-2 and MIC bit 3 are always zero in these
writes, which matches the game's existing black border, so no border
translation is needed.

## TVC mechanism

See the [TVC sound reference](https://github.com/teki/rtvc/blob/HEAD/info/tvc.md#sound-and-timer).
With port `05H` bit 4 clear, port `06H` bits 2-5 drive the amplitude DAC
directly. That is the TVC equivalent of a one-bit speaker. The same port
carries the video mode in bits 0-1 and printer control in bits 6-7, so every
speaker write must reproduce those bits.

Values observed in `lsql-fire.rtvcsnap.zip`:

- the port `06H` mirror at `0B13H` is `81H` (GRAPHICS 4 plus bit 7, zero
  amplitude);
- the port `05H` mirror at `0B12H` is `1FH`: bit 4 routes the stopped
  oscillator into the amplitude, so DAC writes alone would not be heard.

Speaker levels are therefore `81H` for off and `BDH` for full amplitude 15.
Both preserve the firmware mirror's mode and bit 7.

## Implementation

1. **Sound setup.** In the first-stage TVC initialization (`LS1` overlay),
   clear port `05H` bit 4 and update the `0B12H` mirror, preserving the other
   bits. After a VT-DOS scenario load, confirm the bit is still clear. If it
   is not, repeat the write in `TVC_END_DOS`.
2. **Effect player `B5BEH`.** Change `XOR 10H` at `B5F3H` to `XOR 3CH`, change
   the `OUT` port at `B5F9H` from `FEH` to `06H`, and seed `B5BDH` with `81H`.
   `B5BDH` then holds the TVC port value. The routine keeps the same bytes,
   instruction sequence, and T-states.
3. **Random level helper.** Add a 13-byte `TVC_RANDOM_BEEP` at the
   unreferenced `B614H-B620H` gap. It takes `R AND 10H` and outputs `81H` or
   `BDH`. This keeps U0's last 14 support bytes free.
4. **Explosion `94E0H`.** Replace `LD A,R / AND 10H / OUT (FEH),A` with
   `CALL TVC_RANDOM_BEEP` plus padding, keeping `94E0H` as the entry.
5. **Chirp `8F47H-8F61H`.** Map the on and off writes to `BDH` and `81H` on
   port `06H`, and the random write to the helper or an inline equivalent.
   Keep the high and low half-cycle overhead as close to the original as the
   27-byte span allows, and leave `8F2CH`, `5D7BH`/`5D7CH`, and `8F79H`
   untouched.
6. Update `notes.md`, `validation.md`, and the `verify.py` CAS hashes. Promote
   the generalized beeper-to-DAC rule, including the port `05H` bit 4 trap,
   to `knowledge/zx-spectrum.md` and `knowledge/tvc.md`.

## Timing decision

Approved: plain translation. The original delay loops stay unchanged and run
at the TVC's 3.125 MHz, so sounds are about 10.7% lower and 12% longer than on
a 3.5 MHz Spectrum, consistent with the rest of the port. Cycle compensation
(`B5BEH` unit 63 T to about 56 T, plus the `8F2CH` loops) was considered and
not chosen.

## Validation

- `verify.py`: clean rebuild and updated patched-CAS hashes.
- Headless probe from `lsql-fire.rtvcsnap.zip`: call `B5BEH` with each effect
  index 0-12, `8F2CH`, and `9475H` under a bounded instruction trace. Check
  that every speaker write targets port `06H` with `81H`/`BDH`, that intervals
  between writes match the original instruction timing, that the `B5B3H-B5BDH`
  and `5D7BH`/`5D7CH` state matches an unpatched run, and that mapper `B0H` is
  restored.
- Confirm `0B12H` bit 4 is clear after the first stage and after a scenario
  load.
- Manual `rtvc` listening: menu selection, unit movement, firing, and an
  explosion. Optionally compare against the `zx82` Spectrum runner.
