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

        LD HL,TVC_SUPPORT_IMAGE
        LD DE,2000H
        LD BC,TVC_SUPPORT_IMAGE_END-TVC_SUPPORT_IMAGE
        LDIR
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

; Replacement for B15CH mode 1: load the selected scenario payload while
; preserving the original block-ID selection. The first 09DFH bytes go directly
; to U2 at B621H. The final 4000H bytes are staged through the disposable
; Spectrum shadow at 4000H in three chunks and copied to U3. All four parts use
; the same proven page-0 LOAD_BLOCK routine as the initial loader.
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
        LD DE,TVC_BLOCK_68A_NAME_RUN
        LD HL,TVC_BLOCK_68B_NAME_RUN
        LD BC,TVC_BLOCK_68C_NAME_RUN
        LD IX,TVC_BLOCK_68D_NAME_RUN
        JR TVC_MULTILOAD_SELECTED
TVC_MULTILOAD_64:
        LD DE,TVC_BLOCK_64A_NAME_RUN
        LD HL,TVC_BLOCK_64B_NAME_RUN
        LD BC,TVC_BLOCK_64C_NAME_RUN
        LD IX,TVC_BLOCK_64D_NAME_RUN
        JR TVC_MULTILOAD_SELECTED
TVC_MULTILOAD_65:
        LD DE,TVC_BLOCK_65A_NAME_RUN
        LD HL,TVC_BLOCK_65B_NAME_RUN
        LD BC,TVC_BLOCK_65C_NAME_RUN
        LD IX,TVC_BLOCK_65D_NAME_RUN
        JR TVC_MULTILOAD_SELECTED
TVC_MULTILOAD_66:
        LD DE,TVC_BLOCK_66A_NAME_RUN
        LD HL,TVC_BLOCK_66B_NAME_RUN
        LD BC,TVC_BLOCK_66C_NAME_RUN
        LD IX,TVC_BLOCK_66D_NAME_RUN

TVC_MULTILOAD_SELECTED:
        LD (3030H),HL
        LD (3032H),BC
        LD (3034H),IX           ; remember three U3 chunk filenames
        LD A,(0003H)
        AND 3FH
        OR 40H
        LD (0003H),A
        OUT (02H),A             ; U2 + SYS mapping for page-0 disk loader
        LD BC,09DFH
        LD HL,0B621H
        CALL LOAD_BLOCK
        OR A
        JP NZ,TVC_MULTILOAD_FAIL_RUN

        LD DE,(3030H)
        LD BC,1800H
        LD HL,0C000H
        CALL TVC_LOAD_U3_PART_RUN
        OR A
        JP NZ,TVC_MULTILOAD_FAIL_RUN
        LD DE,(3032H)
        LD BC,1800H
        LD HL,0D800H
        CALL TVC_LOAD_U3_PART_RUN
        OR A
        JP NZ,TVC_MULTILOAD_FAIL_RUN
        LD DE,(3034H)
        LD BC,1000H
        LD HL,0F000H
        CALL TVC_LOAD_U3_PART_RUN
        OR A
        JP NZ,TVC_MULTILOAD_FAIL_RUN
        LD (0B15BH),A           ; original success flag
        RET

; Input DE = filename, BC = part size, HL = final U3 destination.
TVC_LOAD_U3_PART:
TVC_LOAD_U3_PART_RUN EQU 2000H+TVC_LOAD_U3_PART-TVC_SUPPORT_IMAGE
        LD (3036H),HL
        LD (3038H),BC
        LD A,(0003H)
        AND 3FH
        OR 40H
        LD (0003H),A
        OUT (02H),A             ; U1/U2/SYS mapping for VT-DOS
        LD HL,4000H
        CALL LOAD_BLOCK         ; stage part over obsolete menu shadow
        OR A
        RET NZ
        LD A,(0003H)
        AND 3FH
        OR 80H
        LD (0003H),A
        OUT (02H),A             ; expose U3 for the final copy
        LD HL,4000H
        LD DE,(3036H)
        LD BC,(3038H)
        LDIR
        XOR A
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

TVC_BLOCK_64A_NAME:
TVC_BLOCK_64A_NAME_RUN EQU 2000H+TVC_BLOCK_64A_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L64A"
TVC_BLOCK_64B_NAME:
TVC_BLOCK_64B_NAME_RUN EQU 2000H+TVC_BLOCK_64B_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L64B"
TVC_BLOCK_64C_NAME:
TVC_BLOCK_64C_NAME_RUN EQU 2000H+TVC_BLOCK_64C_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L64C"
TVC_BLOCK_64D_NAME:
TVC_BLOCK_64D_NAME_RUN EQU 2000H+TVC_BLOCK_64D_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L64D"
TVC_BLOCK_65A_NAME:
TVC_BLOCK_65A_NAME_RUN EQU 2000H+TVC_BLOCK_65A_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L65A"
TVC_BLOCK_65B_NAME:
TVC_BLOCK_65B_NAME_RUN EQU 2000H+TVC_BLOCK_65B_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L65B"
TVC_BLOCK_65C_NAME:
TVC_BLOCK_65C_NAME_RUN EQU 2000H+TVC_BLOCK_65C_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L65C"
TVC_BLOCK_65D_NAME:
TVC_BLOCK_65D_NAME_RUN EQU 2000H+TVC_BLOCK_65D_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L65D"
TVC_BLOCK_66A_NAME:
TVC_BLOCK_66A_NAME_RUN EQU 2000H+TVC_BLOCK_66A_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L66A"
TVC_BLOCK_66B_NAME:
TVC_BLOCK_66B_NAME_RUN EQU 2000H+TVC_BLOCK_66B_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L66B"
TVC_BLOCK_66C_NAME:
TVC_BLOCK_66C_NAME_RUN EQU 2000H+TVC_BLOCK_66C_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L66C"
TVC_BLOCK_66D_NAME:
TVC_BLOCK_66D_NAME_RUN EQU 2000H+TVC_BLOCK_66D_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L66D"
TVC_BLOCK_68A_NAME:
TVC_BLOCK_68A_NAME_RUN EQU 2000H+TVC_BLOCK_68A_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L68A"
TVC_BLOCK_68B_NAME:
TVC_BLOCK_68B_NAME_RUN EQU 2000H+TVC_BLOCK_68B_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L68B"
TVC_BLOCK_68C_NAME:
TVC_BLOCK_68C_NAME_RUN EQU 2000H+TVC_BLOCK_68C_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L68C"
TVC_BLOCK_68D_NAME:
TVC_BLOCK_68D_NAME_RUN EQU 2000H+TVC_BLOCK_68D_NAME-TVC_SUPPORT_IMAGE
        DB 4,"L68D"

; Replacement for the hardware-specific body at 602DH. Preserve the original
; Spectrum RAM clear because game code may inspect that screen state, then
; clear VID0 and establish the four colors used by the early game screens.
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
        XOR A
        OUT (60H),A            ; palette 0: black
        LD A,50H
        OUT (61H),A            ; palette 1: bright green (Spectrum ink 4)
        LD A,54H
        OUT (62H),A            ; palette 2: bright yellow (Spectrum ink 6)
        LD A,44H
        OUT (63H),A            ; palette 3: bright red (Spectrum ink 2)
        POP AF                 ; original clear preserved its input attribute
        RET

; Store one Spectrum bitmap byte as two GRAPHICS 4 bytes. The menu uses bright
; green, yellow, and red; the scratch ink index selects their fixed palette slots.
TVC_PACK_STORE_ROW:
TVC_PACK_STORE_ROW_RUN EQU 2000H+TVC_PACK_STORE_ROW-TVC_SUPPORT_IMAGE
        PUSH AF
        AND F0H
        CALL TVC_ENCODE_NIBBLE_RUN
        LD (DE),A
        INC DE
        POP AF
        AND 0FH
        RLCA
        RLCA
        RLCA
        RLCA
        CALL TVC_ENCODE_NIBBLE_RUN
        LD (DE),A
        INC DE
        RET

; Input: A contains four source bits in bits 7-4. Output: one GRAPHICS 4 byte.
TVC_ENCODE_NIBBLE:
TVC_ENCODE_NIBBLE_RUN EQU 2000H+TVC_ENCODE_NIBBLE-TVC_SUPPORT_IMAGE
        LD C,A
        LD A,(3020H)
        OR A
        JR Z,TVC_ENCODE_BLACK
        DEC A
        JR Z,TVC_ENCODE_ONE
        DEC A
        JR Z,TVC_ENCODE_TWO
        LD A,C                 ; palette 3: set both split pixel bits
        AND F0H
        LD C,A
        RRCA
        RRCA
        RRCA
        RRCA
        OR C
        RET
TVC_ENCODE_TWO:
        LD A,C                 ; palette 2: low-nibble pixel bits
        RRCA
        RRCA
        RRCA
        RRCA
        AND 0FH
        RET
TVC_ENCODE_ONE:
        LD A,C                 ; palette 1: high-nibble pixel bits
        AND F0H
        RET
TVC_ENCODE_BLACK:
        XOR A
        RET

; Input A is a Spectrum attribute. Select the closest fixed GRAPHICS 4 palette
; slot. Green, red, and yellow are exact; colors unavailable in the four-entry
; palette remain visible through a nearby fallback instead of becoming black.
TVC_SELECT_INK:
TVC_SELECT_INK_RUN EQU 2000H+TVC_SELECT_INK-TVC_SUPPORT_IMAGE
        AND 07H
        LD E,A
        LD D,00H
        LD HL,TVC_INK_PALETTE_MAP_RUN
        ADD HL,DE
        LD A,(HL)
        LD (3020H),A
        RET
TVC_INK_PALETTE_MAP:
TVC_INK_PALETTE_MAP_RUN EQU 2000H+TVC_INK_PALETTE_MAP-TVC_SUPPORT_IMAGE
        DB 00H,01H,03H,03H,01H,01H,02H,02H

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
        LD B,08H
TVC_REDRAW_SHADOW_ROW:
        LD A,(HL)
        CALL TVC_PACK_STORE_ROW_RUN
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
TVC_SUPPORT_IMAGE_END:
