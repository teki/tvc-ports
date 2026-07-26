# Porting Knowledge Base

This is a software-facing reference for understanding and translating games.
It complements, but does not replace, the `rtvc` hardware and emulator
documentation.

## Index

- [Common porting workflow](porting.md)
- [TVC software environment](tvc.md)
- [ZX Spectrum software and translation notes](zx-spectrum.md)
- [ZX Spectrum 48K ROM disassembly](48.rom.asm)
  ([provenance and verification notes](48.rom.asm.md))
- [Amstrad CPC software and translation notes](amstrad-cpc.md)
- [`rtvc` and external tooling](tooling.md)

## Ownership Boundary

| Subject | Authoritative home |
| --- | --- |
| Hardware ports, timing, interrupts, memory mapping, and video behavior | `rtvc/info/tvc.md` or `rtvc/info/zx82.md` |
| Emulator behavior, debugger, media formats, and tool commands | `rtvc/info/rtvc.md` and tool documentation |
| ROM routines, BASIC/DOS APIs, loaders, calling conventions, and annotated software disassemblies | This knowledge base |
| One game's addresses, experiments, patches, and decisions | That port's `notes.md` |

The current companion references are
[TVC hardware](https://github.com/teki/rtvc/blob/HEAD/info/tvc.md),
[Spectrum 48K hardware](https://github.com/teki/rtvc/blob/HEAD/info/zx82.md),
and the
[`rtvc` implementation reference](https://github.com/teki/rtvc/blob/HEAD/info/rtvc.md).

## Promotion Rule

Use **observed**, **verified**, and **generalized** where confidence matters.
Keep experiments and game-specific facts in the port. Once a result is
verified and independent of game addresses, summarize it in the relevant
knowledge document and link back to the evidence.

If a port exposes a new hardware fact, correct `rtvc` first and record only
the software consequence here. If it exposes a ROM or operating-system fact,
record it here and update `rtvc` only when the emulator relies on it.
