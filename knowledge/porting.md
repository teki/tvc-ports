# Common Porting Workflow

## Preserve Before Translating

A port should retain the original program's structure and behavior. Begin by
identifying what each routine does, then classify it:

- **preserve**: machine-independent game logic, data, tables, scripts, and
  algorithms;
- **translate**: hardware, ROM, loader, input, graphics, sound, and timing
  dependencies;
- **remove**: only code whose original purpose is understood and is genuinely
  obsolete on the target.

Do not substitute new assets, simplified behavior, ROM text output, or a new
subsystem merely because translation is difficult.

## Start with Reproducible Inputs

Record every original filename, size, SHA-256, source description, and required
tool version. Preparation must fail when the supplied artifact does not match.
Track control files and authored patches; regenerate intermediate binaries and
media descriptions.

For media that cannot be redistributed, track its authoritative download URL,
archive member, checksums, and fallback placement instructions without
committing the original. Cache downloads locally and fail before extraction
when either the archive or selected member has the wrong hash.

When a port modifies an original binary payload, derive it from the verified
source during every build and apply tracked, narrow patches. For split
transport files, verify that the pieces reconstruct the original payload
byte-for-byte before relying on container-level checks. The
[Laser Squad loading path](../ports/laser-squad/notes.md#current-loading-path)
is the originating example.

## Build the Port Map

Before broad changes, record:

- load stages, entry points, stack, and memory ownership;
- interrupt mode, handlers, timing assumptions, and interrupt stack use;
- keyboard scans and ROM input calls;
- screen, attribute, palette, border, and sound access;
- memory paging and bank assumptions;
- tape/disk loaders and data-selection logic;
- self-modifying code and writable code regions; and
- data tables, scripts, fonts, graphics, and save/write behavior.

Mark observations separately from verified conclusions.

## Translate Narrowly

Preserve the interface expected by the original code where practical. A small
compatibility routine often limits disruption better than rewriting every
caller. Restore mapper, interrupt, stack, and register state explicitly at
translation boundaries.

Keep unique per-game transformations visible in the port's build script.
Promote only stable mechanical operations into shared tools.

## Validate Continuously

Compare the source and target at meaningful boundaries:

- routine inputs and outputs;
- memory and port writes;
- mapper and interrupt state;
- visible frames and palette choices;
- input behavior;
- load-stage transitions; and
- game decisions or data selection.

The goal is behavioral equivalence, not merely continued execution.

Use `verify.py` after functional and build changes for an unattended clean
rebuild and media checks. Keep a short manual or automated emulator scenario
in `validation.md` for visible and interactive behavior.

Container filenames and sizes are useful smoke checks, but they do not prove
that transported game data is correct. Compare transformed payloads with
known hashes and compare unmodified payloads directly with their verified
source ranges.

## Record and Promote Learnings

Game addresses and unfinished experiments stay in the port's `notes.md`.
Verified ROM, OS, loader, or reusable translation findings move into the
relevant platform document, with a link back to their evidence.

The shared knowledge base is the index for future ports. It should contain the
short actionable rule; the originating port should retain addresses, traces,
screenshots, false leads, and the exact patch.
