# TVC Software Environment

This document records TVC behavior visible to ported software: ROM and
operating-system services, loader conventions, calling patterns, and reusable
translation techniques. For hardware registers, timing, paging, video, and
interrupt behavior, use the current
[TVC hardware reference](https://github.com/teki/rtvc/blob/HEAD/info/tvc.md).

## ROM and VT-DOS File I/O

The following behavior was verified while building the Laser Squad disk
loader and should be rechecked when another TVC ROM/DOS version matters:

- VT-DOS presents disk files through the cassette-style ROM I/O interface.
- A CAS stored on DSK retains its 144-byte outer CAS container.
- Opening it through the disk driver exposes the internal 16-byte application
  header first, followed by the application payload.
- The device/function byte at `1705H` uses the high nibble for the device and
  the low nibble for the operation. Verified disk input used `D0H`; disk output
  used `50H`.
- Porting code must set the complete device/function state deliberately rather
  than inherit cassette input state.

Relevant extension-ROM entry points identified in the current TVC 1.2 work:

| Address | Name | Purpose |
| --- | --- | --- |
| `F405H` | `CAS_OPEN_READ` | Open a cassette-style file for reading |
| `F630H` | `CAS_BKIN` | Read a block |
| `F653H` | `CAS_CHOUT` | Write one character |
| `F6ADH` | `CAS_BKOUT` | Write a block |

The exact register contracts and ROM-version applicability still need a
dedicated software API pass before this becomes a complete reference.

The
[Laser Squad disk-loader investigation](../ports/laser-squad/notes.md#tvc-disk-loader-draft)
contains the originating ROM trace, container/header distinction, and
end-to-end load evidence.

## Disk Transfer and Paging

The TVC 1.2 ROM/VT-DOS block-input path can write directly into U3 at
`C000H`. Before issuing the device call, select U3 in page 3 and update the
firmware paging shadow at `0003H`. The device call returns with that requested
U3 mapping still selected.

This was verified with
[tvc-disk-u3-read-probe.asm](tvc-disk-u3-read-probe.asm): a 32-byte block read
returned status `00H`, the paging shadow after the call was `B0H`, close
returned `00H`, and raw U3 at `C000H` matched the source byte-for-byte. The
result applies to the tested TVC 1.2 and VT-DOS configuration; recheck other
ROM or disk-driver versions.

The
[Laser Squad multi-load implementation](../ports/laser-squad/notes.md#runtime-multi-load-transport)
uses this direct path to load each original payload across U2 and U3 from one
CAS file.

## Interrupt Integration

Calling inherited firmware interrupt handling from a port can consume
substantially more stack than the source game expected. One verified failure
placed the game stack close enough to live data that the firmware handler
overwrote it and produced timing-dependent drawing corruption.

A compatibility interrupt path should:

- reserve a dedicated safe interrupt stack when necessary;
- save and restore the interrupted stack;
- preserve the mapper state expected by the game;
- acknowledge the TVC interrupt correctly; and
- document which firmware services it retains.

The originating
[Laser Squad stack-isolation evidence](../ports/laser-squad/notes.md#tvc-interrupt-stack-isolation)
also shows why all later source-side `SP` assignments must be audited after
choosing a safe target stack.

## Reusable Disk-write Probe

[tvc-disk-write-probe.asm](tvc-disk-write-probe.asm) creates `PROBE.CAS`
through the ROM/VT-DOS write interface. It was originally an experiment, but
is retained here because it demonstrates and tests the software contract
described above.

Build and run instructions are kept in the source comments. Treat the observed
output format as evidence for a specific ROM/VT-DOS configuration, not as a
replacement for the hardware reference.

## Direct U3 Disk-read Probe

[tvc-disk-u3-read-probe.asm](tvc-disk-u3-read-probe.asm) tests whether the
normal ROM/VT-DOS block-input path can write directly to U3 at `C000H`. It
reopens its own CAS as known input, guards the physical U3 destination,
requests the direct read, remaps U3, and compares the result.

The TVC 1.2 + VT-DOS emulator run returned result `01H`: direct input
succeeded, the mapper shadow remained `B0H`, and all 32 target bytes matched.
Build, run, result-address, and border-pattern instructions are kept in the
source comments.
