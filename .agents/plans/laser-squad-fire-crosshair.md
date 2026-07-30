# Laser Squad Fire Crosshair

## Scope

Restore the dynamic firing crosshair without changing the original targeting
logic, cross shape, or Spectrum shadow-screen behavior.

## Finding

The cross is toggled by the original routine at `8B7AH`. It XORs 21 individual
pixels through `8444H`: the center pixel and offsets 1-5 in all four cardinal
directions. These direct Spectrum bitmap writes bypass the TVC glyph
translation hooks, so the canonical shadow changes while VID0 remains stale.

## Implementation

- Redirect the four calls to `8B7AH` through a page-0 compatibility wrapper.
- Let the original `8B7AH` routine perform the unchanged XOR drawing.
- Redraw only the Spectrum character cells intersected by the 11x11 cross.
- Preserve the original routine's returned registers and flags.

## Validation

- Run the clean Laser Squad verifier.
- Load `lsql-fire.rtvcsnap.zip` and confirm that moving/toggling the firing
  cursor displays the cross while retaining the existing circles and map.
