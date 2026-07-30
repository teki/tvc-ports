# TVC Direct U3 Disk-read Probe

## Scope

Create a standalone TVC 64K+ test application that determines whether the
normal ROM/VT-DOS block-input path can write directly to U3 at `C000H`.

## Method

1. Reopen the probe's own normal `U3PROBE.CAS` file as known input.
2. Consume its application header and BASIC prefix so the next bytes are the
   resident machine-code entry at `1A30H`.
3. Fill the U3 destination with a different guard byte, map U3 into page 3,
   and request a block read directly to `C000H`.
4. Close the file, explicitly remap U3, and compare the destination with the
   known payload.
5. Publish a fixed-address result record and an unmistakable border pattern.

## Safety and Limitations

- Test only `C000H`, where the HBF window contains ROM while EXT is mapped.
  Avoid `D000H`, because it is HBF private RAM and a failed direct transfer
  could corrupt live disk-driver state.
- The disk need not be writable; the probe performs input operations only.
- The result applies to the tested TVC ROM, VT-DOS ROM, and calling path.

## Validation

- Assemble the source as CAS.
- Place it on a disposable 720 KiB DSK and boot it under TVC 1.2 + VT-DOS.
- Inspect the result record and U3 bytes in the debugger.
