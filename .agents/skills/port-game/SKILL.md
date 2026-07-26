---
name: port-game
description: Port, adapt, reverse engineer, document, build, or validate games for the TVC from Spectrum, CPC, or other source machines.
---

# Port a Game to TVC

Use this skill for work on a game port or reusable porting knowledge.

## Non-negotiable Rule

This is a port, not a reimplementation.

- Preserve original control flow, algorithms, scripts, fonts, graphics, tables,
  and data wherever practical.
- Translate hardware-specific routines to TVC equivalents.
- Do not replace a custom renderer, loader, input system, or game subsystem
  merely because another implementation is easier.
- Isolate and label temporary experiments.
- Ask for approval before intentionally approximating, redesigning, or
  replacing original behavior.

## Required Context

1. Read [knowledge/README.md](../../../knowledge/README.md).
2. Read [knowledge/porting.md](../../../knowledge/porting.md) and
   [knowledge/tooling.md](../../../knowledge/tooling.md).
3. Read the applicable source-platform document, such as
   [knowledge/zx-spectrum.md](../../../knowledge/zx-spectrum.md).
4. Read [knowledge/tvc.md](../../../knowledge/tvc.md) for the target software
   environment.
5. Read the port's local instructions, notes, active plan, and validation
   record.

Follow links into the pinned `rtvc` documentation only when exact hardware,
emulator, debugger, or media-format behavior is needed.

## Workflow

1. Identify the exact source artifact, acquisition URL or placement
   instructions, and SHA-256.
2. Inventory the existing port, disassembly, control files, experiments, and
   generated outputs.
3. Build a port map covering entry points, memory, interrupts, keyboard,
   graphics, sound, loaders, self-modifying code, ROM calls, and data tables.
4. Mark routines as preserve, hardware-translate, or remove only after their
   original purpose is understood.
5. Make narrow changes and compare inputs, outputs, memory effects, timing, and
   visible results against the original.
6. Keep preparation and final assembly reproducible from verified source media
   plus tracked sources and patches.
7. Run the port's `verify.py` after functional or build changes and record
   focused manual scenarios in `validation.md`.

## Knowledge Routing

- Hardware fact: update the appropriate `rtvc/info/` machine reference.
- Emulator or tool behavior: update `rtvc` documentation.
- ROM, OS, loader, calling convention, or reusable translation technique:
  update `knowledge/` here.
- Game address, experiment, patch, or decision: update the port's `notes.md`.

Promote a finding only when it is verified and independent of one game's
addresses or data layout. Link the shared summary back to the originating port
for evidence.

For a new port, treat `knowledge/` as the discovery surface for earlier
learnings. Do not rely on agents reading every previous port's `notes.md`, and
do not copy whole investigations into the knowledge base. Promote the reusable
rule once, retain the detailed evidence in the originating port, and follow
its backlink only when the underlying diagnosis or implementation matters.
