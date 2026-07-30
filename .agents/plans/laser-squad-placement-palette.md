# Laser Squad Placement Palette

## Scope

Give the deployment phase a dedicated GRAPHICS 4 palette that preserves the
blue-versus-red team distinction. Restore the existing black/green/cyan/yellow
profile before normal gameplay.

## Implementation

1. Add profile 3: black, bright green, bright blue, and bright red.
2. Map Spectrum blue/cyan to bright blue and red/yellow to bright red.
3. Map Spectrum green exactly and white to a visible green fallback.
4. Patch the common placement clear at `A370H` to select profile 3.
5. Patch the gameplay entry at `5E92H` to restore profile 2 before the
   existing `B1F7H` clear.
6. Document the intentional color compression and focused visual checks.
7. Rebuild and run `verify.py`, updating expected CAS hashes and sizes.

## Validation

- Confirm profile 3 is `00H,50H,41H,44H`.
- Confirm its map is `00H,02H,03H,03H,01H,02H,03H,01H`.
- Confirm `A370H` selects profile 3 before calling the original clear.
- Confirm `5E92H` selects profile 2 before entering the original gameplay
  clear.
- Confirm placement shows black `D` glyphs on true blue and red fields,
  deployed cyan soldiers as blue, and deployed yellow soldiers as red.
- Confirm normal gameplay returns to black/green/cyan/yellow.
- Run the clean Laser Squad verifier.
