# Laser Squad Spectrum-to-TVC Port Notes

## Current Verified State

The disk port is playable. A user-confirmed end-to-end run passed the initial
questions, player-count and player setup, shopping-screen drawing, and the
required gameplay controls `Q`, `A`, `O`, `P`, and Space. The standalone build
recreates the same DSK as the last working `rtvc/data/porting` build.

The port preserves the original game and data and replaces narrow
hardware-facing boundaries: initial and runtime loading, Spectrum screen and
attribute rendering, palette selection, keyboard scanning, border output,
interrupt integration, and unsafe Spectrum stack assumptions.

The decisive failures found during the working-port investigation were:

| Symptom | Root cause | Implemented fix |
| --- | --- | --- |
| Numeric input stopped at menus or displayed a number without advancing | Laser Squad used several input contracts: its own numeric row scanner, Spectrum ROM `KEY-SCAN` for release/selection, and later a different gameplay handler | Patch every caller path and preserve the return value expected by each one |
| Ink-4 prompt text was invisible | Spectrum ink 4 fell through an incomplete lookup table to TVC palette index 0 (black) | Map ink 4 explicitly to the user-selected bright cyan and map unsupported visible inks to visible fallbacks |
| Shopping-screen drawing intermittently filled the display with data and the CPU later went rogue | The TVC firmware interrupt handler used more stack than Spectrum IM 1; with `SP=5E39H` it overwrote game coordinates, which then redirected drawing into the support code | Move the stack to safe U0 RAM at `4000H` and patch both the initial and post-multiload stack assignments |
| Loading screen worked but later screens were corrupt after adding the packing table | The enlarged support source at `1AB2H-21B1H` overlapped its `2000H-26FFH` runtime destination; forward `LDIR` overwrote source bytes before reading them | Relocate the support image backward with `LDDR` and reject an overlapping forward copy during the build |
| Gameplay controls did not react after the menus worked | The store/tactical handler at `B136H` read ULA rows directly and returned a packed active-low action byte; it did not use the translated ROM scan path | Add a separate TVC scanner preserving bits 0-4 for Space, Q, A, P, and O |

The intermittent drawing failure initially looked like an interrupt mapper
restore bug. Instruction tracing showed that the mapper was restored
correctly; the first meaningful corruption came from interrupt stack overlap.
This distinction matters because later invalid coordinates caused secondary
writes into `2000H-2FFFH`, making the failure look like self-modifying code or
bad paging.

## Diagnostic Checkpoints

The local ignored snapshots under `experiments/snapshots/` preserve the
investigation stages:

| Snapshot | Purpose |
| --- | --- |
| `nogreen.rtvcsnap.zip` | Prompt state where Spectrum green was incorrectly rendered as black |
| `baddraw.rtvcsnap.zip` | State immediately before pressing `1` triggered intermittent shopping-screen corruption |
| `problem.rtvcsnap.zip` | Playable drawing state used to isolate missing gameplay keyboard mappings |

The effective debugging workflow was to stop immediately before the failure,
use deterministic `key_press` input measured in 50 Hz frames, start a bounded
instruction trace, and follow the first invalid memory write back to its input
state. Screenshots established the intended visible result; mapper values,
stack depth, coordinates, and memory writes established the actual cause.

## Promoted Reusable Learnings

Future ports should discover the generalized lessons in the shared knowledge
base. This file remains the evidence record with Laser Squad addresses,
traces, false leads, and exact patches:

- [Spectrum keyboard contracts](../../knowledge/zx-spectrum.md#keyboard)
  summarizes why every polling, ROM-scan, release, and gameplay input path
  needs its original interface preserved.
- [Display and attribute translation](../../knowledge/zx-spectrum.md#display-and-attributes)
  records the visible palette-fallback and authoritative shadow-screen
  patterns.
- [Spectrum interrupts and timing](../../knowledge/zx-spectrum.md#interrupts-and-timing)
  and
  [TVC interrupt integration](../../knowledge/tvc.md#interrupt-integration)
  capture the target stack-depth and later-`SP`-assignment checks.
- [Tape and multi-load games](../../knowledge/zx-spectrum.md#tape-and-multi-load-games)
  and [TVC disk transfer and paging](../../knowledge/tvc.md#disk-transfer-and-paging)
  describe verified direct loading across mapped U2 and U3 without changing
  the original payload.
- [Corruption investigation](../../knowledge/tooling.md#corruption-investigation-pattern)
  preserves the reusable snapshot, deterministic input, bounded trace, and
  first-invalid-write workflow.
- [Reproducible inputs and validation](../../knowledge/porting.md#start-with-reproducible-inputs)
  describes rebuilding narrow overlays from verified source and validating
  content rather than only container shape.

## Loading Path

## Current Loading Path

### TVC disk loader draft

[lasersqd_loader.asm](src/lasersqd_loader.asm) builds the first TVC BASIC loader
artifact. The current strategy is disk-first: generate normal TVC `.CAS`
program files as working inputs to a DSK, then patch runtime loads to named
files.

The loader follows the same shape as
[`TVBALL.CAS`](https://github.com/teki/rtvc/blob/HEAD/progs/TVBALL.CAS):

- the outer CAS file has a 144-byte container header;
- the application metadata at `0080H` marks a BASIC program file
  (`type = 01H`) with autorun enabled (`FFH`);
- the payload is loaded at the BASIC program area address `19EFH`;
- a tokenized line 10 performs `CALL USR(6704)`, which enters code at
  `1A30H`;
- the assembly loader opens `LS1.CAS`, block-reads its payload to `7530H`, and
  calls `7530H`;
- after that returns, it opens `LS2.CAS`, block-reads its payload to `5E28H`,
  and calls `5E28H`.

[lasersqd_tvc_loader.bas](src/lasersqd_tvc_loader.bas) remains only the old ASCII
planning note; it is not placed on the disk image.

```basic
10 CALL USR(6704)
```

This preserves the original Spectrum BASIC structure—load first block, call
it, load second block, call it—while moving both targeted loads into assembly
because TVC BASIC cannot load a named file to an explicit address. The second
stage is now the original `LSCODE` payload with a narrow TVC hardware overlay;
the DSK maps the first runtime IDs `64H`, `65H`, `66H`, and `68H` to one named
file each. The sequence for the later repeated `68H` TAP blocks remains to be
verified.

The standalone [lasersqd_loader.asm](src/lasersqd_loader.asm) shares one
`LOAD_BLOCK` routine between both stages. Its call sequence is:

```asm
        LD DE,FIRST_BLOCK_NAME
        LD BC,%FIRST_BLOCK_SIZE%
        LD HL,7530H
        CALL LOAD_BLOCK
        JR NZ,LOADER_DONE
        CALL 7530H

        LD DE,SECOND_BLOCK_NAME
        LD BC,%SECOND_BLOCK_SIZE%
        LD HL,5E28H
        CALL LOAD_BLOCK
        JR NZ,LOADER_DONE
        CALL 5E28H
```

`EA35H` is a BASIC `LOAD` helper: it evaluates the BASIC filename expression
and therefore cannot be called with an assembly filename in `DE`. Low-level
assembly filenames are length-prefixed (`DB 3,"LS2"`). The ROM variable at
`1705H` is the I/O device selector: the high nibble holds the device number
times `10H`, while the low nibble selects the operation. BASIC's verified disk
input setup stores `D0H` there (`50H` disk device plus the `80H` input bit), so
open, block input, and close dispatch as `D3H`, `D2H`, and `D4H`. In contrast,
the `20H` value normally present at the BASIC prompt selects the editor and
must not be inherited by a disk loader.

The generated code dispatches through the writable RAM trampoline at `001BH`.
It block-reads the 16-byte TVC application header to `19DFH`, then block-reads
the payload to its requested destination. The ROM disassembly confirms that
`CAS_BKIN` stores `DE` at `0D10H` and `BC` at `0D09H` before reading.

VT-DOS presents the floppy as a transparent replacement for cassette I/O.
Files inserted into the DSK therefore retain the full 144-byte CAS container;
the disk driver exposes the internal 16-byte application header first.

The checked-in loader source begins with `BASIC_START` and is passed directly
to `rtvc-asm --format cas`. The assembler owns the tokenized `10 CALL
USR(6704)` line, padding to `1A30H`, autorun metadata, and outer CAS container.
The Python build only passes the two assembled payload lengths with `-d
FIRST_BLOCK_SIZE=...` and `-d SECOND_BLOCK_SIZE=...`; missing `%NAME%`
definitions fail before assembly.

The two-stage path is verified end to end through the real BASIC `CALL
USR(6704)` entry. With breakpoints on both original entry addresses, the
debugger first stopped at `7530H` after the named `LS1.CAS` load, then at
`5E28H` after the first stage returned and the named `LS2.CAS` load completed.
The restored `LS2TVC.BIN` is exactly `57F9H` bytes, matching the original
`LSCODE` block. Current patches place TVC support in page-0 U0 RAM at `2120H`,
change the immediate border port at `5E38H` from Spectrum `FEH` to TVC `00H`,
and redirect the numeric-key and Spectrum graphics entry points to it.

[build.py](build.py) builds the standalone disk image:

```bash
python3 build.py
```

Intermediate assembler TOML, raw BIN, and CAS files are kept under the ignored
`build/` directory. Only the completed disk image is retained under
`dist/`. The current image is `dist/lasersqd_tvc.dsk`.

Current files on the image:

| File | Source | Meaning |
| --- | --- | --- |
| `LOADER.CAS` | [lasersqd_loader.asm](src/lasersqd_loader.asm) | Autorun BASIC wrapper plus the two-stage assembly disk loader |
| `LS1.CAS` | [lasersqd_ls_7530_tvc.asm](src/lasersqd_ls_7530_tvc.asm) | Converted first-stage payload loaded to `7530H` |
| `LS2.CAS` | [lasersqd_lscode_5e28_tvc.asm](src/lasersqd_lscode_5e28_tvc.asm) | Original `LSCODE` payload plus the TVC hardware overlay, loaded to `5E28H` |
| `L64.CAS` | `LASERSQD.TAP` block 6 | Scenario 1 payload loaded unchanged at `B621H-FFFFH` |
| `L65.CAS` | `LASERSQD.TAP` block 7 | Scenario 2 payload loaded unchanged at `B621H-FFFFH` |
| `L66.CAS` | `LASERSQD.TAP` block 8 | Scenario 3 payload loaded unchanged at `B621H-FFFFH` |
| `L68.CAS` | `LASERSQD.TAP` block 9 | First expansion payload loaded unchanged at `B621H-FFFFH` |
| `G64.CAS`-`G68.CAS` | Offline conversion of each scenario's `E8DFH-FFFEH` table | One native GRAPHICS 4 mask table per scenario, loaded into ordinary U0/U1 RAM |

[lasersqd_lscode_5e28_tvc.asm](src/lasersqd_lscode_5e28_tvc.asm) is an overlay, not
a replacement implementation. The build takes the pristine `5E28H-B620H`
segment from verified `LASERSQD.TAP` block 5 and applies its patches. Address
`B621H` is
deliberately unavailable for appended TVC code because the original multiload
system loads and calls its first overlay there.

### Restored `LSCODE` startup trace

The original entry at `5E28H` disables interrupts, clears its workspace at
`5B00H-5E25H`, selects a black Spectrum border, sets the stack to `5E39H`, and
jumps to the original initializer at `B1C3H`. The current overlay retains that
original workspace clear, places TVC support in page-0 U0 RAM at `2120H`, and
translates the border output to TVC port `00H`.

An end-to-end TVC debugger trace reached these original routines in order:

1. `5E28H` — restored `LSCODE` entry;
2. `B1C3H` — main initializer;
3. `602CH` — Spectrum bitmap/attribute clear;
4. `A276H` — initial option selection; and
5. `B0C8H` — input-device dispatch.

At the first input dispatch, `B0C7H` is zero, selecting control method 1 at
`B0E8H`. The original four `CONTROLS ?` choices remain: Sinclair, Kempston,
Protek/AGF/cursor, and keyboard. The first three Spectrum joystick readers
all produce the same active-low action byte (fire, up, down, right, left in
bits 0-4). Their entries at `B0E8H`, `B0FDH`, and `B117H` now jump to one TVC
joystick scan of keyboard row 8 (Tab/Fire, Up, Down, Right, Left). Numeric
menus do not use this path.

The scenario-selection path calls Spectrum ROM `KEY-SCAN` (`028EH`) at
`6A74H` while waiting for key release and again at `A290H` while accepting the
next selection. Both calls now target a page-0 TVC matrix scanner which returns
the original Spectrum numeric scan codes in `E`: `24H`, `1CH`, `14H`, `0CH`,
and `04H` for keys `1`-`5`, with `FFH` for no key. Codes for `0` and `6`-`9`
are mapped as well. Leaving the release-loop call unpatched can trap the menu
before the translated selection scan. Holding TVC key `1` for several 50 Hz
samples advanced the second module from its numeric wait in an end-to-end
debugger run.

The store and tactical UI use control method 4 when `B0C7H` contains `03H`.
Its handler at `B136H` does not call Spectrum ROM: it reads Spectrum keyboard
rows directly through port `FEH` and returns an active-low action byte with
Space, Q, A, P, and O in bits 0-4 respectively. The TVC overlay now redirects
that handler to a page-0 scanner for TVC row/column positions `7/5`, `2/6`,
`4/6`, `3/6`, and `3/2`, preserving the original action-bit interface for the
unchanged game logic.

The same page-0 image replaces only the hardware-specific bodies of the
original `602DH` screen clear, `6072H` normal glyph renderer, `64F7H`
double-height text renderer, and `60AFH` large four-quadrant renderer. It
retains coordinates at `5CFEH`, attributes at `5D00H`, and the original call
interfaces. The build converts the `B139H` font and each scenario's `E8DFH`
large table offline. The replacement renderers read those native masks and
write them directly to VID0 with the active four-color palette profile.

The firing cross is not a glyph. The original `8B7AH` routine XORs 21 pixels
through the common plotter at `8444H`: the center and offsets 1-5 along both
axes. The native port now translates that plotter itself, including set,
clear, XOR, and its logical collision result at `5DA5H`. The cross and later
direct-pixel paths therefore update VID0 without a Spectrum bitmap shadow.

For rapid testing, bypass BASIC and the initial disk input: start from the boot
snapshot with `dist/lasersqd_tvc.dsk` mounted and load
`build/lasersqd_loader_bootstrap.toml`,
`build/lasersqd_ls_7530_tvc.toml`, `build/lasersqd_lscode_5e28_tvc.toml`,
`build/lasersqd_tvc_font.toml`, and `build/lasersqd_tvc_support.toml` with the
debugger. After a scenario load, also inject the matching generated `Gxx.CAS`
payload at `2880H` (`1640H` bytes) and `4000H` (`1800H` bytes), then set
`PC=5E28H` and continue. The bootstrap TOML supplies the shared `LOAD_BLOCK` implementation
at `1A64H`, which runtime scenario loads also call. The support TOML is the
same relocated byte image embedded in `LOADER.CAS`; both files are generated
solely as ignored test intermediates.

This rapid path reached the replacement clear and normal-glyph entries under
debugger breakpoints. A captured framebuffer also showed the two original
large yellow insignia glyphs produced through the converted `60AFH` path.
After translating `64F7H`, the same path displays the original red `LASER
SQUAD` heading, yellow `WHICH SCENARIO ?` prompt, and cyan five-scenario list.
One small cyan glyph at the upper-left remains to be traced to its original
draw call. It is already visible before scenario selection and is not a
multiload status or the selected scenario number.

### Runtime multi-load transport

The original multiload boundary at `B15CH` prepares a `49DFH`-byte payload at
`B621H` and originally enters the Spectrum ROM tape loader through `B199H` and
`B1A0H`. Mode 1 now jumps to the page-0 TVC support while retaining the
original IDs selected by `B1C3H`: `64H`, `65H`, `66H`, and `68H`.

Each original payload is stored as one named CAS containing its unchanged
`49DFH` bytes. The page-0 loader maps U2 and U3 together, then block-reads the
selected file directly across `B621H-FFFFH`.

After that unchanged payload succeeds, the selector opens one derived
`G64`/`G65`/`G66`/`G68` file. Two reads from that single file place its first
89 native large glyphs at `2880H-3EBFH` and the remaining 96 at
`4000H-57FFH`. This uses ordinary 64K CPU RAM and VID0 only, while retaining
320 bytes below `SP=4000H`. A direct ID-`64H` test compared the original
scenario and both native destinations byte-for-byte after the ROM calls.

This replaced an earlier four-file staged transport which had assumed VT-DOS
could not write beneath its page-3 ROM window. The reusable
[direct-U3 disk probe](../../knowledge/tvc-disk-u3-read-probe.asm) disproved
that assumption for TVC 1.2 + VT-DOS.

The initial blocks and scenario payloads share the assembly `LOAD_BLOCK`
implementation resident in U0. A direct emulator call with mode 1 and ID
`64H` reached the success return. The mapped memory at `B621H-FFFFH` was then
compared byte-for-byte with original TAP block 6; all `49DFH` bytes matched.

Known multiload TVC games often use BASIC only for the first program/bootstrap,
then let machine code perform later loads through ROM cassette routines. The
extension ROM contains cassette entries around `F3FAH`;
`data/TVC12_D7.64K.asm` identifies nearby routines:

| Address | Label | Current note |
| ---: | --- | --- |
| `F3FAH` | `LF3FA` | Cassette entry path referenced by EXT cassette wrappers |
| `F405H` | `CAS_OPEN_READ` | Opens a cassette file for reading |
| `F630H` | `CAS_BKIN` | Reads a block from cassette |
| `F653H` | `CAS_CHOUT` | Writes one character to an open cassette file |
| `F6ADH` | `CAS_BKOUT` | Writes a block to cassette |

The BASIC book photo confirms an internal `SAVE` file payload header before the
program memory image:

```text
byte 0       00H
byte 1       type byte; 01H for program files, 00H for ASCII files
bytes 2-3    size, including terminating 00H
byte 4       auto-run mode; non-zero means run immediately after LOAD
bytes 5-14   currently unused, zero
byte 15      version, zero
```

This 16-byte header is distinct from the outer CAS/tape block metadata.
`TVCBALL.CAS` shows bytes `7-8` set to `19EFH`, the BASIC program load area.
The generated Laser Squad loader mirrors that field. Later multiload blocks may
intentionally bypass or bend the normal file format for copy protection, so keep
that possibility open when designing the runtime loader.

For now, disk packaging reduces the problem: each converted code or data block
can become a named DSK file, and the runtime loader shim can map original
multiload block IDs to filenames.

### TAP conversion

The verified source tape is downloaded when absent and converted to readable
TOML:

```bash
python3 prepare.py
```

The ignored `build/prepared/LASERSQD.TAP.toml` preserves all 13 original TAP
blocks. Its expected SHA-256 is recorded in `port.toml`. The sections are
grouped for loader/debugger use, and `tap_order` records the original tape
chronology:

| TAP block | TOML section | Meaning |
| ---: | --- | --- |
| 0 | `headers` | `LSQUAD` BASIC program header |
| 1 | `data_blocks` | `tap_program_0_LSQUAD` BASIC loader payload |
| 2 | `headers` | `LS` CODE header |
| 3 | `segments` | `tap_code_0_LS`, loads at `7530H`, length `067DH` |
| 4 | `headers` | `LSCODE` CODE header |
| 5 | `segments` | `tap_code_1_LSCODE`, loads at `5E28H`, length `57F9H` |
| 6 | `raw_blocks` | multiload/custom payload, flag `64H`, length `49DFH` |
| 7 | `raw_blocks` | multiload/custom payload, flag `65H`, length `49DFH` |
| 8 | `raw_blocks` | multiload/custom payload, flag `66H`, length `49DFH` |
| 9 | `raw_blocks` | multiload/custom payload, flag `68H`, length `49DFH` |
| 10 | `raw_blocks` | multiload/custom payload, flag `68H`, length `49DFH` |
| 11 | `raw_blocks` | multiload/custom payload, flag `68H`, length `49DFH` |
| 12 | `raw_blocks` | multiload/custom payload, flag `68H`, length `49DFH` |

The BASIC loader decodes to:

```basic
10 CLEAR 24100:
   LOAD "" CODE:
   RANDOMIZE USR 30000:
   INK 0:
   PAPER 0:
   PRINT AT 0,0;:
   LOAD "" CODE:
   RANDOMIZE USR 24104
```

This establishes the first-stage load sequence:

1. `CLEAR 24100` moves BASIC's RAMTOP below the machine-code area.
2. `LOAD "" CODE` loads `LS` at `7530H`.
3. `RANDOMIZE USR 30000` jumps to `7530H`.
4. The BASIC loader sets display attributes.
5. `LOAD "" CODE` loads `LSCODE` at `5E28H`.
6. `RANDOMIZE USR 24104` jumps to `5E28H`.

The seven later non-standard TAP blocks are no longer treated as ignorable
trailing data. They are preserved as `raw_blocks` because Laser Squad is a
multiload game. Their first bytes look code-like, for example block 6 begins
`C3 9F B8 C3 C4 BE C3 46 C1 C3 DE C1 C9 00 00 C9`. The destination and timing
for these payloads should be recovered by tracing the runtime loader.

### SkoolKit disassembly

[disassembly/](disassembly/) contains the SkoolKit 10.0
working set derived from `LASERSQD.TAP`: a pinned local Python environment
definition, tape and snapshot reports, an editable control file, the `.skool`
source, and generated labelled Z80 assembly. The canonical disassembly covers
the pristine `LSCODE` payload at `5E28H-B620H`; a separate loader-simulation
snapshot records the program waiting in the Spectrum ROM for its first custom
multiload block.

The rebuild commands and the current static-analysis limitations are documented
in [disassembly/README.md](disassembly/README.md).

### Historical snapshot bridge path

The previous snapshot bridge remains as an experiment, but its reference
snapshot is not a port input. Supply a compatible Spectrum 48K `.z80`
snapshot explicitly when using it:

```bash
python3 experiments/z80-bridge/z80_to_toml.py \
  /path/to/reference.z80 -o /tmp/reference.z80.toml
```

Start rtvc with the debugger, load the decoded RAM through
`scripts/rtvc_debug.py`, then assemble and load
[lasersqd_z80_bridge.asm](experiments/z80-bridge/lasersqd_z80_bridge.asm).

The bridge maps the TVC 64K+ memory layout close to the Spectrum snapshot:

   | CPU range | TVC mapping | Spectrum role |
   | --- | --- | --- |
   | `0000-3FFF` | U0 | ROM shim and bridge code |
   | `4000-7FFF` | VID0 | Spectrum screen/RAM segment |
   | `8000-BFFF` | U2 | Spectrum RAM segment |
   | `C000-FFFF` | U3 | Spectrum RAM segment |

## What Worked

- `experiments/z80-bridge/z80_to_toml.py` decodes a compatible `.z80`
  snapshot into loadable 16 KiB RAM
  segments and preserves the saved register/PC metadata.
- `rtvc-tap2toml` decodes `LASERSQD.TAP` into readable TOML with
  hex values, 16 bytes per line, ASCII gutters, decoded BASIC loader text, and
  complete TAP block coverage through `tap_order`.
- `rtvc-dsk put` can insert host files into a formatted DSK, and
  [build.py](build.py) creates the standalone Laser Squad disk image.
- Mapping `VID0` into page 1 makes Spectrum writes at `4000H` visible on the
  TVC display, which is enough for early graphics bring-up.
- A tiny U0 shim can restore the snapshot register state, provide IM 1/NMI
  handlers, and jump into the saved Spectrum execution point.
- The historical snapshot bridge's ROM keyboard-scan stub at `02ABH` returns
  "no key" instead of falling through unmapped Spectrum ROM code. The active
  disk port translates the actual numeric and gameplay callers instead.

## `LS` Block at `7530H`

The first `CODE` block loaded by BASIC is now extracted and disassembled as
[lasersqd_ls_7530.asm](src/lasersqd_ls_7530.asm):

```bash
rtvc-disasm \
  --origin 7530H \
  --title "Laser Squad LS loader block at 7530H" \
  --data-range 753BH-7622H \
  --data-range 763AH-763EH \
  --data-range 76DCH-76E3H \
  --data-range 787DH-7BADH \
  /tmp/lasersqd_ls_7530.bin \
  -o src/lasersqd_ls_7530.asm
```

Initial control flow:

```asm
7530  XOR A
7531  OUT (FEH),A
7533  CALL 785EH
7536  LD A,01H
7538  JP 7623H
```

Current interpretation:

- `785EH` clears the Spectrum display and attributes (`4000H-5AFFH`).
- `753BH-7622H` is intro/title script data containing text such as
  `TARGET GAMES`, `LASER  SQUAD`, and `A TACTICAL WARFARE SIMULATION`.
- `7623H` initializes script-rendering state and calls `76E4H`.
- `763FH` and `769FH` render characters/glyphs into Spectrum bitmap memory and
  update attributes.
- `76E4H` interprets `|`-delimited script streams and control tokens.
- `7874H` waits for a Spectrum key press by polling `IN (FEH)`.
- `787DH-7BADH` is lookup/font data used by the renderer.

This block appears to be the intro/title renderer launched by
`RANDOMIZE USR 30000`, not the later multiload payload loader.

### First TVC graphics overlay

[lasersqd_ls_7530_tvc.asm](src/lasersqd_ls_7530_tvc.asm) is a hardware-specific
overlay for the original `7530H-7BADH` block, not a replacement title screen.
The build script first assembles the pristine Spectrum block, then applies the
overlay and appends the TVC routines at `7BAEH`. The original interpreter,
script, custom font, lookup tables, and self-modifying state remain intact.

The overlay currently:

- runs at `7530H`, matching the original first-stage entry;
- selects TVC `GRAPHICS 4` directly through the port `06H` shadow, selects
  VID0 through port `0CH`, and clears video RAM with `LDIR`;
- temporarily maps `VID0` at `8000H-BFFFH` and restores the previous mapper
  byte when the original interpreter returns;
- patches only the Spectrum-dependent entry, clear, normal-glyph,
  large-glyph, and key-wait routines;
- translates each eight-pixel Spectrum font row into two GRAPHICS 4 bytes,
  retaining the original 256-pixel logical width;
- preserves the original large-font behavior by duplicating each source row;
- uses palette indices 0 and 1 for the original one-bit glyph data, currently
  black and bright green; and
- scans all eleven TVC keyboard rows until a key is held long enough to be
  observed by the polling loop; and
- after the original interpreter completes, holds the finished loading screen
  for approximately two seconds while alternating a bright cyan/red border
  about every 20 PAL raster lines, then restores the black border before
  returning to the loader.

The first end-to-end run displayed the original `TARGET GAMES`, `LASER SQUAD`,
and `A TACTICAL WARFARE SIMULATION` title content in GRAPHICS 4. The narrow original `T` glyph is hard
to read at the current emulator screenshot scale, but its original font bytes
are present unchanged; this is a later display-tuning issue, not grounds for a
replacement font.

The current assembled artifact is generated as
`build/lasersqd_ls_7530_tvc.toml`.

The `7530H` title renderers now use the same canonical shadow policy as the
main block. Original `769FH` normal glyphs and `763FH` vertically doubled
glyphs first update `4000H-57FFH` and their attributes in `5800H-5AFFH`, then
redraw the affected TVC cells from that state. The original `785EH` clear also
clears both the Spectrum shadow and VID0.

The title script uses Spectrum inks 2, 3, 4, 5, 6, and 7 simultaneously.
GRAPHICS 4 provides only three non-black palette entries, so it cannot display
all six original title colors at once. The current transitional palette maps
green, red, and white exactly; with explicit approval, cyan, yellow, and
magenta now fall back to white so no original title glyph becomes invisible.
The shadow retains every original attribute for the later native four-color
conversion.

## Graphics Conversion Policy

The Spectrum bitmap is 256 pixels wide, or 32 bytes per bitmap row. The TVC
display layout is different, and the final port should patch or rewrite the
graphics routines rather than relying on a global CRTC change.

The loader changes only CRTC register 6 from 60 to 48 displayed character rows
before the first title clear. With four rasters per row this gives the
Spectrum-height 192 active lines and limits the displayed VID0 range to
`0000H-2FFFH`. Registers 4, 5, and 9 remain unchanged, so PAL frame timing
remains 314 raster lines; the start address and cursor interrupt position are
also retained. This does not perform graphics conversion: the native TVC
renderers remain responsible for the different pixel layout. Title and game
clears now cover only the displayed 12 KiB and preserve `3000H-3FFFH`.

The first pass uses GRAPHICS 4. Although TVC two-color mode has 512 physical
pixels, both modes need two TVC bytes to represent one 8-pixel Spectrum source
byte at the intended logical width. GRAPHICS 4 therefore keeps the Spectrum's
256-pixel geometry directly and leaves palette indices 2 and 3 available for
later faithful attribute conversion.

Graphics conversion proceeds routine by routine:

- patch Spectrum bitmap and attribute writes to TVC memory deliberately;
- retain the original renderer, script, font, and data wherever they are not
  hardware-dependent;
- document each patched renderer and table; and
- translate the original Spectrum ink/paper and brightness semantics onto the
  four TVC palette entries as the relevant game routines are reached.

### Transitional Spectrum screen shadow

During porting, the game may write a character's bitmap before its color
attribute or write the attribute first. The final TVC pixels cannot be derived
until both values are known, and GRAPHICS 4 VRAM alone does not preserve the
original one-bit Spectrum bitmap after color expansion.

The agreed solution is to keep the original Spectrum screen memory as the
authoritative shadow:

- `4000H-57FFH` retains every original Spectrum bitmap write;
- `5800H-5AFFH` retains every original Spectrum attribute write; and
- TVC video RAM is only a rendered cache derived from those two regions.

A translated bitmap write first updates the shadow byte, then reads the
corresponding shadow attribute and renders that byte into TVC VRAM. A translated
attribute write first updates the shadow attribute, then redraws all eight
bitmap rows of that character cell from the shadow bitmap. Clearing the screen
clears both the Spectrum shadow and TVC VRAM. This makes bitmap-first and
attribute-first code produce the same final display while preserving the
game's original screen state for later redraws.

Every direct screen or attribute writer reached during the port must either use
this path or receive the same narrow translation; TVC VRAM must never become
the only copy of original pixel data. This is a transitional compatibility
strategy. Once the relevant graphics are deliberately converted to native
four-color data, those converted paths no longer require Spectrum attribute
recombination.

The later main-game compatibility renderer selects its GRAPHICS 4 colors from
a table of four-byte palette profiles. Profile 0 is black, bright cyan, yellow,
and red for the control-selection screen; profile 1 is black, bright green,
yellow, and red for subsequent setup screens; profile 2 is black, bright
green, bright cyan, and yellow for team/armour setup; profile 3 is black,
grey, bright cyan, and yellow for deployment; profile 4 is black,
bright cyan, yellow, and magenta for hidden movement; profile 5 is black,
yellow, bright green, and bright cyan for tactical maps; and profile 6 is
black, dim white, yellow, and bright cyan for firing. The common clear routine
applies the currently selected profile to ports `60H-63H`, so additional
game-phase palettes can be added without duplicating the hardware writes.

The `B0ADH` control-screen entry selects profile 0 before its clear. At the
shared `B0C3H` exit, a narrow compatibility call preserves and stores the
selected method and selects profile 1 without immediately changing the visible
screen. The next screen clear applies bright green, avoiding both the
control-screen recolor and the next screen reverting to cyan.

Each palette profile also has an eight-entry Spectrum-ink-to-slot map. Profile
2 keeps source green, cyan, and yellow distinct and deliberately maps Spectrum
white to the bright-cyan slot. The supplied `lsq-lvlsel.rtvcsnap.zip` trace
showed that pressing `1` reaches the team/armour setup clear through `9D55H`;
that entry now selects profile 2 before the shared clear.

The placement screenshot pairs show a different priority: both teams may be
visible at once, with cyan ink on blue paper for one team's `D` fields and
yellow ink on red paper for the other. Those five colors including black
cannot coexist in GRAPHICS 4. The accepted profile 3 therefore keeps team
identity in cyan and yellow: Spectrum blue/cyan map to bright cyan, red/yellow
map to yellow, and green/white use grey. The existing equal-slot fallback
makes each `D` black on its cyan or yellow field; deployed soldiers keep those
same team colors.

Debugger tracing located the common placement clear at `A370H`; both player
paths call it, so that entry selects profile 3 before the original clear.
After placement, `5E92H` enters `B1F7H`, which constructs the hidden-movement
interstitial. Its clear selects profile 4. When `B1F7H` returns through
`5E95H`, the compatibility hook immediately applies profile 5 and rebuilds the
resident native large-glyph table before tactical drawing begins. Because the
movement screen uses text but no large map tiles, its wrapper temporarily
marks the large table unloaded while applying profile 4. Unit information at
`874DH` is the same kind of interstitial: `875AH` supplies attribute `46H` to
the non-XOR clear, selects the existing setup profile 1, and shares that
table-preservation helper. Its `8875H` exit restores profile 5 before the
original clear and map redraw, reusing the firing-exit restoration. The table
therefore retains its preceding colorization around both screens, and the
profile-5 restore performs a 185-glyph rebuild only when the retained table is
not already tactical.

Visual testing favored the earlier yellow rendering over neutral gray on the
tactical map. Profile 5 therefore maps Spectrum white, yellow, red, and
magenta to its yellow slot, keeps cyan distinct, and maps blue floor grids
onto the existing green slot. The firing profile keeps dim white because its
yellow slot is reserved for trajectory markers.

The firing display begins at `8495H`. Its original call at `8497H` supplies
attribute `45H` to the non-XOR screen-clear entry; the compatibility wrapper
preserves that value while selecting profile 6. The firing exit at `85C3H`
restores profile 5 before the original clear and tactical-map redraw. This
keeps walls neutral in both phases while reserving yellow for trajectory
markers and cyan for the firing crosshair.

The renderer maps both halves of each Spectrum attribute through the active
profile: bitmap bits set to one use the ink slot, while cleared bits use the
paper slot. The supplied team-setup shadow contained `70H` on the selected
soldier name—black ink on bright-yellow paper. Earlier TVC packing masked the
attribute with `07H` and forced every cleared pixel to black, losing that
reverse-video highlight. The native colorizer now reproduces it without adding
a game-specific inverse flag.

The initial two-slot change exposed a second boundary: the selection
highlighter at `6918H` updates a two-row by eight-column attribute region
directly. Its store at `6941H` changed the Spectrum shadow to `70H`, but did
not redraw the already-rendered TVC cell, so the visible selection remained
yellow-on-black. The overlay now replaces the four-byte
`OR 40H`/store/increment sequence at `693FH-6942H` with a native helper. It
preserves the original transformation and register/flag result, writes the
attribute state, recolors the already-rendered native cell by swapping its
palette-slot encoding, and performs the original `HL` increment.

The completed weapon-selection banner uses Spectrum cyan ink on blue paper.
Profile 2 maps both source colors to its bright-cyan slot, initially producing
cyan-on-cyan. The attribute mapper now detects when ink and a non-black paper
collapse onto the same TVC slot and changes only the ink fallback to black.
This produces high-contrast black-on-cyan for the banner without changing
ordinary cyan weapon graphics drawn on black.

Previously ink 4 fell through to palette index 0, making text such as
`(PRESS 1 OR 2)` disappear against the black background. Colors absent from a
profile's four-entry palette use deliberate visible fallbacks rather than
black.

The previous compatibility renderer computed the selected ink/paper prefix once
per character cell and expands each source nibble through a page-aligned
256-byte table at `2600H`. This replaces the former nested nibble and
palette-slot calls without changing the shadow-screen, inverse-paper, palette,
or mapped-color collision rules. In `rtvc`, a representative
`TVC_REDRAW_SHADOW_CELL` call from `lsql-fire.rtvcsnap.zip` fell from 5,926 to
2,414 Z80 cycles, a 2.46-times speedup. The build validates all 256 table
entries against the GRAPHICS 4 split-plane encoding.

Adding that table grew the loader's embedded support source across its runtime
destination: source `1AB2H-21B1H` and destination `2000H-26FFH`. The original
forward `LDIR` therefore copied correctly only until its destination caught
its source, then replicated already-overwritten bytes into the later drawing
support. This explains why the separately loaded title screen remained good
while subsequent screens were corrupt. Startup now initializes `HL` and `DE`
to the ends of those ranges and uses `LDDR`; the build checks the relocation
opcode whenever the ranges overlap.

### Native main-game graphics

[graphics.py](graphics.py) now performs the Spectrum-to-TVC conversion during
the build. Every Spectrum bitmap byte becomes two GRAPHICS 4 bytes whose set
pixels select palette slot 3 and whose clear pixels select slot 0. Runtime
colorization remaps those two logical slots to the ink and paper chosen by the
active palette profile; the assets therefore remain reusable across menus,
placement, and gameplay palettes.

The converted memory layout on a 64K TVC is:

| Range | Size | Use |
| --- | ---: | --- |
| `1B1EH-211DH` | `0600H` | Loader-resident slot-3 native font codes `20H-7FH` |
| `2120H-284FH` | `0730H` | Relocated TVC runtime support |
| `2880H-3EBFH` | `1640H` | First 89 native large glyphs |
| `4000H-57FFH` | `1800H` | Remaining 96 native large glyphs |
| `5800H-5AFFH` | `0300H` | Spectrum attribute state retained for game logic |
| `5B00H-FFFFH` | — | Original game workspace/code and scenario payload |

The undisplayed tail of VID0 holds two more offline-colored font variants and
their drawing code: slot 1 at `3000H-35FFH`, slot 2 at `3600H-3BFFH`, and 660
bytes of code at `3C00H-3E93H`. The installed 3,732-byte payload fits inside
the reserved 4 KiB. Installation happens before the first VT-DOS operation,
and the build rejects overlap with the end of VID0.

`SP=4000H` grows downward with `140H` (320 bytes) clear between the stack top
and the low native table. The high table deliberately occupies the retired
Spectrum bitmap-shadow range. No VID1 or VID2 storage is required: page 2 is
mapped to VID0 only for the actual screen writes.

The printable main font and its slot-1/slot-2 black-paper variants are embedded
in `LOADER.CAS`. Each unchanged scenario payload has one generated
`G64`/`G65`/`G66`/`G68` companion containing 185 neutral native entries in the
order of the scenario's `E79FH` descriptor table, not source-glyph order. This
retains the same 11,840-byte allocation while allowing one source glyph to have
different fixed descriptor attributes. The loader reads each companion as one
file with two block reads into the non-contiguous ranges above.

After a scenario load, a hidden-VID0 routine rebuilds those entries from the
pristine `E79FH` descriptors and `E8DFH` Spectrum source into final TVC
ink/paper bytes. Palette changes rebuild the table once; repeated screen clears
with the same palette skip the work. The original `B139H` font tail remains a
64-entry ink/paper colorization table for text and other dynamic drawing.

The normal and double-height text renderers consume native font data directly,
while the large renderer consumes scanline-ordered native tiles. The original
firing code still calls its common pixel plotter; the
patched body at `844CH` performs native set, clear, and XOR operations and
preserves the collision result at `5DA5H`. Attribute-only selection changes
recolor the existing native cell rather than reconstructing a Spectrum bitmap.

Representative emulated Z80 cycle counts for the non-map renderers remain:

| Renderer | Spectrum original | Compatibility | Native |
| --- | ---: | ---: | ---: |
| Normal glyph, black paper | 655 | 2,414 | 1,226 |
| Large raw-glyph compatibility call | 1,853 | 6,438 | converted on demand |

The original `612AH` routine draws an entire 11-by-11 map. Its code is in U1
and its map and descriptor data are in U3, so the port caches only the
U2-resident descriptor pointer before mapping VID0. With the normal `E79FH`
table, the mapped loop now indexes final-color native entries directly and
leaves VID0 mapped across all 121 tiles. Temporary descriptor tables such as
`E65FH`, plus direct `60AFH` glyph callers, convert one original glyph through
the 64-byte scratch area at `3EC0H` to preserve their original semantics.

A controlled `E79FH` draw from `lsql-fire.rtvcsnap.zip` now takes 269,472
cycles, down from 380,671 for the four-quadrant descriptor-native path and
645,618 for the earlier batched mask/recolor path. Each 16-by-16 tile is stored
as sixteen contiguous four-byte scanlines, and one unrolled writer copies its
64 bytes while advancing by the 64-byte TVC raster stride. The change saves
111,199 cycles (29.2%) over the previous native path and 376,146 cycles (58.3%)
over mask/recolor. The complete map takes 4.31 TVC frames, or 86.2 ms.

The runtime palette rebuild transposes the original four 8-by-8 Spectrum
quadrants into that scanline layout and takes 1,295,276 cycles in the same
injected test; it is skipped when a clear reapplies an unchanged palette. A
model comparison of all 11,840 resident bytes against the live descriptor
attributes, source glyphs, collision fallback, and profile-3 color map matched
exactly. The raw-glyph fallback also matched all 64 expected screen bytes and
restored mapper shadow `0003H` to `B0H`.

Common black-paper font draws select an offline-colored font and bypass runtime
mask preparation. Inverse and non-black-paper text retains the generic
mask/XOR path. Large map tiles no longer recolor per byte: their descriptor
attribute is resolved at scenario/palette transition time. This requires no
second 11,840-byte table and uses no VID1/VID2 memory on the 64K target. The
separately loaded, one-time title screen still uses its transitional
compatibility shadow.

### TVC interrupt stack isolation

The Spectrum program originally starts with `SP=5E39H`, immediately above its
`5B00H-5E25H` workspace. That is sufficient for the short Spectrum IM 1 path,
but the inherited TVC firmware interrupt handler saves more state and follows
deeper call chains. With the game stack in its original location, observed
interrupts descended to approximately `5DE7H` and overwrote live game state.
For example, corruption of the coordinate word at `5DEBH` eventually made the
large-character renderer treat `44H,F8H` as a screen row and column. Its shadow
write then landed in `2000H-2FFFH` and modified the renderer itself, producing
timing-dependent garbage on the store screen. The interrupt mapper was restored
correctly; the failure was stack overlap.

The TVC entry now starts the stack at `4000H`, growing downward in U0, and the
original post-multiload `LD SP,5E39H` at `B1E8H` is patched to the same value.
The second assignment is essential: without it, loading the selected scenario
silently restored the unsafe Spectrum stack even though the TVC entry had used
U0. U0 stays mapped in page 0 in both the game mapping and the firmware
interrupt mapping, and the stack remains clear of the support image and its
`3000H-302DH` scratch area. Replays of the pre-store snapshot with the active
stack relocated there ran one million instructions and produced a coherent
store screen without the self-corruption.

## Remaining Coverage and Fidelity Work

These are not known blockers for the confirmed playable path. They record
branches or fidelity work that have not been exhaustively validated:

- Exercise every scenario and expansion branch. In particular, trace the later
  repeated `68H` requests so TAP blocks 10-12 are selected in their original
  sequence; the first `68H` request currently uses block 9.
- Port `B15CH` save/verify modes 0 and 2 used by saved-game handling.
- Investigate TVC cassette copy-protection behavior: a normal `SAVE` program
  file has a 16-byte internal header, but multiload machine-code blocks may use
  lower-level ROM cassette block reads or non-standard block metadata.
- Convert the original title attribute writes, currently rendered with fixed
  palette indices 0 and 1, to their faithful TVC GRAPHICS 4 colors.
- Treat the older snapshot bridge and its `02ABH` no-key ROM stub as a
  historical inspection experiment; the active disk port translates the real
  numeric and gameplay input paths.
- Continue translating later direct Spectrum bitmap and attribute writes into
  the established TVC GRAPHICS 4 layout.
- Handle Spectrum ULA `OUT (FEH),A` side effects deliberately instead of
  allowing accidental TVC port writes.
- Continue auditing less-used interrupt-sensitive branches even though the
  firmware stack is now isolated from the Spectrum workspace.

### Aiming pixel coordinate correction

The original `844CH` plotter reads `5DA3H` as Y and `5DA4H` as X,
then adds the `0808H` screen inset. The native replacement had reversed
these axes, so aiming P/O moved vertically and Q/A horizontally. It now
retains the original coordinate contract, including the X-based collision
mask. The native mask loop performs X modulo 4 plus one rotations; its
seed is now `11H`, producing `88H,44H,22H,11H` in left-to-right order.
The previous `88H` seed shifted each pixel one place and wrapped within
each byte. These four opcode-byte changes preserve all routine addresses.

The supplied `rtvc/snapshots/lsqd-aim.rtvcsnap.zip` was used for 21
controlled calls of the rebuilt resident plotter: X=24..35 at Y=43 and
Y=40..48 at X=31. Every resulting coordinate, native address, native plane
mask, and Spectrum collision mask matched its independent expected value.
This checks the translated plotter; full interactive key replay remains a
manual regression check.

### Aiming and shooting collision audit

The common plotter is part of hit detection, not just presentation:

- `8B7AH` draws the aiming cross from the original 21 coordinate pairs at
  `8B50H`, in XOR mode. It does not change `5DA5H`.
- `8974H` adds the new projectile position to the trail ring, plots it in
  set mode, then clears the oldest position. The clear must retain the new
  position's collision result.
- `89B1H` advances the original trajectory and tests `5DA5H` after `8974H`;
  a nonzero value terminates the trajectory through `8A20H`.
- `90E4H` reads that same result after the trajectory returns. Zero returns
  without hit handling; nonzero proceeds to the original weapon-dependent
  impact code, including terrain and unit handling (`9175H`).

For mode 0 the original collision value is the selected Spectrum bit mask
AND the pre-write bitmap byte. The native plotter reconstructs that logical
bit by comparing the existing pixel slot with the cell's mapped ink, then
returns the original `80H >> (X & 7)` mask or zero in `5DA5H`. The write
helper leaves B intact until that result is stored. Modes 1 and 2 retain
`5DA5H`; no audited direct caller consumes the plotter's A/flags, native HL,
or clobbered DE/C as a collision result. The native byte in A is not a
byte-for-byte Spectrum register return, but these callers do not need it.

Controlled execution in the supplied aiming snapshot passed 384 combinations
of eight representative attributes, eight pixel offsets, empty/occupied
pixels, and set/clear/XOR modes. Checks covered the output byte, unchanged
neighbour pixels, collision byte, and restored `B0H` mapping. Attributes
included inverse `70H` and mapped-color collision fallback `4DH`.
The original `8974H` routine passed both empty and occupied new-pixel cases
with an occupied old trail pixel: erasing the old pixel retained the correct
new collision. The original `8B7AH` output matched its 21 coordinate pairs
on a mixed background; a second call restored all 12,288 visible video bytes
and left the collision byte untouched.

The live `E65FH` descriptor attributes in this snapshot were
`04,05,06,07,41,42,43,44,45,46,47,4D,56`. All retain distinguishable ink and
paper under the tactical palette and its equal-slot fallback. This matters
because native-only collision recovery relies on that distinction. This
audit validates the drawing/collision boundary and projectile-trail caller;
it is not an exhaustive playthrough of every weapon, scenario, or damage
branch. No further functional change was required by these checks.
