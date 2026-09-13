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
        ; Switch to the 192-line paper before the first title clear, then
        ; install the precolored fonts and direct-copy engine before VT-DOS
        ; can reuse their temporary U0 source area.
        LD A,06H
        OUT (70H),A
        LD A,30H
        OUT (71H),A
        LD A,(0003H)
        PUSH AF
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        LD HL,TVC_NATIVE_FONT_SLOT1_SOURCE
        LD DE,TVC_NATIVE_FONT_SLOT1_RUN
        LD BC,TVC_HIDDEN_CODE_IMAGE_END-TVC_NATIVE_FONT_SLOT1_SOURCE
        LDIR
        POP AF
        LD (0003H),A
        OUT (02H),A
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

        ; The support source overlaps its higher 2120H destination. Copy
        ; backward so relocation cannot overwrite source bytes still to read.
        LD HL,TVC_SUPPORT_IMAGE_END
        DEC HL
        LD DE,TVC_SUPPORT_RUN+TVC_SUPPORT_IMAGE_END-TVC_SUPPORT_IMAGE
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

; Open one derived native-graphics file and read its two contiguous glyph
; groups into the safe U0 and U1 regions on either side of the game stack.
; Input DE is a length-prefixed filename. Output A follows LOAD_BLOCK.
LOAD_NATIVE_GRAPHICS:
        LD A,0D0H
        LD (1705H),A
        OR 03H
        CALL 001BH
        OR A
        RET NZ

        LD BC,0010H
        LD DE,19DFH
        LD A,(1705H)
        OR 82H
        CALL 001BH
        OR A
        JR NZ,LOAD_NATIVE_GRAPHICS_CLOSE

        LD BC,TVC_LARGE_NATIVE_LOW_SIZE
        LD DE,TVC_LARGE_NATIVE_LOW_RUN
        LD A,(1705H)
        OR 82H
        CALL 001BH
        OR A
        JR NZ,LOAD_NATIVE_GRAPHICS_CLOSE

        LD BC,TVC_LARGE_NATIVE_HIGH_SIZE
        LD DE,TVC_LARGE_NATIVE_HIGH_RUN
        LD A,(1705H)
        OR 82H
        CALL 001BH

LOAD_NATIVE_GRAPHICS_CLOSE:
        PUSH AF
        LD A,(1705H)
        OR 04H
        CALL 001BH
        POP AF
        OR A
        RET

TVC_SUPPORT_RUN EQU 2120H
TVC_LARGE_NATIVE_LOW_RUN EQU 2880H
TVC_LARGE_NATIVE_LOW_SIZE EQU 1640H ; 89 glyphs * 64 bytes
TVC_LARGE_NATIVE_SCRATCH_RUN EQU 3EC0H ; one converted raw-glyph fallback
TVC_LARGE_NATIVE_HIGH_RUN EQU 4000H
TVC_LARGE_NATIVE_HIGH_SIZE EQU 1800H ; 96 glyphs * 64 bytes
TVC_NATIVE_FONT_SLOT1_RUN EQU 0B000H
TVC_NATIVE_FONT_SLOT2_RUN EQU 0B600H
TVC_HIDDEN_CODE_RUN EQU 0BC00H

; Printable codes 20H-7FH from the original B139H-indexed font are converted
; offline. The build patches these reserved bytes in LOADER.CAS; they remain at
; their load address and are accessible while VID0 replaces page 2.
TVC_NATIVE_FONT:
        DEFS 0600H
TVC_NATIVE_FONT_END:

; Relocatable support copied to U0 RAM at 2120H after LSCODE is loaded. Page 0
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
        LD SP,4000H             ; 140H clear below the native low table
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
; placement profile that keeps the original cyan and yellow team fields distinct.
TVC_PLACEMENT_SCREEN_CLEAR:
        LD A,03H
        LD (TVC_PALETTE_ID_RUN),A
        JP 602CH

; B1F7H constructs the hidden-movement interstitial. Give that temporary
; screen its cyan/yellow/magenta profile before tail-calling the original
; clear. Every internal return to B1F7H passes through this hook. The
; 875AH unit-information clear shares the same table-preservation helper.
TVC_MOVEMENT_SCREEN_CLEAR:
        LD A,04H
        CALL TVC_BEGIN_TEMP_SCREEN_RUN
        CALL 602CH
        JR TVC_END_TEMP_SCREEN

; 875AH enters unit information by supplying attribute 46H to the original
; non-XOR clear entry at 602DH. Preserve that attribute while selecting the
; existing setup profile. Suppress the map-glyph rebuild; this screen is
; text and bars, not the resident tactical tiles.
TVC_UNIT_INFO_SCREEN_CLEAR:
        PUSH AF
        LD A,01H
        CALL TVC_BEGIN_TEMP_SCREEN_RUN
        POP AF
        CALL 602DH
TVC_END_TEMP_SCREEN:
        PUSH AF
        LD A,(TVC_TEMP_LARGE_LOADED_RUN)
        LD (TVC_LARGE_TABLE_LOADED_RUN),A
        POP AF
        RET

; Select A as the next palette and mark the large table unloaded so the
; following clear cannot recolor it. Restore the saved loaded flag with
; TVC_END_TEMP_SCREEN after that clear returns.
TVC_BEGIN_TEMP_SCREEN:
TVC_BEGIN_TEMP_SCREEN_RUN EQU TVC_SUPPORT_RUN+TVC_BEGIN_TEMP_SCREEN-TVC_SUPPORT_IMAGE
        LD (TVC_PALETTE_ID_RUN),A
        LD A,(TVC_LARGE_TABLE_LOADED_RUN)
        LD (TVC_TEMP_LARGE_LOADED_RUN),A
        XOR A
        LD (TVC_LARGE_TABLE_LOADED_RUN),A
        RET

; B1F7H returns to 5E95H immediately before normal tactical play begins.
; Apply the tactical profile now so the resident large-glyph table is rebuilt
; before the first map draw, then reproduce the overwritten XOR/store pair.
TVC_MOVEMENT_COMPLETE:
        PUSH BC
        PUSH DE
        PUSH HL
        LD A,05H
        LD (TVC_PALETTE_ID_RUN),A
        CALL TVC_APPLY_PALETTE_RUN
        POP HL
        POP DE
        POP BC
        XOR A
        LD (0B712H),A
        RET

; 8495H enters the firing display by supplying attribute 45H to the original
; non-XOR clear entry at 602DH. Preserve that attribute while selecting the
; neutral-wall/yellow-shot/cyan-crosshair profile.
TVC_FIRE_SCREEN_CLEAR:
        PUSH AF
        LD A,06H
        LD (TVC_PALETTE_ID_RUN),A
        POP AF
        JP 602DH

; 85C3H leaves the firing display through a normal clear and map redraw.
; 8875H leaves unit information the same way. Restore tactical colors
; before either operation.
TVC_FIRE_SCREEN_EXIT:
TVC_UNIT_INFO_SCREEN_EXIT:
        LD A,05H
        LD (TVC_PALETTE_ID_RUN),A
        JP 602CH

; Replacement for the original 693FH-6942H attribute-store sequence used by
; the selection highlighter. Preserve OR 40H, the attribute write, registers,
; flags, and the final HL increment, while recoloring the native TVC cell.
TVC_STORE_ATTRIBUTE_AND_REDRAW:
        OR 40H
        PUSH AF
        PUSH BC
        PUSH DE
        PUSH HL
        LD B,(HL)                ; old Spectrum attribute
        LD (HL),A
        LD E,A                   ; new Spectrum attribute
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
        CALL TVC_RECOLOR_ATTRIBUTE_CELL_RUN
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
TVC_GAME_KEYS_RUN EQU TVC_SUPPORT_RUN+TVC_GAME_KEYS-TVC_SUPPORT_IMAGE
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
        LD HL,TVC_GRAPHICS_68_NAME_RUN
        JR TVC_MULTILOAD_SELECTED
TVC_MULTILOAD_64:
        LD DE,TVC_BLOCK_64_NAME_RUN
        LD HL,TVC_GRAPHICS_64_NAME_RUN
        JR TVC_MULTILOAD_SELECTED
TVC_MULTILOAD_65:
        LD DE,TVC_BLOCK_65_NAME_RUN
        LD HL,TVC_GRAPHICS_65_NAME_RUN
        JR TVC_MULTILOAD_SELECTED
TVC_MULTILOAD_66:
        LD DE,TVC_BLOCK_66_NAME_RUN
        LD HL,TVC_GRAPHICS_66_NAME_RUN

TVC_MULTILOAD_SELECTED:
        LD (TVC_NATIVE_NAME_PTR_RUN),HL
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
        LD DE,(TVC_NATIVE_NAME_PTR_RUN)
        CALL LOAD_NATIVE_GRAPHICS
        OR A
        JP NZ,TVC_MULTILOAD_FAIL_RUN
        LD A,0FFH
        LD (TVC_LARGE_TABLE_PALETTE_RUN),A
        LD A,01H
        LD (TVC_LARGE_TABLE_LOADED_RUN),A
        CALL TVC_REBUILD_LARGE_TABLE_RUN
        XOR A
        LD (0B15BH),A           ; original success flag
        RET

TVC_MULTILOAD_FAIL:
TVC_MULTILOAD_FAIL_RUN EQU TVC_SUPPORT_RUN+TVC_MULTILOAD_FAIL-TVC_SUPPORT_IMAGE
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
TVC_BLOCK_64_NAME_RUN EQU TVC_SUPPORT_RUN+TVC_BLOCK_64_NAME-TVC_SUPPORT_IMAGE
        DB 3,"L64"
TVC_BLOCK_65_NAME:
TVC_BLOCK_65_NAME_RUN EQU TVC_SUPPORT_RUN+TVC_BLOCK_65_NAME-TVC_SUPPORT_IMAGE
        DB 3,"L65"
TVC_BLOCK_66_NAME:
TVC_BLOCK_66_NAME_RUN EQU TVC_SUPPORT_RUN+TVC_BLOCK_66_NAME-TVC_SUPPORT_IMAGE
        DB 3,"L66"
TVC_BLOCK_68_NAME:
TVC_BLOCK_68_NAME_RUN EQU TVC_SUPPORT_RUN+TVC_BLOCK_68_NAME-TVC_SUPPORT_IMAGE
        DB 3,"L68"
TVC_GRAPHICS_64_NAME:
TVC_GRAPHICS_64_NAME_RUN EQU TVC_SUPPORT_RUN+TVC_GRAPHICS_64_NAME-TVC_SUPPORT_IMAGE
        DB 3,"G64"
TVC_GRAPHICS_65_NAME:
TVC_GRAPHICS_65_NAME_RUN EQU TVC_SUPPORT_RUN+TVC_GRAPHICS_65_NAME-TVC_SUPPORT_IMAGE
        DB 3,"G65"
TVC_GRAPHICS_66_NAME:
TVC_GRAPHICS_66_NAME_RUN EQU TVC_SUPPORT_RUN+TVC_GRAPHICS_66_NAME-TVC_SUPPORT_IMAGE
        DB 3,"G66"
TVC_GRAPHICS_68_NAME:
TVC_GRAPHICS_68_NAME_RUN EQU TVC_SUPPORT_RUN+TVC_GRAPHICS_68_NAME-TVC_SUPPORT_IMAGE
        DB 3,"G68"
TVC_NATIVE_NAME_PTR:
TVC_NATIVE_NAME_PTR_RUN EQU TVC_SUPPORT_RUN+TVC_NATIVE_NAME_PTR-TVC_SUPPORT_IMAGE
        DW 0000H

; Palette profiles contain the four values written to ports 60H-63H.
; A selects the zero-based profile. Add new four-byte profiles here and select
; them through TVC_PALETTE_ID_RUN at the appropriate game transition.
TVC_APPLY_PALETTE:
TVC_APPLY_PALETTE_RUN EQU TVC_SUPPORT_RUN+TVC_APPLY_PALETTE-TVC_SUPPORT_IMAGE
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
        CALL TVC_BUILD_ATTRIBUTE_TABLE_RUN
        JP TVC_REBUILD_LARGE_TABLE_RUN

TVC_PALETTES:
TVC_PALETTES_RUN EQU TVC_SUPPORT_RUN+TVC_PALETTES-TVC_SUPPORT_IMAGE
        DB 00H,51H,54H,44H    ; profile 0: controls, black/cyan/yellow/red
        DB 00H,50H,54H,44H    ; profile 1: setup, black/green/yellow/red
        DB 00H,50H,51H,54H    ; profile 2: team, black/green/cyan/yellow
        DB 00H,15H,51H,54H    ; profile 3: placement, black/grey/cyan/yellow
        DB 00H,51H,54H,45H    ; profile 4: movement, black/cyan/yellow/magenta
        DB 00H,54H,50H,51H    ; profile 5: tactical, black/yellow/green/cyan
        DB 00H,15H,54H,51H    ; profile 6: firing, black/white/yellow/cyan

TVC_PALETTE_ID:
TVC_PALETTE_ID_RUN EQU TVC_SUPPORT_RUN+TVC_PALETTE_ID-TVC_SUPPORT_IMAGE
        DB 00H                 ; start with the control-screen profile

; Build 64 delta/paper byte pairs at B239H, retiring the original Spectrum
; font after its printable glyphs have been converted offline. Dynamic text
; draws can then reduce an attribute to one lookup instead of mapping colors.
TVC_BUILD_ATTRIBUTE_TABLE:
TVC_BUILD_ATTRIBUTE_TABLE_RUN EQU TVC_SUPPORT_RUN+TVC_BUILD_ATTRIBUTE_TABLE-TVC_SUPPORT_IMAGE
        XOR A
TVC_BUILD_ATTRIBUTE_NEXT:
        PUSH AF
        CALL TVC_SELECT_INK_RUN
        LD A,(TVC_INK_SLOT_RUN)
        CALL TVC_SLOT_PATTERN_RUN
        LD B,A
        LD A,(TVC_PAPER_SLOT_RUN)
        CALL TVC_SLOT_PATTERN_RUN
        LD C,A
        XOR B
        LD B,A
        POP AF
        PUSH AF
        ADD A,A
        LD E,A
        LD D,00H
        LD HL,0B239H
        ADD HL,DE
        LD (HL),B
        INC HL
        LD (HL),C
        POP AF
        INC A
        CP 40H
        JR NZ,TVC_BUILD_ATTRIBUTE_NEXT
        RET

; Scenario Gxx files arrive in descriptor order as neutral slot-3 masks. Once
; loaded, resolve all 185 entries to the current palette in one mapped pass.
; Later palette transitions repeat that pass from the pristine Spectrum source
; at E8DFH; the hot draw path therefore performs only direct native copies.
TVC_REBUILD_LARGE_TABLE:
TVC_REBUILD_LARGE_TABLE_RUN EQU TVC_SUPPORT_RUN+TVC_REBUILD_LARGE_TABLE-TVC_SUPPORT_IMAGE
        LD A,(TVC_LARGE_TABLE_LOADED_RUN)
        OR A
        RET Z
        LD A,(TVC_PALETTE_ID_RUN)
        LD C,A
        LD A,(TVC_LARGE_TABLE_PALETTE_RUN)
        CP C
        RET Z
        LD A,C
        LD (TVC_LARGE_TABLE_PALETTE_RUN),A
        LD A,(0003H)
        LD (TVC_NATIVE_MAPPER_RUN),A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        CALL TVC_REBUILD_LARGE_TABLE_MAPPED_RUN
        LD A,(TVC_NATIVE_MAPPER_RUN)
        LD (0003H),A
        OUT (02H),A
        RET

; Replacement for the hardware-specific body at 602DH. The retired Spectrum
; bitmap area now holds native glyph data, so preserve only the game's 768-byte
; attribute state and clear VID0 directly.
TVC_CLEAR_SCREEN:
        PUSH AF
        LD HL,5AFFH
        LD DE,5AFEH
        LD BC,02FFH
        LD (HL),A
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
        LD BC,2FFFH
        LD (HL),00H             ; all current screen clears use paper black
        LDIR                    ; clear 12 KiB; preserve hidden native assets
        POP AF
        LD (0003H),A
        OUT (02H),A             ; restore U2 while leaving U3 mapped
        LD A,(TVC_PALETTE_ID_RUN)
        CALL TVC_APPLY_PALETTE_RUN
        POP AF                  ; original clear preserved its input attribute
        RET

; Input A is a Spectrum attribute. Select GRAPHICS 4 slots for both ink and
; paper through the active profile's eight-entry color map. This preserves
; reverse-video attributes such as 70H (black ink on bright-yellow paper).
TVC_SELECT_INK:
TVC_SELECT_INK_RUN EQU TVC_SUPPORT_RUN+TVC_SELECT_INK-TVC_SUPPORT_IMAGE
        PUSH AF
        AND 07H
        CALL TVC_MAP_COLOR_RUN
        LD (TVC_INK_SLOT_RUN),A
        POP AF
        RRCA
        RRCA
        RRCA
        AND 07H
        CALL TVC_MAP_COLOR_RUN
        LD (TVC_PAPER_SLOT_RUN),A
        OR A
        RET Z                   ; black paper needs no collision fallback
        LD C,A
        LD A,(TVC_INK_SLOT_RUN)
        CP C
        RET NZ
        XOR A
        LD (TVC_INK_SLOT_RUN),A  ; same non-black slot: use black ink
        RET

; Input A is a Spectrum color index 0-7. Output A is the active profile's
; GRAPHICS 4 palette slot.
TVC_MAP_COLOR:
TVC_MAP_COLOR_RUN EQU TVC_SUPPORT_RUN+TVC_MAP_COLOR-TVC_SUPPORT_IMAGE
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
TVC_INK_PALETTE_MAPS_RUN EQU TVC_SUPPORT_RUN+TVC_INK_PALETTE_MAPS-TVC_SUPPORT_IMAGE
        ; Spectrum inks: black, blue, red, magenta, green, cyan, yellow, white
        DB 00H,01H,03H,03H,01H,01H,02H,02H ; profile 0: cyan/yellow/red
        DB 00H,01H,03H,03H,01H,01H,02H,02H ; profile 1: green/yellow/red
        DB 00H,02H,03H,02H,01H,02H,03H,02H ; profile 2: white -> cyan
        DB 00H,02H,03H,03H,01H,02H,03H,01H ; profile 3: cyan/yellow teams
        DB 00H,01H,03H,03H,01H,01H,02H,02H ; profile 4: movement accents
        DB 00H,02H,01H,01H,02H,03H,01H,01H ; profile 5: blue floors -> green
        DB 00H,03H,01H,01H,01H,03H,02H,01H ; profile 6: firing markers

; Convert a GRAPHICS 4 palette slot to the byte pattern for four pixels.
; Input A = slot 0-3, output A = 00H/F0H/0FH/FFH.
TVC_SLOT_PATTERN:
TVC_SLOT_PATTERN_RUN EQU TVC_SUPPORT_RUN+TVC_SLOT_PATTERN-TVC_SUPPORT_IMAGE
        LD E,A
        LD D,00H
        LD HL,TVC_SLOT_PATTERNS_RUN
        ADD HL,DE
        LD A,(HL)
        RET
TVC_SLOT_PATTERNS:
TVC_SLOT_PATTERNS_RUN EQU TVC_SUPPORT_RUN+TVC_SLOT_PATTERNS-TVC_SUPPORT_IMAGE
        DB 00H,0F0H,0FH,0FFH

; Prepare the native color pair for one attribute. Native assets store set
; pixels as slot 3 and clear pixels as slot 0. The final byte is paper XOR
; (mask AND (ink XOR paper)).
TVC_PREPARE_NATIVE_COLOR:
TVC_PREPARE_NATIVE_COLOR_RUN EQU TVC_SUPPORT_RUN+TVC_PREPARE_NATIVE_COLOR-TVC_SUPPORT_IMAGE
        AND 3FH
        ADD A,A
        LD E,A
        LD D,00H
        LD HL,0B239H
        ADD HL,DE
        LD A,(HL)
        LD (TVC_COPY_SAFE_AND_1_RUN+1),A
        LD (TVC_COPY_SAFE_AND_2_RUN+1),A
        INC HL
        LD A,(HL)
        LD (TVC_COPY_SAFE_XOR_1_RUN+1),A
        LD (TVC_COPY_SAFE_XOR_2_RUN+1),A
        RET

; Input A = character row, C = byte column. Output HL = 5800H attribute.
TVC_ATTRIBUTE_DEST:
TVC_ATTRIBUTE_DEST_RUN EQU TVC_SUPPORT_RUN+TVC_ATTRIBUTE_DEST-TVC_SUPPORT_IMAGE
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        LD E,C
        LD D,00H
        ADD HL,DE
        LD DE,5800H
        ADD HL,DE
        RET

; Input A = character row, C = byte column. Output DE = VID0 cell address.
TVC_VIDEO_DEST:
TVC_VIDEO_DEST_RUN EQU TVC_SUPPORT_RUN+TVC_VIDEO_DEST-TVC_SUPPORT_IMAGE
        ADD A,A
        ADD A,80H
        LD D,A
        LD A,C
        ADD A,A
        LD E,A
        RET

; Register-only mapped entry used by the four-quadrant renderer.
; Input HL=source, A=row, C=column.
TVC_DRAW_NATIVE_AT:
TVC_DRAW_NATIVE_AT_RUN EQU TVC_SUPPORT_RUN+TVC_DRAW_NATIVE_AT-TVC_SUPPORT_IMAGE
        CALL TVC_VIDEO_DEST_RUN
        JP TVC_COPY_NATIVE_SELECTED_RUN

; Input A is the original character code. Printable codes 20H-7FH were
; converted offline into the loader-resident TVC_NATIVE_FONT table.
TVC_DRAW_NORMAL:
        PUSH HL
        PUSH DE
        PUSH AF
        PUSH BC
        SUB 20H
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        PUSH HL
        LD HL,(5CFEH)
        LD A,L
        LD C,H
        CALL TVC_ATTRIBUTE_DEST_RUN
        LD A,(5D00H)
        LD (HL),A
        LD C,A
        AND 38H
        JR NZ,TVC_DRAW_NORMAL_PREPARE_MASK
        LD A,C
        AND 3FH
        ADD A,A
        LD E,A
        LD D,00H
        LD HL,0B239H
        ADD HL,DE
        LD A,(HL)
        CP 0F0H
        JR Z,TVC_DRAW_NORMAL_SLOT1_PREPARED
        CP 0FH
        JR Z,TVC_DRAW_NORMAL_SLOT2_PREPARED
        CP 0FFH
        JR Z,TVC_DRAW_NORMAL_SLOT3_PREPARED
TVC_DRAW_NORMAL_PREPARE_MASK:
        LD A,C
        CALL TVC_PREPARE_NATIVE_COLOR_RUN
        XOR A
        JR TVC_DRAW_NORMAL_COLOR_READY
TVC_DRAW_NORMAL_SLOT1_PREPARED:
        LD A,01H
        JR TVC_DRAW_NORMAL_COLOR_READY
TVC_DRAW_NORMAL_SLOT2_PREPARED:
        LD A,02H
        JR TVC_DRAW_NORMAL_COLOR_READY
TVC_DRAW_NORMAL_SLOT3_PREPARED:
        LD A,03H
TVC_DRAW_NORMAL_COLOR_READY:
        LD C,A
        LD A,(0003H)
        LD (TVC_NATIVE_MAPPER_RUN),A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        POP HL
        LD A,C
        OR A
        JR Z,TVC_DRAW_NORMAL_MASK_SOURCE
        DEC A
        JR NZ,TVC_DRAW_NORMAL_SLOT2
        LD DE,TVC_NATIVE_FONT_SLOT1_RUN
        JR TVC_DRAW_NORMAL_DIRECT_SOURCE
TVC_DRAW_NORMAL_SLOT2:
        DEC A
        JR NZ,TVC_DRAW_NORMAL_SLOT3
        LD DE,TVC_NATIVE_FONT_SLOT2_RUN
        JR TVC_DRAW_NORMAL_DIRECT_SOURCE
TVC_DRAW_NORMAL_SLOT3:
        LD DE,TVC_NATIVE_FONT
        JR TVC_DRAW_NORMAL_DIRECT_SOURCE
TVC_DRAW_NORMAL_DIRECT_SOURCE:
        ADD HL,DE
        LD DE,(5CFEH)
        LD A,E
        LD C,D
        CALL TVC_VIDEO_DEST_RUN
        CALL TVC_COPY_NATIVE_DIRECT_RUN
        JR TVC_DRAW_NORMAL_RESTORE
TVC_DRAW_NORMAL_MASK_SOURCE:
        LD DE,TVC_NATIVE_FONT
        ADD HL,DE
        LD DE,(5CFEH)
        LD A,E
        LD C,D
        CALL TVC_VIDEO_DEST_RUN
        CALL TVC_COPY_NATIVE_CELL_RUN
TVC_DRAW_NORMAL_RESTORE:
        LD A,(TVC_NATIVE_MAPPER_RUN)
        LD (0003H),A
        OUT (02H),A
        POP BC
        LD B,00H
        POP AF
        POP DE
        POP HL
        RET

; Draw four native source rows twice each. Inputs and mapper behavior match
; TVC_DRAW_NATIVE_CELL, but the 8-row font becomes one double-height cell.
TVC_DRAW_NATIVE_HALF_DOUBLE:
TVC_DRAW_NATIVE_HALF_DOUBLE_RUN EQU TVC_SUPPORT_RUN+TVC_DRAW_NATIVE_HALF_DOUBLE-TVC_SUPPORT_IMAGE
        LD (TVC_NATIVE_SOURCE_PTR_RUN),HL
        LD (TVC_NATIVE_ROW_RUN),A
        LD A,C
        LD (TVC_NATIVE_COLUMN_RUN),A
        LD A,(TVC_NATIVE_ROW_RUN)
        CALL TVC_ATTRIBUTE_DEST_RUN
        LD A,(HL)
        CALL TVC_PREPARE_NATIVE_COLOR_RUN
        LD A,(0003H)
        LD (TVC_NATIVE_MAPPER_RUN),A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        LD HL,(TVC_NATIVE_SOURCE_PTR_RUN)
        LD A,(TVC_NATIVE_COLUMN_RUN)
        LD C,A
        LD A,(TVC_NATIVE_ROW_RUN)
        CALL TVC_VIDEO_DEST_RUN
        LD B,04H
TVC_COPY_DOUBLE_ROW:
        LD A,(HL)
        CALL TVC_COLOR_NATIVE_BYTE_RUN
        LD (TVC_NATIVE_BYTE_1_RUN),A
        INC HL
        LD A,(HL)
        CALL TVC_COLOR_NATIVE_BYTE_RUN
        LD (TVC_NATIVE_BYTE_2_RUN),A
        INC HL
        PUSH HL
        CALL TVC_WRITE_DOUBLE_ROW_RUN
        POP HL
        DJNZ TVC_COPY_DOUBLE_ROW
        LD A,(TVC_NATIVE_MAPPER_RUN)
        LD (0003H),A
        OUT (02H),A
        RET

TVC_COLOR_NATIVE_BYTE:
TVC_COLOR_NATIVE_BYTE_RUN EQU TVC_SUPPORT_RUN+TVC_COLOR_NATIVE_BYTE-TVC_SUPPORT_IMAGE
        LD C,A
        LD A,(TVC_COPY_SAFE_AND_1_RUN+1)
        AND C
        LD C,A
        LD A,(TVC_COPY_SAFE_XOR_1_RUN+1)
        XOR C
        RET

; DE addresses the first byte of a raster. Write the saved pair twice and
; advance DE to the following source row (two TVC rasters later).
TVC_WRITE_DOUBLE_ROW:
TVC_WRITE_DOUBLE_ROW_RUN EQU TVC_SUPPORT_RUN+TVC_WRITE_DOUBLE_ROW-TVC_SUPPORT_IMAGE
        LD A,(TVC_NATIVE_BYTE_1_RUN)
        LD (DE),A
        INC DE
        LD A,(TVC_NATIVE_BYTE_2_RUN)
        LD (DE),A
        LD A,E
        ADD A,3FH
        LD E,A
        JR NC,TVC_WRITE_DOUBLE_SECOND
        INC D
TVC_WRITE_DOUBLE_SECOND:
        LD A,(TVC_NATIVE_BYTE_1_RUN)
        LD (DE),A
        INC DE
        LD A,(TVC_NATIVE_BYTE_2_RUN)
        LD (DE),A
        LD A,E
        ADD A,3FH
        LD E,A
        RET NC
        INC D
        RET

TVC_DRAW_DOUBLE:
        PUSH HL
        PUSH DE
        PUSH BC
        PUSH AF
        SUB 20H
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        LD DE,TVC_NATIVE_FONT
        ADD HL,DE
        LD (TVC_NATIVE_SOURCE_PTR_RUN),HL
        LD DE,(5CFEH)
        LD A,E
        LD C,D
        CALL TVC_ATTRIBUTE_DEST_RUN
        LD A,(5D00H)
        LD (HL),A
        LD DE,(5CFEH)
        LD A,E
        INC A
        LD C,D
        CALL TVC_ATTRIBUTE_DEST_RUN
        LD A,(5D01H)
        LD (HL),A
        LD HL,(TVC_NATIVE_SOURCE_PTR_RUN)
        LD DE,(5CFEH)
        LD A,E
        LD C,D
        CALL TVC_DRAW_NATIVE_HALF_DOUBLE_RUN
        LD HL,(TVC_NATIVE_SOURCE_PTR_RUN)
        LD DE,0008H
        ADD HL,DE
        LD DE,(5CFEH)
        LD A,E
        INC A
        LD C,D
        CALL TVC_DRAW_NATIVE_HALF_DOUBLE_RUN
        POP AF
        POP BC
        POP DE
        POP HL
        RET

; All 185 scenario-specific large descriptors are converted offline. Entries
; 0-88 live in U0 at 2880H and entries 89-184 in U1 at 4000H.
; The original 612AH 11-by-11 map loop runs entirely from U1 and reads its map
; and descriptor data from U3. Cache the U2-resident descriptor pointer, map
; VID0 once, then let the original loop call the hidden mapped-only renderer.
TVC_DRAW_LARGE_GRID:
TVC_DRAW_LARGE_GRID_RUN EQU TVC_SUPPORT_RUN+TVC_DRAW_LARGE_GRID-TVC_SUPPORT_IMAGE
        XOR A
        LD (0B715H),A
        LD DE,(0B716H)
        LD (TVC_LARGE_DESCRIPTOR_PTR_RUN),DE
        LD A,(0003H)
        LD (TVC_NATIVE_MAPPER_RUN),A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        CALL 612EH
        LD A,(TVC_NATIVE_MAPPER_RUN)
        LD (0003H),A
        OUT (02H),A
        RET

TVC_DRAW_LARGE:
        LD (TVC_RAW_LARGE_GLYPH_RUN),A
        LD A,(0003H)
        LD (TVC_NATIVE_MAPPER_RUN),A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        LD A,(TVC_RAW_LARGE_GLYPH_RUN)
        CALL TVC_CONVERT_RAW_LARGE_MAPPED_RUN
        LD HL,TVC_LARGE_NATIVE_SCRATCH_RUN
        CALL TVC_DRAW_LARGE_SOURCE_MAPPED_RUN
        LD A,(TVC_NATIVE_MAPPER_RUN)
        LD (0003H),A
        OUT (02H),A
        RET

; Native replacement for the common 844CH Spectrum pixel plotter. It keeps
; the original logical collision byte at 5DA5H and applies set/clear/XOR to
; the mapped ink/paper slots of the destination attribute cell.
TVC_PLOT_PIXEL:
        LD DE,(5DA3H)
        LD HL,0808H
        ADD HL,DE
        ; Original coordinates are L=Y, H=X after the 8-pixel inset.
        LD A,H
        LD (TVC_PIXEL_X_RUN),A
        LD A,L
        LD (TVC_PIXEL_Y_RUN),A
        LD A,H
        AND 07H
        INC A
        LD B,A
        XOR A
        SCF
TVC_PLOT_SPECTRUM_MASK:
        RRA
        DJNZ TVC_PLOT_SPECTRUM_MASK
        LD (TVC_PIXEL_SPECTRUM_MASK_RUN),A

        LD A,(TVC_PIXEL_X_RUN)
        RRCA
        RRCA
        RRCA
        AND 1FH
        LD C,A
        LD A,(TVC_PIXEL_Y_RUN)
        RRCA
        RRCA
        RRCA
        AND 1FH
        CALL TVC_ATTRIBUTE_DEST_RUN
        LD A,(HL)
        CALL TVC_SELECT_INK_RUN

        LD A,(0003H)
        LD (TVC_NATIVE_MAPPER_RUN),A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        LD A,(TVC_PIXEL_Y_RUN)
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        LD A,(TVC_PIXEL_X_RUN)
        RRCA
        RRCA
        AND 3FH
        LD E,A
        LD D,00H
        ADD HL,DE
        LD DE,8000H
        ADD HL,DE
        LD (TVC_PIXEL_ADDRESS_RUN),HL

        LD A,(TVC_PIXEL_X_RUN)
        AND 03H
        INC A
        LD B,A
        LD A,11H               ; first RRCA gives 88H, then 44H/22H/11H
TVC_PLOT_TVC_MASK:
        RRCA
        DJNZ TVC_PLOT_TVC_MASK
        LD (TVC_PIXEL_PLANES_MASK_RUN),A

        LD HL,(TVC_PIXEL_ADDRESS_RUN)
        LD A,(HL)
        LD (TVC_PIXEL_OLD_BYTE_RUN),A
        CALL TVC_PIXEL_CURRENT_SLOT_RUN
        LD C,A
        LD A,(TVC_INK_SLOT_RUN)
        CP C
        JR NZ,TVC_PLOT_NOT_INK
        LD A,(TVC_PIXEL_SPECTRUM_MASK_RUN)
        JR TVC_PLOT_COLLISION
TVC_PLOT_NOT_INK:
        XOR A
TVC_PLOT_COLLISION:
        LD B,A
        LD A,(5DA6H)
        OR A
        JR Z,TVC_PLOT_SET
        CP 01H
        JR Z,TVC_PLOT_CLEAR
        LD A,C
        LD C,A
        LD A,(TVC_INK_SLOT_RUN)
        CP C
        JR Z,TVC_PLOT_CLEAR
TVC_PLOT_SET:
        LD A,(TVC_INK_SLOT_RUN)
        JR TVC_PLOT_WRITE
TVC_PLOT_CLEAR:
        LD A,(TVC_PAPER_SLOT_RUN)
TVC_PLOT_WRITE:
        CALL TVC_PIXEL_WRITE_SLOT_RUN
        LD A,(5DA6H)
        OR A
        JR NZ,TVC_PLOT_RESTORE
        LD A,B
        LD (5DA5H),A
TVC_PLOT_RESTORE:
        LD HL,(TVC_PIXEL_ADDRESS_RUN)
        LD A,(HL)               ; match the original updated-byte return
        PUSH AF
        LD A,(TVC_NATIVE_MAPPER_RUN)
        LD (0003H),A
        OUT (02H),A
        POP AF
        RET

; Return the current GRAPHICS 4 slot for the selected pixel in A.
TVC_PIXEL_CURRENT_SLOT:
TVC_PIXEL_CURRENT_SLOT_RUN EQU TVC_SUPPORT_RUN+TVC_PIXEL_CURRENT_SLOT-TVC_SUPPORT_IMAGE
        LD A,(TVC_PIXEL_PLANES_MASK_RUN)
        LD C,A
        AND 0F0H
        LD B,A
        LD A,(TVC_PIXEL_OLD_BYTE_RUN)
        AND B
        JR Z,TVC_PIXEL_NO_BIT_0
        LD E,01H
        JR TVC_PIXEL_BIT_1
TVC_PIXEL_NO_BIT_0:
        LD E,00H
TVC_PIXEL_BIT_1:
        LD A,C
        AND 0FH
        LD B,A
        LD A,(TVC_PIXEL_OLD_BYTE_RUN)
        AND B
        JR Z,TVC_PIXEL_SLOT_DONE
        SET 1,E
TVC_PIXEL_SLOT_DONE:
        LD A,E
        RET

; Input A = target slot. Replace only the selected pixel in the VID0 byte.
TVC_PIXEL_WRITE_SLOT:
TVC_PIXEL_WRITE_SLOT_RUN EQU TVC_SUPPORT_RUN+TVC_PIXEL_WRITE_SLOT-TVC_SUPPORT_IMAGE
        LD E,A
        LD A,(TVC_PIXEL_PLANES_MASK_RUN)
        CPL
        LD C,A
        LD A,(TVC_PIXEL_OLD_BYTE_RUN)
        AND C
        LD C,A
        LD A,E
        BIT 0,A
        JR Z,TVC_PIXEL_WRITE_BIT_1
        LD A,(TVC_PIXEL_PLANES_MASK_RUN)
        AND 0F0H
        OR C
        LD C,A
TVC_PIXEL_WRITE_BIT_1:
        LD A,E
        BIT 1,A
        JR Z,TVC_PIXEL_WRITE_DONE
        LD A,(TVC_PIXEL_PLANES_MASK_RUN)
        AND 0FH
        OR C
        LD C,A
TVC_PIXEL_WRITE_DONE:
        LD HL,(TVC_PIXEL_ADDRESS_RUN)
        LD (HL),C
        RET

; Recolor one cell after the game changes only its Spectrum attribute. Input
; A=row, C=column, B=old attribute, E=new attribute.
TVC_RECOLOR_ATTRIBUTE_CELL:
TVC_RECOLOR_ATTRIBUTE_CELL_RUN EQU TVC_SUPPORT_RUN+TVC_RECOLOR_ATTRIBUTE_CELL-TVC_SUPPORT_IMAGE
        LD (TVC_NATIVE_ROW_RUN),A
        LD A,C
        LD (TVC_NATIVE_COLUMN_RUN),A
        LD A,E
        LD (TVC_RECOLOR_NEW_ATTRIBUTE_RUN),A
        LD A,B
        CALL TVC_SELECT_INK_RUN
        LD A,(TVC_INK_SLOT_RUN)
        LD (TVC_OLD_INK_SLOT_RUN),A
        LD A,(TVC_PAPER_SLOT_RUN)
        LD (TVC_OLD_PAPER_SLOT_RUN),A
        LD A,(TVC_RECOLOR_NEW_ATTRIBUTE_RUN)
        CALL TVC_SELECT_INK_RUN
        LD A,(TVC_INK_SLOT_RUN)
        LD C,A
        LD A,(TVC_OLD_PAPER_SLOT_RUN)
        CP C
        JR NZ,TVC_RECOLOR_NO_SWAP
        LD A,(TVC_PAPER_SLOT_RUN)
        LD C,A
        LD A,(TVC_OLD_INK_SLOT_RUN)
        CP C
        JR NZ,TVC_RECOLOR_NO_SWAP
        CALL TVC_SLOT_PATTERN_RUN
        LD C,A
        LD A,(TVC_OLD_PAPER_SLOT_RUN)
        CALL TVC_SLOT_PATTERN_RUN
        XOR C
        JR TVC_RECOLOR_SET_XOR
TVC_RECOLOR_NO_SWAP:
        XOR A                    ; collision fallback keeps the rendered pair
TVC_RECOLOR_SET_XOR:
        LD (TVC_RECOLOR_DELTA_RUN),A
        LD A,(0003H)
        LD (TVC_NATIVE_MAPPER_RUN),A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        LD A,(TVC_NATIVE_COLUMN_RUN)
        LD C,A
        LD A,(TVC_NATIVE_ROW_RUN)
        CALL TVC_VIDEO_DEST_RUN
        EX DE,HL
        LD A,(TVC_RECOLOR_DELTA_RUN)
        LD C,A
        LD B,08H
TVC_RECOLOR_ROW:
        LD A,(HL)
        XOR C
        LD (HL),A
        INC HL
        LD A,(HL)
        XOR C
        LD (HL),A
        LD A,L
        ADD A,3FH
        LD L,A
        JR NC,TVC_RECOLOR_NEXT
        INC H
TVC_RECOLOR_NEXT:
        DJNZ TVC_RECOLOR_ROW
        LD A,(TVC_NATIVE_MAPPER_RUN)
        LD (0003H),A
        OUT (02H),A
        RET

; Proven looped fallback for paper/inverse attributes and large graphics.
; Precolored black-paper fonts bypass this through the hidden direct copier.
TVC_COPY_NATIVE_CELL_SAFE:
TVC_COPY_NATIVE_CELL_RUN EQU TVC_SUPPORT_RUN+TVC_COPY_NATIVE_CELL_SAFE-TVC_SUPPORT_IMAGE
        LD B,08H
TVC_COPY_SAFE_ROW:
        LD A,(HL)
TVC_COPY_SAFE_AND_1:
TVC_COPY_SAFE_AND_1_RUN EQU TVC_SUPPORT_RUN+TVC_COPY_SAFE_AND_1-TVC_SUPPORT_IMAGE
        AND 00H
TVC_COPY_SAFE_XOR_1:
TVC_COPY_SAFE_XOR_1_RUN EQU TVC_SUPPORT_RUN+TVC_COPY_SAFE_XOR_1-TVC_SUPPORT_IMAGE
        XOR 00H
        LD (DE),A
        INC HL
        INC DE
        LD A,(HL)
TVC_COPY_SAFE_AND_2:
TVC_COPY_SAFE_AND_2_RUN EQU TVC_SUPPORT_RUN+TVC_COPY_SAFE_AND_2-TVC_SUPPORT_IMAGE
        AND 00H
TVC_COPY_SAFE_XOR_2:
TVC_COPY_SAFE_XOR_2_RUN EQU TVC_SUPPORT_RUN+TVC_COPY_SAFE_XOR_2-TVC_SUPPORT_IMAGE
        XOR 00H
        LD (DE),A
        INC HL
        LD A,E
        ADD A,3FH
        LD E,A
        JR NC,TVC_COPY_SAFE_NEXT
        INC D
TVC_COPY_SAFE_NEXT:
        DJNZ TVC_COPY_SAFE_ROW
        RET

; Writable state kept inside the relocated support image. The native large
; table begins at 2880H; the build rejects any overlap.
TVC_INK_SLOT:
TVC_INK_SLOT_RUN EQU TVC_SUPPORT_RUN+TVC_INK_SLOT-TVC_SUPPORT_IMAGE
        DB 00H
TVC_PAPER_SLOT:
TVC_PAPER_SLOT_RUN EQU TVC_SUPPORT_RUN+TVC_PAPER_SLOT-TVC_SUPPORT_IMAGE
        DB 00H
TVC_NATIVE_SOURCE_PTR:
TVC_NATIVE_SOURCE_PTR_RUN EQU TVC_SUPPORT_RUN+TVC_NATIVE_SOURCE_PTR-TVC_SUPPORT_IMAGE
        DW 0000H
TVC_LARGE_SOURCE_PTR:
TVC_LARGE_SOURCE_PTR_RUN EQU TVC_SUPPORT_RUN+TVC_LARGE_SOURCE_PTR-TVC_SUPPORT_IMAGE
        DW 0000H
TVC_LARGE_DESCRIPTOR_PTR:
TVC_LARGE_DESCRIPTOR_PTR_RUN EQU TVC_SUPPORT_RUN+TVC_LARGE_DESCRIPTOR_PTR-TVC_SUPPORT_IMAGE
        DW 0000H
TVC_LARGE_TABLE_LOADED:
TVC_LARGE_TABLE_LOADED_RUN EQU TVC_SUPPORT_RUN+TVC_LARGE_TABLE_LOADED-TVC_SUPPORT_IMAGE
        DB 00H
TVC_TEMP_LARGE_LOADED:
TVC_TEMP_LARGE_LOADED_RUN EQU TVC_SUPPORT_RUN+TVC_TEMP_LARGE_LOADED-TVC_SUPPORT_IMAGE
        DB 00H
TVC_LARGE_TABLE_PALETTE:
TVC_LARGE_TABLE_PALETTE_RUN EQU TVC_SUPPORT_RUN+TVC_LARGE_TABLE_PALETTE-TVC_SUPPORT_IMAGE
        DB 0FFH
TVC_RAW_LARGE_GLYPH:
TVC_RAW_LARGE_GLYPH_RUN EQU TVC_SUPPORT_RUN+TVC_RAW_LARGE_GLYPH-TVC_SUPPORT_IMAGE
        DB 00H
TVC_LARGE_CONVERT_DEST:
TVC_LARGE_CONVERT_DEST_RUN EQU TVC_SUPPORT_RUN+TVC_LARGE_CONVERT_DEST-TVC_SUPPORT_IMAGE
        DW 0000H
TVC_NATIVE_ROW:
TVC_NATIVE_ROW_RUN EQU TVC_SUPPORT_RUN+TVC_NATIVE_ROW-TVC_SUPPORT_IMAGE
        DB 00H
TVC_NATIVE_COLUMN:
TVC_NATIVE_COLUMN_RUN EQU TVC_SUPPORT_RUN+TVC_NATIVE_COLUMN-TVC_SUPPORT_IMAGE
        DB 00H
TVC_NATIVE_MAPPER:
TVC_NATIVE_MAPPER_RUN EQU TVC_SUPPORT_RUN+TVC_NATIVE_MAPPER-TVC_SUPPORT_IMAGE
        DB 00H
TVC_NATIVE_BYTE_1:
TVC_NATIVE_BYTE_1_RUN EQU TVC_SUPPORT_RUN+TVC_NATIVE_BYTE_1-TVC_SUPPORT_IMAGE
        DB 00H
TVC_NATIVE_BYTE_2:
TVC_NATIVE_BYTE_2_RUN EQU TVC_SUPPORT_RUN+TVC_NATIVE_BYTE_2-TVC_SUPPORT_IMAGE
        DB 00H
TVC_PIXEL_X:
TVC_PIXEL_X_RUN EQU TVC_SUPPORT_RUN+TVC_PIXEL_X-TVC_SUPPORT_IMAGE
        DB 00H
TVC_PIXEL_Y:
TVC_PIXEL_Y_RUN EQU TVC_SUPPORT_RUN+TVC_PIXEL_Y-TVC_SUPPORT_IMAGE
        DB 00H
TVC_PIXEL_SPECTRUM_MASK:
TVC_PIXEL_SPECTRUM_MASK_RUN EQU TVC_SUPPORT_RUN+TVC_PIXEL_SPECTRUM_MASK-TVC_SUPPORT_IMAGE
        DB 00H
TVC_PIXEL_PLANES_MASK:
TVC_PIXEL_PLANES_MASK_RUN EQU TVC_SUPPORT_RUN+TVC_PIXEL_PLANES_MASK-TVC_SUPPORT_IMAGE
        DB 00H
TVC_PIXEL_OLD_BYTE:
TVC_PIXEL_OLD_BYTE_RUN EQU TVC_SUPPORT_RUN+TVC_PIXEL_OLD_BYTE-TVC_SUPPORT_IMAGE
        DB 00H
TVC_PIXEL_ADDRESS:
TVC_PIXEL_ADDRESS_RUN EQU TVC_SUPPORT_RUN+TVC_PIXEL_ADDRESS-TVC_SUPPORT_IMAGE
        DW 0000H
TVC_OLD_INK_SLOT:
TVC_OLD_INK_SLOT_RUN EQU TVC_SUPPORT_RUN+TVC_OLD_INK_SLOT-TVC_SUPPORT_IMAGE
        DB 00H
TVC_OLD_PAPER_SLOT:
TVC_OLD_PAPER_SLOT_RUN EQU TVC_SUPPORT_RUN+TVC_OLD_PAPER_SLOT-TVC_SUPPORT_IMAGE
        DB 00H
TVC_RECOLOR_DELTA:
TVC_RECOLOR_DELTA_RUN EQU TVC_SUPPORT_RUN+TVC_RECOLOR_DELTA-TVC_SUPPORT_IMAGE
        DB 00H
TVC_RECOLOR_NEW_ATTRIBUTE:
TVC_RECOLOR_NEW_ATTRIBUTE_RUN EQU TVC_SUPPORT_RUN+TVC_RECOLOR_NEW_ATTRIBUTE-TVC_SUPPORT_IMAGE
        DB 00H

TVC_SUPPORT_IMAGE_END:

        ; The bootstrap copies these temporary precolored-font bytes into
        ; hidden VID0 before any VT-DOS call can reuse this U0 source range.
TVC_NATIVE_FONT_SLOT1_SOURCE:
        DEFS 0600H
TVC_NATIVE_FONT_SLOT1_SOURCE_END:
TVC_NATIVE_FONT_SLOT2_SOURCE:
        DEFS 0600H
TVC_NATIVE_FONT_SLOT2_SOURCE_END:

; Slot-3 ink on black paper and the two precolored font variants are already
; final TVC data. Keep their direct copier and selector beside those assets in
; the hidden VID0 tail, freeing scarce U0 support space.
TVC_HIDDEN_CODE_IMAGE:
TVC_COPY_NATIVE_DIRECT:
TVC_COPY_NATIVE_DIRECT_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_COPY_NATIVE_DIRECT-TVC_HIDDEN_CODE_IMAGE
        LDI
        LDI
        LD A,E
        ADD A,3EH
        LD E,A
        JR NC,TVC_COPY_DIRECT_2
        INC D
TVC_COPY_DIRECT_2:
        LDI
        LDI
        LD A,E
        ADD A,3EH
        LD E,A
        JR NC,TVC_COPY_DIRECT_3
        INC D
TVC_COPY_DIRECT_3:
        LDI
        LDI
        LD A,E
        ADD A,3EH
        LD E,A
        JR NC,TVC_COPY_DIRECT_4
        INC D
TVC_COPY_DIRECT_4:
        LDI
        LDI
        LD A,E
        ADD A,3EH
        LD E,A
        JR NC,TVC_COPY_DIRECT_5
        INC D
TVC_COPY_DIRECT_5:
        LDI
        LDI
        LD A,E
        ADD A,3EH
        LD E,A
        JR NC,TVC_COPY_DIRECT_6
        INC D
TVC_COPY_DIRECT_6:
        LDI
        LDI
        LD A,E
        ADD A,3EH
        LD E,A
        JR NC,TVC_COPY_DIRECT_7
        INC D
TVC_COPY_DIRECT_7:
        LDI
        LDI
        LD A,E
        ADD A,3EH
        LD E,A
        JR NC,TVC_COPY_DIRECT_8
        INC D
TVC_COPY_DIRECT_8:
        LDI
        LDI
        RET

; Copy one scanline-ordered 16x16 tile. HL is 64 contiguous source bytes and
; DE is the first VID0 byte. Each four-byte row advances to the next 64-byte
; TVC raster; all row control is unrolled out of the 121-tile hot path.
TVC_COPY_LARGE_SCANLINES:
TVC_COPY_LARGE_SCANLINES_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_COPY_LARGE_SCANLINES-TVC_HIDDEN_CODE_IMAGE
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_1
        INC D
TVC_COPY_LARGE_ROW_1:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_2
        INC D
TVC_COPY_LARGE_ROW_2:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_3
        INC D
TVC_COPY_LARGE_ROW_3:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_4
        INC D
TVC_COPY_LARGE_ROW_4:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_5
        INC D
TVC_COPY_LARGE_ROW_5:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_6
        INC D
TVC_COPY_LARGE_ROW_6:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_7
        INC D
TVC_COPY_LARGE_ROW_7:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_8
        INC D
TVC_COPY_LARGE_ROW_8:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_9
        INC D
TVC_COPY_LARGE_ROW_9:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_10
        INC D
TVC_COPY_LARGE_ROW_10:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_11
        INC D
TVC_COPY_LARGE_ROW_11:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_12
        INC D
TVC_COPY_LARGE_ROW_12:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_13
        INC D
TVC_COPY_LARGE_ROW_13:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_14
        INC D
TVC_COPY_LARGE_ROW_14:
        LDI
        LDI
        LDI
        LDI
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW_15
        INC D
TVC_COPY_LARGE_ROW_15:
        LDI
        LDI
        LDI
        LDI
        RET

TVC_COPY_NATIVE_SELECTED:
TVC_COPY_NATIVE_SELECTED_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_COPY_NATIVE_SELECTED-TVC_HIDDEN_CODE_IMAGE
        LD A,(TVC_COPY_SAFE_XOR_1_RUN+1)
        OR A
        JP NZ,TVC_COPY_NATIVE_CELL_RUN
        LD A,(TVC_COPY_SAFE_AND_1_RUN+1)
        CP 0FFH
        JP Z,TVC_COPY_NATIVE_DIRECT_RUN
        JP TVC_COPY_NATIVE_CELL_RUN

; Batch-only replacement for the original 616EH tile descriptor lookup. The
; scenario map's E79FH table indexes the precolored native table directly.
; Temporary descriptor tables (notably E65FH) retain a converted raw fallback.
TVC_DRAW_LARGE_LOOKUP_MAPPED:
TVC_DRAW_LARGE_LOOKUP_MAPPED_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_DRAW_LARGE_LOOKUP_MAPPED-TVC_HIDDEN_CODE_IMAGE
        PUSH AF
        LD H,00H
        LD L,A
        ADD HL,HL
        LD DE,(TVC_LARGE_DESCRIPTOR_PTR_RUN)
        ADD HL,DE
        LD A,(HL)
        LD (5D00H),A
        INC HL
        LD A,(HL)
        LD C,A
        LD HL,(TVC_LARGE_DESCRIPTOR_PTR_RUN)
        LD DE,0E79FH
        OR A
        SBC HL,DE
        JR NZ,TVC_DRAW_LARGE_LOOKUP_RAW
        POP AF
        JR TVC_DRAW_LARGE_DESCRIPTOR_MAPPED
TVC_DRAW_LARGE_LOOKUP_RAW:
        POP AF
        LD A,C
        CALL TVC_CONVERT_RAW_LARGE_MAPPED_RUN
        LD HL,TVC_LARGE_NATIVE_SCRATCH_RUN
        JR TVC_DRAW_LARGE_SOURCE_MAPPED

; A is a fixed E79FH descriptor index. Resolve its precolored native source.
TVC_DRAW_LARGE_DESCRIPTOR_MAPPED:
        CP 59H
        JR C,TVC_DRAW_LARGE_DESCRIPTOR_LOW
        SUB 59H
        LD DE,TVC_LARGE_NATIVE_HIGH_RUN
        JR TVC_DRAW_LARGE_DESCRIPTOR_ADDRESS
TVC_DRAW_LARGE_DESCRIPTOR_LOW:
        LD DE,TVC_LARGE_NATIVE_LOW_RUN
TVC_DRAW_LARGE_DESCRIPTOR_ADDRESS:
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,DE

; Draw one final-color 16x16 native source. VID0 must already be mapped.
TVC_DRAW_LARGE_SOURCE_MAPPED:
TVC_DRAW_LARGE_SOURCE_MAPPED_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_DRAW_LARGE_SOURCE_MAPPED-TVC_HIDDEN_CODE_IMAGE
        PUSH HL
        LD DE,(5CFEH)
        LD A,E
        LD C,D
        CALL TVC_ATTRIBUTE_DEST_RUN
        LD A,(5D00H)
        LD (HL),A
        INC HL
        LD (HL),A
        LD DE,0020H
        ADD HL,DE
        LD (HL),A
        DEC HL
        LD (HL),A

        POP HL
        LD DE,(5CFEH)
        LD A,E
        LD C,D
        CALL TVC_VIDEO_DEST_RUN
        JP TVC_COPY_LARGE_SCANLINES_RUN

; Convert one original Spectrum glyph to the 64-byte U0 scratch buffer using
; its current attribute. This is only for non-map callers and temporary
; descriptor tables; the main E79FH map never executes it.
TVC_CONVERT_RAW_LARGE_MAPPED:
TVC_CONVERT_RAW_LARGE_MAPPED_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_CONVERT_RAW_LARGE_MAPPED-TVC_HIDDEN_CODE_IMAGE
        LD (TVC_RAW_LARGE_GLYPH_RUN),A
        LD A,(5D00H)
        CALL TVC_SET_LARGE_CONVERT_COLOR_RUN
        LD A,(TVC_RAW_LARGE_GLYPH_RUN)
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        LD DE,0E8DFH
        ADD HL,DE
        LD DE,TVC_LARGE_NATIVE_SCRATCH_RUN
        JP TVC_CONVERT_LARGE_SOURCE_RUN

; Recreate all final-color descriptor entries from pristine E79FH/E8DFH data.
TVC_REBUILD_LARGE_TABLE_MAPPED:
TVC_REBUILD_LARGE_TABLE_MAPPED_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_REBUILD_LARGE_TABLE_MAPPED-TVC_HIDDEN_CODE_IMAGE
        LD IX,0E79FH
        LD IY,TVC_LARGE_NATIVE_LOW_RUN
        LD A,0B9H
        LD (TVC_LARGE_REBUILD_COUNT_RUN),A
TVC_REBUILD_LARGE_NEXT:
        LD A,(TVC_LARGE_REBUILD_COUNT_RUN)
        CP 60H
        JR NZ,TVC_REBUILD_LARGE_DEST_READY
        LD IY,TVC_LARGE_NATIVE_HIGH_RUN
TVC_REBUILD_LARGE_DEST_READY:
        LD A,(IX+00H)
        CALL TVC_SET_LARGE_CONVERT_COLOR_RUN
        LD A,(IX+01H)
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        LD DE,0E8DFH
        ADD HL,DE
        PUSH IY
        POP DE
        CALL TVC_CONVERT_LARGE_SOURCE_RUN
        PUSH DE
        POP IY
        INC IX
        INC IX
        LD A,(TVC_LARGE_REBUILD_COUNT_RUN)
        DEC A
        LD (TVC_LARGE_REBUILD_COUNT_RUN),A
        JR NZ,TVC_REBUILD_LARGE_NEXT
        RET

; Patch the converter's delta/paper immediates for one Spectrum attribute.
TVC_SET_LARGE_CONVERT_COLOR:
TVC_SET_LARGE_CONVERT_COLOR_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_SET_LARGE_CONVERT_COLOR-TVC_HIDDEN_CODE_IMAGE
        CALL TVC_SELECT_INK_RUN
        LD A,(TVC_INK_SLOT_RUN)
        CALL TVC_SLOT_PATTERN_RUN
        LD C,A
        LD A,(TVC_PAPER_SLOT_RUN)
        CALL TVC_SLOT_PATTERN_RUN
        LD (TVC_CONVERT_LARGE_PAPER_1_RUN+1),A
        LD (TVC_CONVERT_LARGE_PAPER_2_RUN+1),A
        XOR C
        LD (TVC_CONVERT_LARGE_DELTA_1_RUN+1),A
        LD (TVC_CONVERT_LARGE_DELTA_2_RUN+1),A
        RET

; Expand four quadrant-ordered Spectrum blocks into sixteen contiguous
; four-byte native scanlines. Input HL=Spectrum source, DE=native destination.
TVC_CONVERT_LARGE_SOURCE:
TVC_CONVERT_LARGE_SOURCE_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_CONVERT_LARGE_SOURCE-TVC_HIDDEN_CODE_IMAGE
        LD (TVC_LARGE_CONVERT_DEST_RUN),DE
        CALL TVC_CONVERT_LARGE_QUADRANT_RUN
        LD DE,(TVC_LARGE_CONVERT_DEST_RUN)
        INC DE
        INC DE
        CALL TVC_CONVERT_LARGE_QUADRANT_RUN
        LD DE,(TVC_LARGE_CONVERT_DEST_RUN)
        LD A,E
        ADD A,20H
        LD E,A
        JR NC,TVC_CONVERT_LARGE_BOTTOM_LEFT
        INC D
TVC_CONVERT_LARGE_BOTTOM_LEFT:
        CALL TVC_CONVERT_LARGE_QUADRANT_RUN
        LD DE,(TVC_LARGE_CONVERT_DEST_RUN)
        LD A,E
        ADD A,22H
        LD E,A
        JR NC,TVC_CONVERT_LARGE_BOTTOM_RIGHT
        INC D
TVC_CONVERT_LARGE_BOTTOM_RIGHT:
        CALL TVC_CONVERT_LARGE_QUADRANT_RUN
        LD DE,(TVC_LARGE_CONVERT_DEST_RUN)
        LD A,E
        ADD A,40H
        LD E,A
        RET NC
        INC D
        RET

TVC_CONVERT_LARGE_QUADRANT:
TVC_CONVERT_LARGE_QUADRANT_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_CONVERT_LARGE_QUADRANT-TVC_HIDDEN_CODE_IMAGE
        LD B,08H
TVC_CONVERT_LARGE_BYTE:
        LD A,(HL)
        INC HL
        LD C,A
        AND 0F0H
        PUSH BC
        LD B,A
        RRCA
        RRCA
        RRCA
        RRCA
        OR B
TVC_CONVERT_LARGE_DELTA_1:
TVC_CONVERT_LARGE_DELTA_1_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_CONVERT_LARGE_DELTA_1-TVC_HIDDEN_CODE_IMAGE
        AND 00H
TVC_CONVERT_LARGE_PAPER_1:
TVC_CONVERT_LARGE_PAPER_1_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_CONVERT_LARGE_PAPER_1-TVC_HIDDEN_CODE_IMAGE
        XOR 00H
        LD (DE),A
        INC DE
        LD A,C
        AND 0FH
        LD B,A
        RLCA
        RLCA
        RLCA
        RLCA
        OR B
TVC_CONVERT_LARGE_DELTA_2:
TVC_CONVERT_LARGE_DELTA_2_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_CONVERT_LARGE_DELTA_2-TVC_HIDDEN_CODE_IMAGE
        AND 00H
TVC_CONVERT_LARGE_PAPER_2:
TVC_CONVERT_LARGE_PAPER_2_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_CONVERT_LARGE_PAPER_2-TVC_HIDDEN_CODE_IMAGE
        XOR 00H
        LD (DE),A
        INC DE
        INC DE
        INC DE
        POP BC
        DJNZ TVC_CONVERT_LARGE_BYTE
        RET

TVC_LARGE_REBUILD_COUNT:
TVC_LARGE_REBUILD_COUNT_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_LARGE_REBUILD_COUNT-TVC_HIDDEN_CODE_IMAGE
        DB 00H
TVC_HIDDEN_CODE_IMAGE_END:
