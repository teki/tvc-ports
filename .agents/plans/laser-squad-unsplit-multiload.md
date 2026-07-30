# Laser Squad Unsplit Multi-load

## Scope

Replace the four transport files currently generated for each Laser Squad
runtime payload with one CAS containing the unchanged original `49DFH` bytes.

## Implementation

1. Preserve the original `64H`, `65H`, `66H`, and `68H` selection logic.
2. Map U2 and U3 together and call the existing page-0 `LOAD_BLOCK` once with
   destination `B621H` and size `49DFH`.
3. Package one `L64.CAS`, `L65.CAS`, `L66.CAS`, and `L68.CAS`.
4. Make verification compare each complete CAS payload directly with its TAP
   block and require the new seven-file DSK directory.
5. Update the port documentation and validation record.

## Validation

- Run `python3 verify.py`.
- Exercise runtime ID `64H` in `rtvc`.
- Compare mapped `B621H-FFFFH` byte-for-byte with TAP block 6.
