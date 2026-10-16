# Implementation Plans

This directory contains detailed, actionable plans for repository-wide work
and individual ports.

## Conventions

- Use a short kebab-case filename.
- Include the port name when a plan belongs to one port.
- Record scope, decisions, integration points, implementation order,
  limitations, and focused validation.
- When implementation begins, create a sibling `<plan-name>-progress.md`.
- Keep progress files concise: current status, completed work, discoveries,
  validation already run, and next concrete steps.
- Update durable behavior in the knowledge base or port documentation instead
  of leaving it only in a progress file.

## Current Plans

- [Laser Squad beeper audio](laser-squad-beeper-audio.md): translate the
  three Spectrum beeper routines to the TVC sound DAC.
- [Laser Squad drawing speed](laser-squad-draw-speed.md): bring the slow
  drawing paths closer to Spectrum speed with identical output.
- [Laser Squad CPC graphics](laser-squad-cpc-graphics.md): use the Amstrad
  CPC map tiles and per-scenario palettes (in progress).
