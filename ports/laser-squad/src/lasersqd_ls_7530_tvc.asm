; Hardware-specific overlays for the original Laser Squad LS block.
;
; The build starts with the pristine 7530H-7BADH Spectrum block, then applies
; these patches and appends the TVC routines at 7BAEH. The original title
; interpreter, script, font, tables, and self-modifying state remain in place.

        ORG 7530H
        JP TVC_LS_ENTRY

        ORG 763FH
        JP TVC_DRAW_LARGE

        ORG 769FH
        JP TVC_DRAW_NORMAL

        ORG 785EH
        JP TVC_CLEAR_SCREEN

        ORG 7874H
        JP TVC_WAIT_ANY_KEY

        ORG 7BAEH

TVC_LS_ENTRY:
        DI
        LD A,(0003H)
        LD (TVC_OLD_MAPPER),A
        AND 0DFH               ; map selected video RAM into page 2
        LD (0003H),A
        OUT (02H),A
        CALL TVC_CLEAR_SCREEN
        LD A,(0B12H)
        AND 0EFH               ; stop the oscillator gating port 06H amplitude
        LD (0B12H),A
        OUT (05H),A            ; so later speaker writes drive the DAC directly
        XOR A
        OUT (00H),A            ; black border
        LD A,01H
        CALL 7623H             ; original title interpreter
        CALL TVC_LOADING_DELAY ; requested half-second loading presentation
        LD A,(TVC_OLD_MAPPER)
        LD (0003H),A
        OUT (02H),A
        EI
        RET

; Hold the completed loading screen for approximately two seconds. Each pass
; takes about 4,050 Z80 cycles, or 20 PAL raster lines, and alternates the
; bright cyan/red TVC border colors used by classic tape-loading displays.
TVC_LOADING_DELAY:
        LD DE,0606H             ; 1542 passes, approximately 2 seconds total
TVC_LOADING_DELAY_STRIPE:
        LD A,E
        AND 01H
        JR Z,TVC_LOADING_BORDER_CYAN
        LD A,88H               ; bright red border: IxGxRxB
        JR TVC_LOADING_BORDER_WRITE
TVC_LOADING_BORDER_CYAN:
        LD A,0A2H              ; bright cyan border: IxGxRxB
TVC_LOADING_BORDER_WRITE:
        OUT (00H),A
        PUSH BC
        LD BC,0098H             ; approximately 20 raster lines per color
TVC_LOADING_DELAY_INNER:
        DEC BC
        LD A,B
        OR C
        JR NZ,TVC_LOADING_DELAY_INNER
        POP BC
        DEC DE
        LD A,D
        OR E
        JR NZ,TVC_LOADING_DELAY_STRIPE
        XOR A
        OUT (00H),A
        RET

TVC_CLEAR_SCREEN:
        LD HL,5AFFH
        LD DE,5AFEH
        LD BC,02FFH
        LD (HL),00H
        LDDR
        DEC HL
        DEC DE
        LD (HL),C
        LD BC,17FFH
        LDDR                    ; preserve the original Spectrum shadow clear
        LD A,(0B13H)
        AND 0FCH
        OR 01H
        LD (0B13H),A
        OUT (06H),A            ; GRAPHICS 4, preserve sound/control bits
        XOR A
        OUT (0CH),A            ; page 2 and display both select VID0
        LD HL,8000H
        LD DE,8001H
        LD BC,2FFFH
        LD (HL),00H
        LDIR                   ; VID0 is already mapped throughout the title
        XOR A
        OUT (60H),A            ; palette 0: black
        LD A,50H
        OUT (61H),A            ; palette 1: bright green
        LD A,44H
        OUT (62H),A            ; palette 2: bright red
        LD A,55H
        OUT (63H),A            ; palette 3: bright white
        XOR A                  ; original 785EH returned A=0
        RET

; Original 769FH behavior: write the glyph and attribute to the Spectrum
; shadow, then redraw that cell into VID0.
TVC_DRAW_NORMAL:
        PUSH HL
        PUSH DE
        PUSH BC
        LD C,A
        LD B,00H
        LD HL,77ADH
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        EX DE,HL               ; DE = original font rows
        PUSH DE
        LD HL,(763AH)
        LD A,L
        LD C,H
        CALL TVC_SHADOW_DEST
        POP DE
        PUSH HL
        CALL TVC_COPY_8_SHADOW
        POP HL
        CALL TVC_BITMAP_TO_ATTRIBUTE
        LD A,(763DH)
        LD (HL),A
        LD HL,(763AH)
        LD A,L
        LD C,H
        CALL TVC_REDRAW_CELL
        POP BC
        LD B,00H
        POP DE
        POP HL
        RET

; Original 763FH behavior: write two vertically doubled shadow cells and their
; two attributes, then redraw both cells into VID0.
TVC_DRAW_LARGE:
        PUSH HL
        PUSH DE
        PUSH BC
        PUSH AF
        LD C,A
        LD B,00H
        LD HL,77ADH
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        ADD HL,BC
        EX DE,HL
        PUSH DE
        LD HL,(763AH)
        LD A,L
        LD C,H
        CALL TVC_SHADOW_DEST
        POP DE
        CALL TVC_COPY_4_DOUBLED_SHADOW
        PUSH DE
        LD HL,(763AH)
        LD A,L
        INC A
        LD C,H
        CALL TVC_SHADOW_DEST
        POP DE
        CALL TVC_COPY_4_DOUBLED_SHADOW

        LD HL,(763AH)
        LD A,L
        LD C,H
        CALL TVC_SHADOW_DEST
        CALL TVC_BITMAP_TO_ATTRIBUTE
        LD A,(763DH)
        LD (HL),A
        LD HL,(763AH)
        LD A,L
        INC A
        LD C,H
        CALL TVC_SHADOW_DEST
        CALL TVC_BITMAP_TO_ATTRIBUTE
        LD A,(763EH)
        LD (HL),A

        LD HL,(763AH)
        LD A,L
        LD C,H
        CALL TVC_REDRAW_CELL
        LD HL,(763AH)
        LD A,L
        INC A
        LD C,H
        CALL TVC_REDRAW_CELL
        POP AF
        POP BC
        POP DE
        POP HL
        RET

; Input A = Spectrum character row, C = byte column. Output HL = the first
; bitmap raster in the original 4000H-57FFH shadow.
TVC_SHADOW_DEST:
        LD E,A
        LD D,00H
        LD HL,787DH
        ADD HL,DE
        ADD HL,DE
        LD E,(HL)
        INC HL
        LD D,(HL)
        LD L,C
        LD H,00H
        ADD HL,DE
        RET

TVC_COPY_8_SHADOW:
        LD B,08H
TVC_COPY_8_SHADOW_ROW:
        LD A,(DE)
        LD (HL),A
        INC DE
        INC H
        DJNZ TVC_COPY_8_SHADOW_ROW
        RET

TVC_COPY_4_DOUBLED_SHADOW:
        LD B,04H
TVC_COPY_4_DOUBLED_ROW:
        LD A,(DE)
        LD (HL),A
        INC H
        LD (HL),A
        INC H
        INC DE
        DJNZ TVC_COPY_4_DOUBLED_ROW
        RET

TVC_BITMAP_TO_ATTRIBUTE:
        LD A,H
        ADD A,07H
        RRCA
        RRCA
        RRCA
        AND 03H
        OR 58H
        LD H,A
        RET

; Input A = row, C = column. Render one cell from the canonical Spectrum
; bitmap and attribute shadows while VID0 remains mapped in page 2.
TVC_REDRAW_CELL:
        LD (3104H),A
        LD A,C
        LD (3105H),A
        LD A,(3104H)
        CALL TVC_SHADOW_DEST
        LD (3102H),HL
        PUSH HL
        CALL TVC_BITMAP_TO_ATTRIBUTE
        LD A,(HL)
        CALL TVC_SELECT_INK
        POP HL
        LD A,(3105H)
        ADD A,A
        LD E,A
        LD A,(3104H)
        ADD A,A
        ADD A,80H
        LD D,A
        LD B,08H
TVC_REDRAW_ROW:
        LD A,(HL)
        PUSH BC
        PUSH HL
        CALL TVC_PACK_ROW
        LD A,B
        LD (DE),A
        INC DE
        LD A,C
        LD (DE),A
        DEC DE
        POP HL
        POP BC
        LD A,E
        ADD A,40H
        LD E,A
        JR NC,TVC_REDRAW_NEXT
        INC D
TVC_REDRAW_NEXT:
        INC H
        DJNZ TVC_REDRAW_ROW
        RET

; Input A = Spectrum attribute. Store the corresponding title palette index.
TVC_SELECT_INK:
        AND 07H
        CP 04H
        JR Z,TVC_INK_GREEN
        CP 02H
        JR Z,TVC_INK_RED
        CP 07H
        JR Z,TVC_INK_WHITE
        LD A,03H               ; visible fallback for cyan/yellow/magenta
        JR TVC_INK_DONE
TVC_INK_GREEN:
        LD A,01H
        JR TVC_INK_DONE
TVC_INK_RED:
        LD A,02H
        JR TVC_INK_DONE
TVC_INK_WHITE:
        LD A,03H
TVC_INK_DONE:
        LD (3100H),A
        RET

; Pack eight Spectrum bits into two GRAPHICS 4 bytes using the selected title
; palette index. Input A, output BC.
TVC_PACK_ROW:
        LD (3106H),A
        AND F0H
        CALL TVC_ENCODE_NIBBLE
        LD B,A
        LD A,(3106H)
        AND 0FH
        RLCA
        RLCA
        RLCA
        RLCA
        CALL TVC_ENCODE_NIBBLE
        LD C,A
        RET

TVC_ENCODE_NIBBLE:
        LD C,A
        LD A,(3100H)
        OR A
        JR Z,TVC_ENCODE_BLACK
        DEC A
        JR Z,TVC_ENCODE_ONE
        DEC A
        JR Z,TVC_ENCODE_TWO
        LD A,C
        AND F0H
        LD C,A
        RRCA
        RRCA
        RRCA
        RRCA
        OR C
        RET
TVC_ENCODE_TWO:
        LD A,C
        RRCA
        RRCA
        RRCA
        RRCA
        AND 0FH
        RET
TVC_ENCODE_ONE:
        LD A,C
        AND F0H
        RET
TVC_ENCODE_BLACK:
        XOR A
        RET

TVC_WAIT_ANY_KEY:
        LD B,11
        LD C,00H
TVC_KEY_ROW_LOOP:
        LD A,C
        OUT (03H),A
        IN A,(58H)
        CP 0FFH
        RET NZ
        INC C
        DJNZ TVC_KEY_ROW_LOOP
        JR TVC_WAIT_ANY_KEY

TVC_OLD_MAPPER:
        DB 00H
