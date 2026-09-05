# Laser Squad Phase-specific TVC Palettes

## Scope

Improve the TVC GRAPHICS 4 presentation of the supplied Spectrum screens by
adding dedicated hidden-movement, tactical-map, and firing palettes. Preserve
the original renderers, attributes, graphics, and control flow.

## Decisions

- Keep the existing control, general-information, team-setup, and deployment
  profiles unchanged.
- Add hidden movement as black/cyan/yellow/magenta.
- Add tactical gameplay as black/yellow/green/cyan; visual testing preferred
  the earlier yellow fallback to dim white.
- Add firing as black/dim-white/yellow/cyan.
- Use the original screen boundaries at `B1F7H`, `8495H`, and `85C3H` to select
  and restore palettes rather than inferring presentation state while drawing.
- Retain explicit visible fallbacks for every Spectrum ink.

## Integration Points

- Extend `TVC_PALETTES` and `TVC_INK_PALETTE_MAPS` in
  `ports/laser-squad/src/lasersqd_loader.asm`.
- Patch the hidden-movement clear at `B1F7H`, restore tactical colors after its
  return at `5E95H`, select firing colors at `8497H`, and restore tactical
  colors at `85C3H`.
- Export the new support routines through `build.py`.
- Record the game-specific palette choices in `notes.md` and focused manual
  checks in `validation.md`.

## Validation

1. Run `python3 verify.py` for a clean assembly/media build.
2. Confirm movement uses cyan/yellow/magenta, tactical maps use neutral walls
   with green and cyan distinctions, and firing uses neutral walls with yellow
   trajectory markers and a cyan crosshair.
3. Confirm firing and movement both restore the tactical palette on exit.
