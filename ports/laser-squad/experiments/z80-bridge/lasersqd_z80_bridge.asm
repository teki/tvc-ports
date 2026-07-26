; Experimental Spectrum .z80-to-TVC bridge used during Laser Squad bring-up.
;
; Load decoded snapshot RAM with:
;   python3 z80_to_toml.py /path/to/reference.z80 -o /tmp/reference.z80.toml
;   rtvc debugger: loadz80toml /tmp/reference.z80.toml
;
; Then assemble this file to U0, map U0/VID0/U2/U3, set PC=0000H, and step/run.
; Constants below were copied from the snapshot used during the experiment.

        ORG 0000H

BOOT:
        DI
        LD SP,TEMP_STACK

        ; Make the TVC roughly resemble the Spectrum address layout:
        ;   0000-3FFF U0 shim RAM
        ;   4000-7FFF VID0, displayed and CPU-visible
        ;   8000-BFFF U2
        ;   C000-FFFF U3
        XOR A
        OUT (0CH),A
        OUT (06H),A
        LD A,0B4H
        OUT (02H),A

        ; Spectrum-width CRTC setup: keep the normal TVC 64 us line period,
        ; but display 32 bytes per row so the visible bitmap is 256 pixels wide.
        ; This is not a Spectrum-perfect raster model.
        CALL INIT_CRTC

        ; Two-color palette: palette 0 black-ish, palette 1 bright white.
        XOR A
        OUT (60H),A
        LD A,55H
        OUT (61H),A
        XOR A
        OUT (00H),A

        IM 1
        LD A,3FH
        LD I,A
        LD A,4CH
        LD R,A

        ; Restore alternate registers first.
        LD BC,1621H
        LD DE,369BH
        LD HL,2758H
        EXX
        LD HL,0145H
        PUSH HL
        POP AF
        EX AF,AF'

        ; Restore main registers from the snapshot.
        LD IX,0000H
        LD IY,5C3AH
        LD BC,7FFEH
        LD DE,0FFFFH
        LD HL,0B128H
        LD HL,0054H
        PUSH HL
        POP AF

        ; Snapshot IFF1/IFF2 were both false, so stay DI.
        ; U0 remains mapped in page 0 while the TVC interrupt handler runs.
        ; Its deeper stack must not descend through the Spectrum workspace.
        LD SP,4000H
        JP SNAPSHOT_PC

INIT_CRTC:
        LD HL,CRTC_TABLE
        LD B,16
CRTC_LOOP:
        LD A,(HL)
        OUT (70H),A
        INC HL
        LD A,(HL)
        OUT (71H),A
        INC HL
        DJNZ CRTC_LOOP
        RET

        ORG 0038H
IM1_HANDLER:
        ; Spectrum IM1 enters 0038H. TVC's shared interrupt is acknowledged
        ; with port 07H; then return to the interrupted game code.
        PUSH AF
        LD A,0FFH
        OUT (07H),A
        POP AF
        EI
        RETI

        ORG 0066H
NMI_HANDLER:
        RETN

        ORG 0100H
TEMP_STACK:
        DS 32,0
TEMP_STACK_TOP:

CRTC_TABLE:
        ; R0 keeps 100 character clocks per line. R1 displays 32 bytes, matching
        ; a Spectrum bitmap row. R14/R15 point at 32*60-1 for the cursor IRQ.
        DB 0,99
        DB 1,32
        DB 2,43
        DB 3,32H
        DB 4,77
        DB 5,2
        DB 6,60
        DB 7,66
        DB 8,0
        DB 9,3
        DB 10,3
        DB 11,3
        DB 12,0
        DB 13,0
        DB 14,07H
        DB 15,7FH

        ORG 0200H
ROM_STUB_RET:
        RET

        ; The reference snapshot resumes inside the Spectrum ROM keyboard scan.
        ; For now report "no key" and return to the saved caller on the
        ; snapshot stack. Replace this with a Spectrum-style TVC keyboard shim
        ; once the game reaches stable polling.
        ORG 02ABH
SNAPSHOT_PC:
        LD HL,0FFFFH
        LD DE,0FFFFH
        XOR A
        RET
