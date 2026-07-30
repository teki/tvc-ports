# Laser Squad Palette Profiles

## Scope

Parameterize the main-game GRAPHICS 4 palette. Use bright cyan for palette
entry 1 through the control-selection screen, then bright green for subsequent
screens. Leave the separate title-stage palette unchanged.

## Implementation

1. Store each main-game palette as a four-byte profile for ports `60H-63H`.
2. Make the shared clear routine apply the selected profile.
3. Patch `B0ADH` to select the cyan control-screen profile before clearing.
4. Patch `B0C3H` to preserve and store the selected method, then select the
   green normal-game profile without changing the current visible screen.
5. Give each palette profile its own eight-entry Spectrum-ink mapping.
6. Add a team/armour profile with black, green, cyan, and yellow; map white to
   cyan as explicitly approved.
7. Patch the traced `9D55H` team-setup clear to select that profile.
8. Map both Spectrum ink and paper through the profile and compose both into
   each GRAPHICS 4 output nibble, preserving reverse-video attributes.
9. Patch the direct selection-highlight attribute store at `693FH-6942H` so
   each changed shadow attribute also redraws its TVC cell.
10. Resolve non-black ink/paper slot collisions with black ink so compressed
    source colors remain legible.
11. Update comments and documentation.
12. Rebuild and run `verify.py`, updating expected CAS hashes and sizes.

## Validation

- Confirm the assembled profiles contain `00H,51H,54H,44H` and
  `00H,50H,54H,44H`, plus team profile `00H,50H,51H,54H`.
- Confirm `B0ADH` selects profile 0 before the control-screen clear.
- Confirm `B0C3H` stores the method, preserves `A`, and selects profile 1
  without directly writing the palette ports.
- Confirm `9D55H` selects profile 2 before clearing.
- Confirm profile 2 maps green, cyan, and yellow to distinct slots and white
  to cyan.
- Confirm `70H` selects black ink and yellow paper and the nibble encoder uses
  both slots.
- Confirm the `693FH` compatibility call preserves the original attribute
  transformation and redraws the addressed cell before incrementing `HL`.
- Confirm cyan ink on blue paper maps to black ink on cyan paper, while cyan
  ink on black paper remains cyan.
- Run the clean Laser Squad verifier.
