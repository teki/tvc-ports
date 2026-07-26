# Amstrad CPC Software and Translation Notes

This is an indexed placeholder for verified CPC-to-TVC porting knowledge. Do
not fill it with generic hardware-manual material or assumptions copied from
Spectrum work.

Add sections when a real CPC port establishes them:

- supported source model and firmware/ROM version;
- firmware entry points and calling conventions;
- keyboard and joystick paths;
- display modes, memory layout, palette, and CRTC-visible assumptions;
- interrupts and timing;
- sound;
- AMSDOS, cassette, and disk loaders;
- common game code patterns; and
- tested TVC translation strategies.

Exact CPC hardware facts should live in an emulator-oriented hardware
reference if and when `rtvc` implements that machine. This file should retain
the software and porting consequences.
