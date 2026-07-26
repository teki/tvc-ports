# ZX Spectrum Software and Translation Notes

This document describes the Spectrum 48K as a software environment for porting
games. For ULA ports, memory, video layout, keyboard wiring, interrupts, and
snapshot behavior, use the current
[Spectrum hardware reference](https://github.com/teki/rtvc/blob/HEAD/info/zx82.md).

The annotated [48K ROM assembly](48.rom.asm) is the primary software reference
for ROM entry points and their internal behavior. Its
[provenance and verification notes](48.rom.asm.md) are kept beside it.

## Inventory ROM Dependencies

Games may call documented or internal ROM routines directly. Before replacing
a missing ROM call:

1. identify the exact entry point and source ROM version;
2. inspect all callers and the registers/flags they expect;
3. trace the original when the contract is unclear;
4. determine whether the call is hardware access, a reusable software
   algorithm, or merely transport; and
5. preserve the expected interface in the TVC translation.

Do not create a permanent no-op stub just because it lets execution continue.

## Keyboard

Spectrum programs commonly read ULA rows directly, call a ROM scan routine, or
combine both approaches in different screens. Inventory every path.

Translate row reads to a TVC matrix routine or compatibility shim that returns
the bit values expected by the original caller. Preserve held-key and
debouncing semantics rather than only mapping host key names.

Do not assume one translated scanner covers the whole game. A single program
may use:

- direct ULA row reads returning active-low row bits;
- a ROM routine returning a key scan code;
- a release loop that depends on the ROM routine's no-key result; and
- a game-specific handler returning a packed action bitmask.

Inventory call sites and preserve each routine's exact flags, active polarity,
register result, and press/release behavior. Menus working does not prove that
gameplay controls use the same path.

This was verified in
[Laser Squad](../ports/laser-squad/notes.md#restored-lscode-startup-trace):
numeric polling, ROM `KEY-SCAN`, release detection, and the tactical action
bitmask required separate compatible translations.

## Display and Attributes

Preserve the original renderer, font, bitmap writes, and attribute decisions.
Choose a TVC mode that best retains the source geometry and visible color
semantics.

When the target palette has fewer simultaneous entries, every visible source
color still needs a deliberate visible fallback. Never allow an unsupported
color to fall through to palette index zero merely because the table is
incomplete.

A shadow Spectrum screen can be useful when much of the original code still
writes bitmap and attribute memory. Keep the original bitmap and attributes as
the authoritative state and treat target VRAM as a rendered cache. A bitmap
write updates the shadow and renders with the current shadow attribute; an
attribute write updates the shadow and redraws the affected cell. This removes
write-order dependence without replacing the original producers.

The palette fallback and shadow-cache strategies were verified in the
[Laser Squad graphics conversion](../ports/laser-squad/notes.md#graphics-conversion-policy).

## Interrupts and Timing

Translate IM 1/IM 2, `HALT`, and frame-timing assumptions to a deliberate TVC
interrupt strategy. Audit stack use, mapper restoration, register preservation,
and acknowledgment as one boundary; an otherwise correct renderer can fail
when an inherited firmware interrupt corrupts adjacent game state.

When corruption is intermittent, measure the deepest target interrupt stack
use against the source program's live memory—not only the nominal stack
pointer. Also search for later source instructions that restore the original
stack after loading or initialization.

The detailed
[Laser Squad interrupt-stack diagnosis](../ports/laser-squad/notes.md#tvc-interrupt-stack-isolation)
records the observed depth, misleading paging symptoms, later `SP` reset, and
validated relocation.

## Tape and Multi-load Games

Preserve the original stage-selection and data-selection logic while replacing
the transport. TAP blocks with nonstandard flags or custom loaders must be
kept in original order and traced rather than treated as ordinary CODE blocks.

For TVC output:

- use CAS when the port is genuinely single-load;
- use DSK with named CAS-style components when later stages need runtime
  loading; and
- keep transport splitting in the build script when destination banks cannot
  be mapped during VT-DOS reads.

Verify every split payload against the source block and verify its
concatenation before testing the runtime loader. See the
[Laser Squad multi-load path](../ports/laser-squad/notes.md#runtime-multi-load-transport)
for a verified transport split that leaves the game's contiguous destination
unchanged.

## Validation

Compare source and target at the entry and exit of translated routines, not
only at screen level. Save reference screenshots and meaningful source
snapshots for important stages. Validate input, drawing, interrupt-sensitive
paths, and later loads independently.
