; Laser Squad TVC disk loader.
;
; Preserve the original Spectrum BASIC loading sequence in machine code:
;   LOAD LS at 7530H, call 7530H,
;   LOAD LSCODE at 5E28H, call 5E28H.
;
; TVC BASIC cannot load a named block to an explicit address, so LOAD_BLOCK
; performs the two targeted loads through the low-level VT-DOS device API.
; The build supplies the converted payload sizes using rtvc-asm -d:
;   %FIRST_BLOCK_SIZE%
;   %SECOND_BLOCK_SIZE%

        BASIC_START

        DI
        XOR A
        LD (0B6BH),A            ; non-buffered file access

        LD DE,FIRST_BLOCK_NAME
        LD BC,%FIRST_BLOCK_SIZE%
        LD HL,7530H
        CALL LOAD_BLOCK
        JR NZ,LOADER_DONE
        CALL 7530H

        LD DE,SECOND_BLOCK_NAME
        LD BC,%SECOND_BLOCK_SIZE%
        LD HL,5E28H
        CALL LOAD_BLOCK
        JR NZ,LOADER_DONE

        ; The support source now overlaps its 2000H destination. Copy from the
        ; end so the relocation cannot overwrite source bytes still to read.
        LD HL,TVC_SUPPORT_IMAGE_END
        DEC HL
        LD DE,2000H+TVC_SUPPORT_IMAGE_END-TVC_SUPPORT_IMAGE
        DEC DE
        LD BC,TVC_SUPPORT_IMAGE_END-TVC_SUPPORT_IMAGE
TVC_SUPPORT_COPY_DIRECTION:
        LDDR
        CALL 5E28H

LOADER_DONE:
        EI
        RET

; Input:  DE = length-prefixed TVC filename
;         BC = payload size
;         HL = payload destination
; Output: A = zero on success, nonzero device status on failure
LOAD_BLOCK:
        LD (BLOCK_SIZE),BC
        LD (BLOCK_TARGET),HL

        LD A,0D0H               ; disk device 5, input direction
        LD (1705H),A
        OR 03H                  ; D3H: open for input
        CALL 001BH              ; RAM trampoline to the selected device
        OR A
        RET NZ

        LD BC,0010H
        LD DE,19DFH             ; consume the TVC application header
        LD A,(1705H)
        OR 82H                  ; D2H: block input
        CALL 001BH
        OR A
        JR NZ,LOAD_BLOCK_CLOSE

        LD BC,(BLOCK_SIZE)
        LD DE,(BLOCK_TARGET)
        LD A,(1705H)
        OR 82H                  ; D2H: block input
        CALL 001BH

LOAD_BLOCK_CLOSE:
        PUSH AF                 ; preserve read status across close
        LD A,(1705H)
        OR 04H                  ; D4H: close
        CALL 001BH
        POP AF
        OR A
        RET

FIRST_BLOCK_NAME:
        DB 3,"LS1"
SECOND_BLOCK_NAME:
        DB 3,"LS2"

BLOCK_SIZE:
        DW 0000H
BLOCK_TARGET:
        DW 0000H

; Relocatable support copied to U0 RAM at 2000H after LSCODE is loaded. Page 0
; remains mapped to U0 in the BASIC/game map, giving the port enough room for
; the original keyboard and graphics entry-point replacements. Keep absolute
; references inside this image limited to fixed game/TVC addresses; branches
; within the copied image are relative.
TVC_SUPPORT_IMAGE:
; TVC replacement for the hardware-specific 5E28H entry. The game needs U3 in
; page 3 for its high-memory data and large glyphs; ROM calls below map SYS only
; for their duration.
TVC_MAIN_ENTRY:
        DI
        LD A,(0003H)
        AND 3FH
        OR 80H                  ; U3 in page 3, U2 remains in page 2
        LD (0003H),A
        OUT (02H),A
        LD HL,5B00H
        LD DE,5B01H
        LD (HL),00H
        LD BC,0325H
        LDIR
        XOR A
        OUT (00H),A
        NOP
        ; The TVC firmware interrupt path uses a substantially deeper stack
        ; than the Spectrum IM 1 handler. Keep it in U0 so interrupt-time
        ; pushes cannot overwrite the game's live 5B00H-5E25H workspace.
        LD SP,4000H
        JP 0B1C3H

TVC_NUMBER_INPUT:
        LD A,(0B11H)
        AND F0H
        OUT (03H),A
        IN A,(58H)
        LD D,A
        LD A,(0B11H)
        AND F0H
        INC A
        OUT (03H),A
        IN A,(58H)
        LD E,A
        LD C,0FFH

        BIT 3,D                 ; TVC 0
        JR Z,TVC_NUMBER_0_5
        BIT 0,D                 ; TVC 5
        JR NZ,TVC_NUMBER_9_4
TVC_NUMBER_0_5:
        RES 0,C
TVC_NUMBER_9_4:
        BIT 2,E                 ; TVC 9
        JR Z,TVC_NUMBER_9_4_DOWN
        BIT 7,D                 ; TVC 4
        JR NZ,TVC_NUMBER_8_3
TVC_NUMBER_9_4_DOWN:
        RES 1,C
TVC_NUMBER_8_3:
        BIT 1,E                 ; TVC 8
        JR Z,TVC_NUMBER_8_3_DOWN
        BIT 1,D                 ; TVC 3
        JR NZ,TVC_NUMBER_7_2
TVC_NUMBER_8_3_DOWN:
        RES 2,C
TVC_NUMBER_7_2:
        BIT 7,E                 ; TVC 7
        JR Z,TVC_NUMBER_7_2_DOWN
        BIT 2,D                 ; TVC 2
        JR NZ,TVC_NUMBER_6_1
TVC_NUMBER_7_2_DOWN:
        RES 3,C
TVC_NUMBER_6_1:
        BIT 4,D                 ; TVC 6
        JR Z,TVC_NUMBER_6_1_DOWN
        BIT 6,D                 ; TVC 1
        JR NZ,TVC_NUMBER_DONE
TVC_NUMBER_6_1_DOWN:
        RES 4,C
TVC_NUMBER_DONE:
        LD A,C
        OR E0H
        RET

; Replacement for Spectrum ROM KEY-SCAN at 028EH. Return the original Spectrum
; numeric key code in E and FFH when no number is held; D remains FFH as for a
; single/no-key Spectrum scan. This feeds the unchanged A276H menu logic.
TVC_KEY_SCAN:
        LD A,(0B11H)
        AND F0H
        OUT (03H),A
        IN A,(58H)
        LD H,A                  ; TVC keyboard row 0
        LD A,(0B11H)
        AND F0H
        INC A
        OUT (03H),A
        IN A,(58H)
        LD L,A                  ; TVC keyboard row 1
        LD DE,0FFFFH

        BIT 6,H                 ; TVC 1 -> Spectrum KEY-SCAN 24H
        JR Z,TVC_KEY_SCAN_1
        BIT 2,H                 ; TVC 2 -> 1CH
        JR Z,TVC_KEY_SCAN_2
        BIT 1,H                 ; TVC 3 -> 14H
        JR Z,TVC_KEY_SCAN_3
        BIT 7,H                 ; TVC 4 -> 0CH
        JR Z,TVC_KEY_SCAN_4
        BIT 0,H                 ; TVC 5 -> 04H
        JR Z,TVC_KEY_SCAN_5
        BIT 3,H                 ; TVC 0 -> 23H
        JR Z,TVC_KEY_SCAN_0
        BIT 2,L                 ; TVC 9 -> 1BH
        JR Z,TVC_KEY_SCAN_9
        BIT 1,L                 ; TVC 8 -> 13H
        JR Z,TVC_KEY_SCAN_8
        BIT 7,L                 ; TVC 7 -> 0BH
        JR Z,TVC_KEY_SCAN_7
        BIT 4,H                 ; TVC 6 -> 03H
        JR Z,TVC_KEY_SCAN_6
        RET
TVC_KEY_SCAN_1:
        LD E,24H
        RET
TVC_KEY_SCAN_2:
        LD E,1CH
        RET
TVC_KEY_SCAN_3:
        LD E,14H
        RET
TVC_KEY_SCAN_4:
        LD E,0CH
        RET
TVC_KEY_SCAN_5:
        LD E,04H
        RET
TVC_KEY_SCAN_0:
        LD E,23H
        RET
TVC_KEY_SCAN_9:
        LD E,1BH
        RET
TVC_KEY_SCAN_8:
        LD E,13H
        RET
TVC_KEY_SCAN_7:
        LD E,0BH
        RET
TVC_KEY_SCAN_6:
        LD E,03H
        RET

; B0ADH originally calls the common screen clear before drawing the control
; selector. Select its cyan palette profile first, then tail-call the original
; clear entry so its return still goes directly to B0B0H.
TVC_CONTROLS_SCREEN_CLEAR:
        XOR A
        LD (TVC_PALETTE_ID_RUN),A
        JP 602CH

; B0C3H originally stores the selected control method and returns. Preserve
; that state and A, but select the normal-game green profile for the next
; screen clear. Deferring the hardware write avoids recoloring the control
; screen between the key press and its replacement.
TVC_CONTROLS_SELECTED:
        LD (0B0C7H),A
        PUSH AF
        LD A,01H
        LD (TVC_PALETTE_ID_RUN),A
        POP AF
        RET

; The team/armour setup routine begins at 9D55H with a common screen clear.
; Select its dedicated green/cyan/yellow profile before tail-calling that clear.
TVC_TEAM_SETUP_CLEAR:
        LD A,02H
        LD (TVC_PALETTE_ID_RUN),A
        JP 602CH

; A370H is the common deployment-screen clear for both players. Use a
; placement profile that keeps the original blue and red team fields distinct.
TVC_PLACEMENT_SCREEN_CLEAR:
        LD A,03H
        LD (TVC_PALETTE_ID_RUN),A
        JP 602CH

; 5E92H enters the normal gameplay/menu clear through B1F7H after deployment.
; Restore the existing black/green/cyan/yellow profile before that clear.
TVC_GAMEPLAY_SCREEN_CLEAR:
        LD A,02H
        LD (TVC_PALETTE_ID_RUN),A
        JP 0B1F7H

; Replacement for the original 693FH-6942H attribute-store sequence used by
; the selection highlighter. Preserve OR 40H, the shadow write, registers,
; flags, and the final HL increment, while also redrawing that character cell.
TVC_STORE_ATTRIBUTE_AND_REDRAW:
        OR 40H
        LD (HL),A
        PUSH AF
        PUSH BC
        PUSH DE
        PUSH HL
        LD A,L
        AND 1FH
        LD C,A                  ; attribute column
        LD A,H
        SUB 58H
        ADD A,A
        ADD A,A
        ADD A,A
        LD D,A                  ; attribute row bits 3-4
        LD A,L
        RRCA
        RRCA
        RRCA
        RRCA
        RRCA
        AND 07H
        OR D                    ; complete attribute row 0-23
        CALL TVC_REDRAW_SHADOW_CELL_RUN
        POP HL
        POP DE
        POP BC
        POP AF
        INC HL
        RET

; Replacement for the selected keyboard-control handler at B136H. Preserve
; its active-low action byte: bit 0 Space, bit 1 Q, bit 2 A, bit 3 P, bit 4 O.
; The original body reads Spectrum rows FDH, FBH, DFH, and 7FH from port FEH;
; translate only those five keys to their TVC matrix positions.
TVC_GAME_KEYS:
TVC_GAME_KEYS_RUN EQU 2000H+TVC_GAME_KEYS-TVC_SUPPORT_IMAGE
        LD E,0FFH

        LD A,(0B11H)
        AND F0H
        OR 02H
        OUT (03H),A
        IN A,(58H)             ; row 2: Q at column 6
        BIT 6,A
        JR NZ,TVC_GAME_KEYS_A
        RES 1,E

TVC_GAME_KEYS_A:
        LD A,(0B11H)
        AND F0H
        OR 04H
        OUT (03H),A
        IN A,(58H)             ; row 4: A at column 6
        BIT 6,A
        JR NZ,TVC_GAME_KEYS_OP
        RES 2,E

TVC_GAME_KEYS_OP:
        LD A,(0B11H)
        AND F0H
        OR 03H
        OUT (03H),A
        IN A,(58H)             ; row 3: O at column 2, P at column 6
        BIT 2,A
        JR NZ,TVC_GAME_KEYS_P
        RES 4,E
TVC_GAME_KEYS_P:
        BIT 6,A
        JR NZ,TVC_GAME_KEYS_SPACE
        RES 3,E

TVC_GAME_KEYS_SPACE:
        LD A,(0B11H)
        AND F0H
        OR 07H
        OUT (03H),A
        IN A,(58H)             ; row 7: Space at column 5
        BIT 5,A
        JR NZ,TVC_GAME_KEYS_DONE
        RES 0,E

TVC_GAME_KEYS_DONE:
        LD BC,7FFEH            ; match the original handler's return state
        LD D,00H
        LD A,E
        RET

; Replacement for B15CH mode 1: load the selected original 49DFH-byte scenario
; payload directly across U2/U3 at B621H-FFFFH. The page-0 LOAD_BLOCK routine
; remains accessible while VT-DOS temporarily obtains its ROM mappings.
TVC_MULTILOAD:
        CP 01H
        JP NZ,TVC_MULTILOAD_FAIL_RUN ; save/verify modes remain unported
        LD A,B
        CP 64H
        JR Z,TVC_MULTILOAD_64
        CP 65H
        JR Z,TVC_MULTILOAD_65
        CP 66H
        JR Z,TVC_MULTILOAD_66
        CP 68H
        JP NZ,TVC_MULTILOAD_FAIL_RUN
        LD DE,TVC_BLOCK_68_NAME_RUN
        JR TVC_MULTILOAD_SELECTED
TVC_MULTILOAD_64:
        LD DE,TVC_BLOCK_64_NAME_RUN
        JR TVC_MULTILOAD_SELECTED
TVC_MULTILOAD_65:
        LD DE,TVC_BLOCK_65_NAME_RUN
        JR TVC_MULTILOAD_SELECTED
TVC_MULTILOAD_66:
        LD DE,TVC_BLOCK_66_NAME_RUN

TVC_MULTILOAD_SELECTED:
        LD A,(0003H)
        AND 1FH
        OR 0A0H
        LD (0003H),A
        OUT (02H),A             ; U2 + U3 direct destination mapping
        LD BC,49DFH
        LD HL,0B621H
        CALL LOAD_BLOCK
        OR A
        JP NZ,TVC_MULTILOAD_FAIL_RUN
        LD (0B15BH),A           ; original success flag
        RET

TVC_MULTILOAD_FAIL:
TVC_MULTILOAD_FAIL_RUN EQU 2000H+TVC_MULTILOAD_FAIL-TVC_SUPPORT_IMAGE
        LD A,(0003H)
        AND 1FH
        OR 0A0H                 ; restore U2/U3 game mapping
        LD (0003H),A
        OUT (02H),A
        XOR A
        OUT (0CH),A
        LD A,01H
        LD (0B15BH),A
        RET

TVC_BLOCK_64_NAME:
TVC_BLOCK_64_NAME_RUN EQU 2000H+TVC_BLOCK_64_NAME-TVC_SUPPORT_IMAGE
        DB 3,"L64"
TVC_BLOCK_65_NAME:
TVC_BLOCK_65_NAME_RUN EQU 2000H+TVC_BLOCK_65_NAME-TVC_SUPPORT_IMAGE
        DB 3,"L65"
TVC_BLOCK_66_NAME:
TVC_BLOCK_66_NAME_RUN EQU 2000H+TVC_BLOCK_66_NAME-TVC_SUPPORT_IMAGE
        DB 3,"L66"
TVC_BLOCK_68_NAME:
TVC_BLOCK_68_NAME_RUN EQU 2000H+TVC_BLOCK_68_NAME-TVC_SUPPORT_IMAGE
        DB 3,"L68"

; Palette profiles contain the four values written to ports 60H-63H.
; A selects the zero-based profile. Add new four-byte profiles here and select
; them through TVC_PALETTE_ID_RUN at the appropriate game transition.
TVC_APPLY_PALETTE:
TVC_APPLY_PALETTE_RUN EQU 2000H+TVC_APPLY_PALETTE-TVC_SUPPORT_IMAGE
        ADD A,A
        ADD A,A
        LD E,A
        LD D,00H
        LD HL,TVC_PALETTES_RUN
        ADD HL,DE
        LD BC,0060H
        LD E,04H
TVC_APPLY_PALETTE_NEXT:
        LD A,(HL)
        OUT (C),A
        INC HL
        INC C
        DEC E
        JR NZ,TVC_APPLY_PALETTE_NEXT
        RET

TVC_PALETTES:
TVC_PALETTES_RUN EQU 2000H+TVC_PALETTES-TVC_SUPPORT_IMAGE
        DB 00H,51H,54H,44H    ; profile 0: controls, black/cyan/yellow/red
        DB 00H,50H,54H,44H    ; profile 1: game, black/green/yellow/red
        DB 00H,50H,51H,54H    ; profile 2: team, black/green/cyan/yellow
        DB 00H,50H,41H,44H    ; profile 3: placement, black/green/blue/red

TVC_PALETTE_ID:
TVC_PALETTE_ID_RUN EQU 2000H+TVC_PALETTE_ID-TVC_SUPPORT_IMAGE
        DB 00H                 ; start with the control-screen profile

; Replacement for the hardware-specific body at 602DH. Preserve the original
; Spectrum RAM clear because game code may inspect that screen state, then
; clear VID0 and apply the palette profile selected for the current game phase.
TVC_CLEAR_SCREEN:
        PUSH AF
        LD HL,5AFFH
        LD DE,5AFEH
        LD BC,02FFH
        LD (HL),A
        LDDR
        DEC HL
        DEC DE
        LD (HL),C
        LD BC,17FFH
        LDDR
        LD A,(0B13H)
        AND 0FCH
        OR 01H
        LD (0B13H),A
        OUT (06H),A             ; GRAPHICS 4, preserve sound/control bits
        XOR A
        OUT (0CH),A             ; page 2 and display both select VID0
        LD A,(0003H)
        PUSH AF
        AND 0DFH                ; map VID0 into page 2
        LD (0003H),A
        OUT (02H),A
        LD HL,8000H
        LD DE,8001H
        LD BC,3FFFH
        LD (HL),00H
        LDIR                    ; clear the complete 16 KiB video bank
        POP AF
        LD (0003H),A
        OUT (02H),A             ; restore U2 while leaving U3 mapped
        LD A,(TVC_PALETTE_ID_RUN)
        CALL TVC_APPLY_PALETTE_RUN
        POP AF                 ; original clear preserved its input attribute
        RET

; Input A is a Spectrum attribute. Select GRAPHICS 4 slots for both ink and
; paper through the active profile's eight-entry color map. This preserves
; reverse-video attributes such as 70H (black ink on bright-yellow paper).
TVC_SELECT_INK:
TVC_SELECT_INK_RUN EQU 2000H+TVC_SELECT_INK-TVC_SUPPORT_IMAGE
        PUSH AF
        AND 07H
        CALL TVC_MAP_COLOR_RUN
        LD (3020H),A
        POP AF
        RRCA
        RRCA
        RRCA
        AND 07H
        CALL TVC_MAP_COLOR_RUN
        LD (3021H),A
        OR A
        RET Z                   ; black paper needs no collision fallback
        LD C,A
        LD A,(3020H)
        CP C
        RET NZ
        XOR A
        LD (3020H),A            ; same non-black slot: use black ink
        RET

; Input A is a Spectrum color index 0-7. Output A is the active profile's
; GRAPHICS 4 palette slot.
TVC_MAP_COLOR:
TVC_MAP_COLOR_RUN EQU 2000H+TVC_MAP_COLOR-TVC_SUPPORT_IMAGE
        LD E,A
        LD A,(TVC_PALETTE_ID_RUN)
        ADD A,A
        ADD A,A
        ADD A,A
        ADD A,E
        LD E,A
        LD D,00H
        LD HL,TVC_INK_PALETTE_MAPS_RUN
        ADD HL,DE
        LD A,(HL)
        RET
TVC_INK_PALETTE_MAPS:
TVC_INK_PALETTE_MAPS_RUN EQU 2000H+TVC_INK_PALETTE_MAPS-TVC_SUPPORT_IMAGE
        ; Spectrum inks: black, blue, red, magenta, green, cyan, yellow, white
        DB 00H,01H,03H,03H,01H,01H,02H,02H ; profile 0: cyan/yellow/red
        DB 00H,01H,03H,03H,01H,01H,02H,02H ; profile 1: green/yellow/red
        DB 00H,02H,03H,02H,01H,02H,03H,02H ; profile 2: white -> cyan
        DB 00H,02H,03H,03H,01H,02H,03H,01H ; profile 3: team primaries

; Input A = Spectrum character row, C = byte column. Output HL is the original
; Spectrum bitmap address for the top raster of that cell. The original row
; table at 6042H remains authoritative.
TVC_SHADOW_BITMAP_DEST:
TVC_SHADOW_BITMAP_DEST_RUN EQU 2000H+TVC_SHADOW_BITMAP_DEST-TVC_SUPPORT_IMAGE
        LD E,A
        LD D,00H
        LD HL,6042H
        ADD HL,DE
        ADD HL,DE
        LD E,(HL)
        INC HL
        LD D,(HL)
        LD L,C
        LD H,00H
        ADD HL,DE
        RET

; Input DE = eight source rows, HL = Spectrum shadow destination. Spectrum
; raster rows in a character cell advance by incrementing the high byte.
TVC_COPY_8_TO_SHADOW:
TVC_COPY_8_TO_SHADOW_RUN EQU 2000H+TVC_COPY_8_TO_SHADOW-TVC_SUPPORT_IMAGE
        LD B,08H
TVC_COPY_8_TO_SHADOW_ROW:
        LD A,(DE)
        LD (HL),A
        INC DE
        INC H
        DJNZ TVC_COPY_8_TO_SHADOW_ROW
        RET

; Input DE = four source rows, HL = Spectrum shadow destination. Each source
; raster is written twice, matching the original double-height renderer.
TVC_COPY_4_DOUBLED_TO_SHADOW:
TVC_COPY_4_DOUBLED_TO_SHADOW_RUN EQU 2000H+TVC_COPY_4_DOUBLED_TO_SHADOW-TVC_SUPPORT_IMAGE
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

; Input A = row, C = column. Redraw one complete character cell from the
; canonical Spectrum bitmap/attribute shadow into TVC GRAPHICS 4 VRAM.
TVC_REDRAW_SHADOW_CELL:
TVC_REDRAW_SHADOW_CELL_RUN EQU 2000H+TVC_REDRAW_SHADOW_CELL-TVC_SUPPORT_IMAGE
        LD (3024H),A
        LD A,C
        LD (3025H),A
        LD A,(3024H)
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        LD (3022H),HL
        LD A,H
        ADD A,07H              ; original conversion uses the final raster
        RRCA
        RRCA
        RRCA
        AND 03H
        OR 58H
        LD H,A
        LD A,(HL)              ; canonical shadow attribute
        CALL TVC_SELECT_INK_RUN
        LD A,(3020H)           ; packing-table bits 7-6: ink slot
        RRCA
        RRCA
        LD C,A
        LD A,(3021H)           ; packing-table bits 5-4: paper slot
        RLCA
        RLCA
        RLCA
        RLCA
        OR C
        LD (302DH),A
        LD A,(0003H)
        PUSH AF
        AND 0DFH               ; selected video RAM in page 2
        LD (0003H),A
        OUT (02H),A
        LD A,(3025H)
        ADD A,A
        LD E,A                 ; one Spectrum byte becomes two TVC bytes
        LD A,(3024H)
        ADD A,A
        ADD A,80H
        LD D,A                 ; character row to TVC raster page
        LD HL,(3022H)
        LD A,(302DH)
        LD C,A                 ; packing-table ink/paper prefix
        LD B,08H
TVC_REDRAW_SHADOW_ROW:
        LD A,(HL)
        PUSH HL
        PUSH AF
        RRCA
        RRCA
        RRCA
        RRCA
        AND 0FH                ; high source nibble
        OR C
        LD L,A
        LD H,26H               ; page-aligned TVC_PACK_NIBBLE_TABLE_RUN
        LD A,(HL)
        LD (DE),A
        INC DE
        POP AF
        AND 0FH                ; low source nibble
        OR C
        LD L,A
        LD H,26H
        LD A,(HL)
        LD (DE),A
        INC DE
        POP HL
        DEC DE
        DEC DE
        LD A,E
        ADD A,40H
        LD E,A
        JR NC,TVC_REDRAW_SHADOW_NEXT
        INC D
TVC_REDRAW_SHADOW_NEXT:
        INC H
        DJNZ TVC_REDRAW_SHADOW_ROW
        POP AF
        LD (0003H),A
        OUT (02H),A
        RET

; Input A is the original character code. Reproduce the original 6072H writes
; into the Spectrum shadow, including its attribute write, then redraw the cell.
TVC_DRAW_NORMAL:
        PUSH HL
        PUSH DE
        PUSH AF
        PUSH BC
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        LD DE,0B139H
        ADD HL,DE
        EX DE,HL               ; DE = original B139H glyph rows
        PUSH DE
        LD HL,(5CFEH)
        LD A,L                 ; row
        LD C,H                 ; column
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        POP DE
        PUSH HL
        CALL TVC_COPY_8_TO_SHADOW_RUN
        POP HL
        LD A,H
        ADD A,07H              ; original conversion uses the final raster
        RRCA
        RRCA
        RRCA
        AND 03H
        OR 58H
        LD H,A
        LD A,(5D00H)
        LD (HL),A              ; preserve original Spectrum attribute write
        LD HL,(5CFEH)
        LD A,L
        LD C,H
        CALL TVC_REDRAW_SHADOW_CELL_RUN
        POP BC
        LD B,00H               ; original eight-row loop returned B=0
        POP AF
        POP DE
        POP HL
        RET

; Original 64F7H double-height text renderer. Preserve its register interface,
; write both Spectrum shadow cells and attributes, then redraw both TVC cells.
TVC_DRAW_DOUBLE:
        PUSH HL
        PUSH DE
        PUSH BC
        PUSH AF
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        LD DE,0B139H
        ADD HL,DE
        EX DE,HL               ; DE = eight original font rows
        PUSH DE
        LD HL,(5CFEH)
        LD A,L
        LD C,H
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        POP DE
        CALL TVC_COPY_4_DOUBLED_TO_SHADOW_RUN
        PUSH DE
        LD HL,(5CFEH)
        LD A,L
        INC A
        LD C,H
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        POP DE
        CALL TVC_COPY_4_DOUBLED_TO_SHADOW_RUN

        LD HL,(5CFEH)
        LD A,L
        LD C,H
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        CALL TVC_BITMAP_TO_ATTRIBUTE_RUN
        LD A,(5D00H)
        LD (HL),A
        LD HL,(5CFEH)
        LD A,L
        INC A
        LD C,H
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        CALL TVC_BITMAP_TO_ATTRIBUTE_RUN
        LD A,(5D01H)
        LD (HL),A

        LD HL,(5CFEH)
        LD A,L
        LD C,H
        CALL TVC_REDRAW_SHADOW_CELL_RUN
        LD HL,(5CFEH)
        LD A,L
        INC A
        LD C,H
        CALL TVC_REDRAW_SHADOW_CELL_RUN
        POP AF
        POP BC
        POP DE
        POP HL
        RET

; Input A is the original large-character code. E8DFH contains four sequential
; 8x8 quadrants. Reproduce the original four bitmap and attribute cells in the
; Spectrum shadow, then redraw those cells from that canonical state.
TVC_DRAW_LARGE:
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        LD DE,0E8DFH
        ADD HL,DE
        LD DE,3000H
        LD BC,0020H
        LDIR
        LD HL,(5CFEH)
        LD A,L
        LD C,H
        LD (3026H),A
        LD A,C
        LD (3027H),A

        LD A,(3027H)
        LD C,A
        LD A,(3026H)           ; top-left bitmap
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        LD DE,3000H
        CALL TVC_COPY_8_TO_SHADOW_RUN
        LD A,(3027H)
        LD C,A
        INC C
        LD A,(3026H)           ; top-right bitmap
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        LD DE,3008H
        CALL TVC_COPY_8_TO_SHADOW_RUN
        LD A,(3027H)
        LD C,A
        LD A,(3026H)           ; bottom-left bitmap
        INC A
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        LD DE,3010H
        CALL TVC_COPY_8_TO_SHADOW_RUN
        LD A,(3027H)
        LD C,A
        INC C
        LD A,(3026H)           ; bottom-right bitmap
        INC A
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        LD DE,3018H
        CALL TVC_COPY_8_TO_SHADOW_RUN

        LD A,(5D00H)           ; four original Spectrum attribute cells
        LD (3021H),A
        LD A,(3027H)
        LD C,A
        LD A,(3026H)
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        CALL TVC_BITMAP_TO_ATTRIBUTE_RUN
        LD A,(3021H)
        LD (HL),A
        INC HL
        LD (HL),A
        LD A,(3027H)
        LD C,A
        LD A,(3026H)
        INC A
        CALL TVC_SHADOW_BITMAP_DEST_RUN
        CALL TVC_BITMAP_TO_ATTRIBUTE_RUN
        LD A,(3021H)
        LD (HL),A
        INC HL
        LD (HL),A

        LD A,(3027H)
        LD C,A
        LD A,(3026H)           ; redraw all four cells from the shadow
        CALL TVC_REDRAW_SHADOW_CELL_RUN
        LD A,(3027H)
        LD C,A
        INC C
        LD A,(3026H)
        CALL TVC_REDRAW_SHADOW_CELL_RUN
        LD A,(3027H)
        LD C,A
        LD A,(3026H)
        INC A
        CALL TVC_REDRAW_SHADOW_CELL_RUN
        LD A,(3027H)
        LD C,A
        INC C
        LD A,(3026H)
        INC A
        CALL TVC_REDRAW_SHADOW_CELL_RUN
        RET

; The original 8B7AH routine toggles a firing cross by XORing the center pixel
; and offsets 1-5 along both axes through its direct Spectrum bitmap plotter.
; Preserve that routine and its return state, then refresh the character cells
; intersected by the resulting 11x11 bitmap change.
TVC_TOGGLE_CROSS:
        CALL 8B7AH
        PUSH AF
        PUSH BC
        PUSH DE
        PUSH HL

        LD A,(5D12H)           ; horizontal center; plotter adds an 8px margin
        ADD A,03H              ; left edge: center + 8 - 5
        RRCA
        RRCA
        RRCA
        AND 1FH
        LD (3028H),A
        LD A,(5D12H)
        ADD A,0DH              ; right edge: center + 8 + 5
        RRCA
        RRCA
        RRCA
        AND 1FH
        LD (3029H),A

        LD A,(5D11H)           ; vertical center
        ADD A,03H              ; top edge: center + 8 - 5
        RRCA
        RRCA
        RRCA
        AND 1FH
        LD (302AH),A
        LD A,(5D11H)
        ADD A,0DH              ; bottom edge: center + 8 + 5
        RRCA
        RRCA
        RRCA
        AND 1FH
        LD (302BH),A

TVC_TOGGLE_CROSS_ROW:
        LD A,(3028H)
        LD (302CH),A
TVC_TOGGLE_CROSS_CELL:
        LD C,A
        LD A,(302AH)
        CALL TVC_REDRAW_SHADOW_CELL_RUN
        LD A,(302CH)
        INC A
        LD (302CH),A
        LD C,A
        LD A,(3029H)
        INC A
        CP C
        LD A,(302CH)
        JR NZ,TVC_TOGGLE_CROSS_CELL

        LD A,(302AH)
        INC A
        LD (302AH),A
        LD C,A
        LD A,(302BH)
        INC A
        CP C
        JR NZ,TVC_TOGGLE_CROSS_ROW

        POP HL
        POP DE
        POP BC
        POP AF
        RET

; Convert a Spectrum bitmap cell address in HL to its attribute address.
TVC_BITMAP_TO_ATTRIBUTE:
TVC_BITMAP_TO_ATTRIBUTE_RUN EQU 2000H+TVC_BITMAP_TO_ATTRIBUTE-TVC_SUPPORT_IMAGE
        LD A,H
        ADD A,07H              ; original conversion uses the final raster
        RRCA
        RRCA
        RRCA
        AND 03H
        OR 58H
        LD H,A
        RET

; Runtime address 2600H is deliberate: the high byte can be loaded directly
; in the eight-row hot loop. The index is ink*64 + paper*16 + source nibble.
; Each byte contains four GRAPHICS 4 pixels with source-one pixels using ink
; and source-zero pixels using paper.
        DEFS TVC_SUPPORT_IMAGE+0600H-$
TVC_PACK_NIBBLE_TABLE:
TVC_PACK_NIBBLE_TABLE_RUN EQU 2000H+TVC_PACK_NIBBLE_TABLE-TVC_SUPPORT_IMAGE
        DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H ; ink 0, paper 0
        DB F0H,E0H,D0H,C0H,B0H,A0H,90H,80H,70H,60H,50H,40H,30H,20H,10H,00H ; ink 0, paper 1
        DB 0FH,0EH,0DH,0CH,0BH,0AH,09H,08H,07H,06H,05H,04H,03H,02H,01H,00H ; ink 0, paper 2
        DB FFH,EEH,DDH,CCH,BBH,AAH,99H,88H,77H,66H,55H,44H,33H,22H,11H,00H ; ink 0, paper 3
        DB 00H,10H,20H,30H,40H,50H,60H,70H,80H,90H,A0H,B0H,C0H,D0H,E0H,F0H ; ink 1, paper 0
        DB F0H,F0H,F0H,F0H,F0H,F0H,F0H,F0H,F0H,F0H,F0H,F0H,F0H,F0H,F0H,F0H ; ink 1, paper 1
        DB 0FH,1EH,2DH,3CH,4BH,5AH,69H,78H,87H,96H,A5H,B4H,C3H,D2H,E1H,F0H ; ink 1, paper 2
        DB FFH,FEH,FDH,FCH,FBH,FAH,F9H,F8H,F7H,F6H,F5H,F4H,F3H,F2H,F1H,F0H ; ink 1, paper 3
        DB 00H,01H,02H,03H,04H,05H,06H,07H,08H,09H,0AH,0BH,0CH,0DH,0EH,0FH ; ink 2, paper 0
        DB F0H,E1H,D2H,C3H,B4H,A5H,96H,87H,78H,69H,5AH,4BH,3CH,2DH,1EH,0FH ; ink 2, paper 1
        DB 0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH,0FH ; ink 2, paper 2
        DB FFH,EFH,DFH,CFH,BFH,AFH,9FH,8FH,7FH,6FH,5FH,4FH,3FH,2FH,1FH,0FH ; ink 2, paper 3
        DB 00H,11H,22H,33H,44H,55H,66H,77H,88H,99H,AAH,BBH,CCH,DDH,EEH,FFH ; ink 3, paper 0
        DB F0H,F1H,F2H,F3H,F4H,F5H,F6H,F7H,F8H,F9H,FAH,FBH,FCH,FDH,FEH,FFH ; ink 3, paper 1
        DB 0FH,1FH,2FH,3FH,4FH,5FH,6FH,7FH,8FH,9FH,AFH,BFH,CFH,DFH,EFH,FFH ; ink 3, paper 2
        DB FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH,FFH ; ink 3, paper 3
TVC_SUPPORT_IMAGE_END:
