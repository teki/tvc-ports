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
        ; install the hidden copy engine before VT-DOS can reuse its
        ; temporary U0 source area.
        LD A,06H
        OUT (70H),A
        LD A,30H
        OUT (71H),A
        LD A,(0003H)
        PUSH AF
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        LD HL,TVC_HIDDEN_CODE_IMAGE
        LD DE,TVC_HIDDEN_CODE_RUN
        LD BC,TVC_HIDDEN_CODE_IMAGE_END-TVC_HIDDEN_CODE_IMAGE
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

        ; The support image is resident immediately after the native font.
        ; Copy backward so a source that starts below 21BCH cannot be
        ; overwritten by the destination before it is read.
        LD HL,TVC_SUPPORT_IMAGE_END
        DEC HL
        LD DE,TVC_SUPPORT_RUN
        LD BC,TVC_SUPPORT_IMAGE_END-TVC_SUPPORT_IMAGE
        EX DE,HL
        ADD HL,BC
        DEC HL
        EX DE,HL
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
        DI                      ; title runs before the relocated DOS epilogue exists
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
        CALL TVC_END_DOS_RUN
        OR A
        RET NZ

        LD BC,0010H
        LD DE,19DFH
        LD A,(1705H)
        OR 82H
        CALL TVC_END_DOS_RUN
        OR A
        JR NZ,LOAD_NATIVE_GRAPHICS_CLOSE

        LD BC,TVC_LARGE_NATIVE_LOW_SIZE
        LD DE,TVC_LARGE_NATIVE_LOW_RUN
        LD A,(1705H)
        OR 82H
        CALL TVC_END_DOS_RUN
        OR A
        JR NZ,LOAD_NATIVE_GRAPHICS_CLOSE

        LD BC,TVC_LARGE_NATIVE_HIGH_SIZE
        LD DE,TVC_LARGE_NATIVE_HIGH_RUN
        LD A,(1705H)
        OR 82H
        CALL TVC_END_DOS_RUN

LOAD_NATIVE_GRAPHICS_CLOSE:
        PUSH AF
        LD A,(1705H)
        OR 04H
        CALL TVC_END_DOS_RUN
        POP AF
        OR A
        RET

; B15CH's original interface: A=0 save, A=1 load, A=2 verify;
; B is the tape block ID (67H is the saved game). Keep the original status
; byte at B15BH, which B1C3H checks after a load.
TVC_SAVELOAD:
        LD (0B1C2H),A
        LD C,A
        LD A,01H
        LD (0B15BH),A
        LD A,C
        OR A
        JR Z,TVC_SAVE_GAME
        CP 01H
        RET NZ                  ; original verify mode remains unsupported
        LD A,B                  ; scenario IDs stay in A for TVC_MULTILOAD
        CP 67H
        JP NZ,TVC_SUPPORT_RUN+TVC_MULTILOAD-TVC_SUPPORT_IMAGE

TVC_LOAD_SAVED:
        LD DE,TVC_SAVE_NAME
        CALL TVC_LOAD_GAME_PAYLOAD_RUN
        OR A
        RET NZ
        ; SAVE.CAS carries the original Spectrum bytes. Regenerate the native
        ; descriptor cache from E79FH/E8DFH before the game draws again.
        LD A,01H
        LD (TVC_LARGE_TABLE_LOADED_RUN),A
        LD A,0FFH
        LD (TVC_LARGE_TABLE_PALETTE_RUN),A
        CALL TVC_REBUILD_LARGE_TABLE_RUN
        XOR A
        LD (0B15BH),A
        RET

TVC_SAVE_GAME:
        CALL TVC_MAP_GAME_PAYLOAD
        LD A,50H               ; device 5, disk output
        LD (1705H),A
        XOR A
        LD (0B6BH),A           ; non-buffered access
        LD DE,TVC_SAVE_NAME
        LD A,53H               ; open for output
        CALL TVC_END_DOS_RUN
        OR A
        RET NZ

        LD HL,TVC_SAVE_HEADER
        LD B,10H
TVC_SAVE_HEADER_NEXT:
        LD C,(HL)
        PUSH BC
        PUSH HL
        LD A,51H               ; character output
        CALL TVC_END_DOS_RUN
        POP HL
        POP BC
        OR A
        JR NZ,TVC_SAVE_CLOSE
        INC HL
        DJNZ TVC_SAVE_HEADER_NEXT

        LD BC,49DFH
        LD DE,0B621H
        LD A,52H               ; block output
        CALL TVC_END_DOS_RUN
TVC_SAVE_CLOSE:
        PUSH AF
        LD A,54H               ; close output file
        CALL TVC_END_DOS_RUN
        LD C,A
        POP AF
        OR C
        RET NZ
        XOR A
        LD (0B15BH),A
        RET

TVC_MAP_GAME_PAYLOAD:
        LD A,0B0H              ; U0, U1, U2, and U3, including B621H-FFFFH
        LD (0003H),A
        OUT (02H),A
        RET

TVC_SAVE_NAME:
        DB 4,"SAVE"
TVC_SAVE_HEADER:
        DB 00H                 ; reserved application-header marker
        DB 00H                 ; data file type
        DW 49DFH              ; original payload length
        DB 00H                 ; no autorun
        DS 11,00H              ; remaining application-header fields

TVC_SUPPORT_RUN EQU 21BCH
TVC_LARGE_NATIVE_LOW_RUN EQU 2880H
TVC_LARGE_NATIVE_LOW_SIZE EQU 1640H ; 89 glyphs * 64 bytes
TVC_LARGE_NATIVE_SCRATCH_RUN EQU 3EC0H ; one converted raw-glyph fallback
TVC_LARGE_NATIVE_HIGH_RUN EQU 4000H
TVC_LARGE_NATIVE_HIGH_SIZE EQU 1800H ; 96 glyphs * 64 bytes
TVC_CONVERT_TABLE_RUN EQU 0B000H ; hidden VID0 nibble table, see TVC_SET_LARGE_CONVERT_COLOR
TVC_CONVERT_TABLE_PAGE EQU 0B0H
TVC_HIDDEN_CODE_RUN EQU 0BC00H

; Printable codes 20H-7FH from the original B139H-indexed font are converted
; offline. The build patches these reserved bytes in LOADER.CAS; they remain at
; their load address and are accessible while VID0 replaces page 2.
TVC_NATIVE_FONT:
        DEFS 0600H
TVC_NATIVE_FONT_END:

; Relocatable support copied to U0 RAM at 21BCH after LSCODE is loaded. Page 0
; remains mapped to U0 in the BASIC/game map, giving the port enough room for
; the original keyboard and graphics entry-point replacements. Keep absolute
; references inside this image limited to fixed game/TVC addresses; branches
; within the copied image are relative.
TVC_SUPPORT_IMAGE:
; TVC replacement for the hardware-specific 5E28H entry. The game needs U0,
; U1, U2, and U3 together. Firmware interrupts map SYS or the disk ROM over
; page 3, so play stays with interrupts disabled.
TVC_MAIN_ENTRY:
        DI
        LD A,0B0H
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

; Sinclair, Kempston, and Protek/AGF/cursor all return the same active-low
; action byte: bit 0 fire, bit 1 up, bit 2 down, bit 3 right, bit 4 left.
; Map those three control methods to the TVC joystick on keyboard row 8.
TVC_JOYSTICK:
        LD E,0FFH
        LD A,(0B11H)
        AND F0H
        OR 08H
        OUT (03H),A
        IN A,(58H)             ; row 8: fire/up/down/right/left
        BIT 3,A                 ; Tab/Fire
        JR NZ,TVC_JOYSTICK_UP
        RES 0,E
TVC_JOYSTICK_UP:
        BIT 1,A                 ; Up
        JR NZ,TVC_JOYSTICK_DOWN
        RES 1,E
TVC_JOYSTICK_DOWN:
        BIT 2,A                 ; Down
        JR NZ,TVC_JOYSTICK_RIGHT
        RES 2,E
TVC_JOYSTICK_RIGHT:
        BIT 5,A                 ; Right
        JR NZ,TVC_JOYSTICK_LEFT
        RES 3,E
TVC_JOYSTICK_LEFT:
        BIT 6,A                 ; Left
        JR NZ,TVC_JOYSTICK_DONE
        RES 4,E
TVC_JOYSTICK_DONE:
        LD A,E
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

; 8495H enters the firing display by supplying attribute 45H to the original
; non-XOR clear entry at 602DH. Preserve that attribute while selecting the
; neutral-wall/yellow-shot/cyan-crosshair profile. The firing view is plotted
; pixel by pixel and never draws the resident tactical tiles.
TVC_FIRE_SCREEN_CLEAR:
        PUSH AF
        LD A,06H
        JR TVC_TEMP_SCREEN_CLEAR

; 875AH enters unit information by supplying attribute 46H to the original
; non-XOR clear entry at 602DH. Preserve that attribute while selecting the
; existing setup profile. Suppress the map-glyph rebuild; this screen is
; text and bars, not the resident tactical tiles.
TVC_UNIT_INFO_SCREEN_CLEAR:
        PUSH AF
        LD A,01H
TVC_TEMP_SCREEN_CLEAR:
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

; Replacement for B15CH mode 1 scenario IDs. TVC_SAVELOAD already rejected
; save/verify and ID 67H; A and B both hold the selected block ID.
TVC_MULTILOAD:
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
        CALL TVC_LOAD_GAME_PAYLOAD_RUN
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
        LD A,0B0H               ; U0, U1, U2, U3
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
TVC_ATTRIBUTE_TABLE_PALETTE:
TVC_ATTRIBUTE_TABLE_PALETTE_RUN EQU TVC_SUPPORT_RUN+TVC_ATTRIBUTE_TABLE_PALETTE-TVC_SUPPORT_IMAGE
        DB 0FFH                ; B239H still holds the original font
TVC_CLEAR_SP:
TVC_CLEAR_SP_RUN EQU TVC_SUPPORT_RUN+TVC_CLEAR_SP-TVC_SUPPORT_IMAGE
        DW 0000H

; Build 64 delta/paper byte pairs at B239H, retiring the original Spectrum
; font after its printable glyphs have been converted offline. Dynamic text
; draws can then reduce an attribute to one lookup instead of mapping colors.
TVC_BUILD_ATTRIBUTE_TABLE:
TVC_BUILD_ATTRIBUTE_TABLE_RUN EQU TVC_SUPPORT_RUN+TVC_BUILD_ATTRIBUTE_TABLE-TVC_SUPPORT_IMAGE
        LD A,(TVC_PALETTE_ID_RUN)
        LD HL,TVC_ATTRIBUTE_TABLE_PALETTE_RUN
        CP (HL)
        RET Z
        LD (HL),A
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
        ; Play keeps interrupts disabled, so the stack can fill the displayed
        ; 12 KiB with paper black and preserve the hidden native assets.
        DI
        LD (TVC_CLEAR_SP_RUN),SP
        LD SP,0B000H
        LD HL,0000H
        LD B,00H                ; 256 passes of 48 bytes
TVC_CLEAR_FILL:
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        PUSH HL
        DJNZ TVC_CLEAR_FILL
        LD SP,(TVC_CLEAR_SP_RUN)
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

; Input L = character row, H = byte column. Output BC = 5800H attribute and
; HL = VID0 cell address. DE is preserved.
TVC_CELL_ADDRESS:
TVC_CELL_ADDRESS_RUN EQU TVC_SUPPORT_RUN+TVC_CELL_ADDRESS-TVC_SUPPORT_IMAGE
        LD A,L
        RRCA
        RRCA
        RRCA
        LD B,A
        AND 0E0H
        OR H
        LD C,A
        LD A,B
        AND 03H
        OR 58H
        LD B,A
        LD A,L
        ADD A,A
        ADD A,80H
        LD L,H
        SLA L
        LD H,A
        RET

; Input A is the original character code. Printable codes 20H-7FH were
; converted offline into the loader-resident TVC_NATIVE_FONT table. Like the
; original, preserve HL and DE, return B=0 and A=(5D00H), and keep C.
TVC_DRAW_NORMAL:
        PUSH HL
        PUSH DE
        PUSH BC
        CALL TVC_TEXT_FONT_RUN
        LD HL,(5CFEH)
        LD A,(5D00H)
        CALL TVC_TEXT_CELL_RUN
TVC_DRAW_NORMAL_ROW:
        LD A,(DE)
        AND B
        XOR C
        LD (HL),A
        INC L
        INC DE
        LD A,(DE)
        AND B
        XOR C
        LD (HL),A
        INC DE
        LD A,L                  ; next raster; the cell ends on an even page
        ADD A,3FH
        LD L,A
        JR NC,TVC_DRAW_NORMAL_ROW
        INC H
        BIT 0,H
        JR NZ,TVC_DRAW_NORMAL_ROW
        CALL TVC_TEXT_DONE_RUN
        POP BC
        LD B,00H
        LD A,(5D00H)
        POP DE
        POP HL
        RET

; Original 64F7H contract: draw one character as two cells, rows (5CFEH)
; and (5CFEH)+1, attributes (5D00H) and (5D01H); preserve all registers.
TVC_DRAW_DOUBLE:
        PUSH HL
        PUSH DE
        PUSH BC
        PUSH AF
        CALL TVC_TEXT_FONT_RUN
        LD HL,(5CFEH)
        LD A,(5D00H)
        CALL TVC_DRAW_DOUBLE_HALF_RUN
        LD HL,(5CFEH)
        INC L
        LD A,(5D01H)
        CALL TVC_DRAW_DOUBLE_HALF_RUN
        POP AF
        POP BC
        POP DE
        POP HL
        RET

; Draw four native source rows at DE twice each into one cell. Input A is
; the attribute, L the row, H the column. DE advances by eight bytes.
TVC_DRAW_DOUBLE_HALF:
TVC_DRAW_DOUBLE_HALF_RUN EQU TVC_SUPPORT_RUN+TVC_DRAW_DOUBLE_HALF-TVC_SUPPORT_IMAGE
        CALL TVC_TEXT_CELL_RUN
TVC_DRAW_DOUBLE_ROW:
        LD A,(DE)
        AND B
        XOR C
        LD (HL),A
        SET 6,L                 ; source rows start on even rasters
        LD (HL),A
        RES 6,L
        INC L
        INC DE
        LD A,(DE)
        AND B
        XOR C
        LD (HL),A
        SET 6,L
        LD (HL),A
        INC DE
        LD A,L
        ADD A,3FH
        LD L,A
        JR NC,TVC_DRAW_DOUBLE_ROW
        INC H
        BIT 0,H
        JR NZ,TVC_DRAW_DOUBLE_ROW
TVC_TEXT_DONE:
TVC_TEXT_DONE_RUN EQU TVC_SUPPORT_RUN+TVC_TEXT_DONE-TVC_SUPPORT_IMAGE
        LD A,(TVC_NATIVE_MAPPER_RUN)
        LD (0003H),A
        OUT (02H),A
        RET

; Input A = character code. Output DE = its slot-3 native font rows.
TVC_TEXT_FONT:
TVC_TEXT_FONT_RUN EQU TVC_SUPPORT_RUN+TVC_TEXT_FONT-TVC_SUPPORT_IMAGE
        SUB 20H
        LD L,A
        LD H,00H
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        ADD HL,HL
        LD DE,TVC_NATIVE_FONT
        ADD HL,DE
        EX DE,HL
        RET

; Input A = attribute, L = character row, H = byte column. Store the
; attribute, return its B239H pair as B=ink XOR paper and C=paper, return
; HL as the VID0 cell, and map VID0 into page 2.
TVC_TEXT_CELL:
TVC_TEXT_CELL_RUN EQU TVC_SUPPORT_RUN+TVC_TEXT_CELL-TVC_SUPPORT_IMAGE
        PUSH AF
        CALL TVC_CELL_ADDRESS_RUN
        POP AF
        LD (BC),A
        AND 3FH
        ADD A,A
        ADD A,39H
        LD C,A
        LD B,0B2H
        LD A,(BC)
        INC C
        PUSH AF
        LD A,(BC)
        LD C,A
        POP AF
        LD B,A
        LD A,(0003H)
        LD (TVC_NATIVE_MAPPER_RUN),A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        RET

; All 185 scenario-specific large descriptors are converted offline. Entries
; 0-88 live in U0 at 2880H and entries 89-184 in U1 at 4000H.
; The original 612AH 11-by-11 map loop runs entirely from U1 and reads its map
; and descriptor data from U3. Cache the U2-resident descriptor pointer, map
; VID0 once, then let the original loop call the hidden mapped-only renderer.
TVC_DRAW_LARGE_GRID:
        XOR A
        LD (0B715H),A
        LD HL,612EH
        JR TVC_DRAW_DESCRIPTORS

; Replacement for the original 616EH single-descriptor draw used by the
; cursor restore and the 6181H/646CH/64B0H scroll redraws. A indexes the
; table at B716H; E79FH entries come from the precolored cache.
TVC_DRAW_TILE:
        LD HL,TVC_DRAW_LARGE_LOOKUP_MAPPED_RUN
TVC_DRAW_DESCRIPTORS:
        LD DE,(0B716H)
        LD (TVC_LARGE_DESCRIPTOR_PTR_RUN),DE
        LD C,A
        LD A,(0003H)
        LD (TVC_NATIVE_MAPPER_RUN),A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        LD A,C
        CALL TVC_JP_HL_RUN
        LD A,(TVC_NATIVE_MAPPER_RUN)
        LD (0003H),A
        OUT (02H),A
        RET
TVC_JP_HL:
TVC_JP_HL_RUN EQU TVC_SUPPORT_RUN+TVC_JP_HL-TVC_SUPPORT_IMAGE
        JP (HL)

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
; the original contract: Y=(5DA3H) and X=(5DA4H) before the 0808H inset;
; mode (5DA6H) 1 clears, 2 inverts, and any other value sets and stores the
; logical collision mask at 5DA5H. A pixel is "set" when it shows the cell's
; mapped ink. Ink and paper patterns come from the cell's B239H delta/paper
; pair. A returns the updated VID0 byte; C is clobbered.
TVC_PLOT_PIXEL:
        LD DE,(5DA3H)
        LD HL,0808H
        ADD HL,DE               ; L=Y, H=X
        LD A,L                  ; attribute 5800H + (Y AND F8H)*4 + X/8
        RLCA
        RLCA
        LD E,A
        AND 03H
        OR 58H
        LD D,A
        LD A,H
        RRCA
        RRCA
        RRCA
        XOR E
        AND 1FH
        XOR E
        LD E,A
        LD A,(DE)
        AND 3FH
        ADD A,A
        ADD A,39H               ; B239H + 2*attribute stays inside B2xxH
        LD E,A
        LD D,0B2H
        LD A,(DE)               ; ink XOR paper
        INC E
        EX DE,HL
        XOR (HL)
        LD L,(HL)               ; paper pattern
        LD H,A                  ; ink pattern
        EX DE,HL                ; D=ink, E=paper, H=X, L=Y
        LD A,H                  ; B = 88H >> (X AND 3)
        RRCA
        LD A,88H
        JR NC,TVC_PLOT_MASK_BIT1
        RRCA
TVC_PLOT_MASK_BIT1:
        BIT 1,H
        JR Z,TVC_PLOT_MASK_DONE
        RRCA
        RRCA
TVC_PLOT_MASK_DONE:
        LD B,A
        LD A,L                  ; HL = 8000H + Y*64 + X/4
        RRCA
        RRCA
        LD L,A
        LD A,H
        RRCA
        RRCA
        XOR L
        AND 3FH
        XOR L
        LD H,L
        LD L,A
        LD A,H
        AND 3FH
        OR 80H
        LD H,A
        LD A,(0003H)
        LD C,A
        AND 0DFH
        LD (0003H),A
        OUT (02H),A
        LD A,(5DA6H)
        CP 01H
        JR Z,TVC_PLOT_CLEAR
        CP 02H
        JR Z,TVC_PLOT_INVERT
        LD A,(HL)
        XOR D
        AND B
        JR Z,TVC_PLOT_ALREADY_INK
        LD E,A
        XOR A
        LD (5DA5H),A
        LD A,E
        JR TVC_PLOT_WRITE
TVC_PLOT_ALREADY_INK:
        LD A,0F0H               ; L bit 0 is X bit 2: select 80H >> (X AND 7)
        BIT 0,L
        JR Z,TVC_PLOT_COLLISION
        LD A,0FH
TVC_PLOT_COLLISION:
        AND B
        LD (5DA5H),A
        LD E,(HL)
        JR TVC_PLOT_RESTORE
TVC_PLOT_INVERT:
        LD A,(HL)
        XOR D
        AND B
        JR NZ,TVC_PLOT_WRITE    ; not ink: becomes ink
TVC_PLOT_CLEAR:
        LD A,(HL)
        XOR E
        AND B
TVC_PLOT_WRITE:
        XOR (HL)
        LD (HL),A
        LD E,A
TVC_PLOT_RESTORE:
        LD A,C
        LD (0003H),A
        OUT (02H),A
        LD A,E
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
        LD HL,(TVC_NATIVE_ROW_RUN)
        CALL TVC_CELL_ADDRESS_RUN
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

; Batch-only replacement for the original 616EH tile descriptor lookup; VID0
; must already be mapped. The scenario map's E79FH table indexes the
; precolored native table directly. Temporary descriptor tables (notably
; E65FH) retain a converted raw fallback.
TVC_DRAW_LARGE_LOOKUP_MAPPED:
TVC_DRAW_LARGE_LOOKUP_MAPPED_RUN EQU TVC_SUPPORT_RUN+TVC_DRAW_LARGE_LOOKUP_MAPPED-TVC_SUPPORT_IMAGE
        LD B,A
        LD L,A
        LD H,00H
        ADD HL,HL
        LD DE,(TVC_LARGE_DESCRIPTOR_PTR_RUN)
        ADD HL,DE
        LD A,(HL)
        LD (5D00H),A
        INC HL
        LD C,(HL)
        LD HL,0E79FH
        OR A
        SBC HL,DE
        JR NZ,TVC_DRAW_LARGE_LOOKUP_RAW
        LD A,B
        LD DE,TVC_LARGE_NATIVE_LOW_RUN
        CP 59H
        JR C,TVC_DRAW_LARGE_DESCRIPTOR_LOW
        SUB 59H
        LD DE,TVC_LARGE_NATIVE_HIGH_RUN
TVC_DRAW_LARGE_DESCRIPTOR_LOW:
        RRCA                    ; HL = A*64 for A below 60H
        RRCA
        LD H,A
        AND 0C0H
        LD L,A
        XOR H
        LD H,A
        ADD HL,DE
        JR TVC_DRAW_LARGE_SOURCE_MAPPED
TVC_DRAW_LARGE_LOOKUP_RAW:
        LD A,C
        CALL TVC_CONVERT_RAW_LARGE_MAPPED_RUN
        LD HL,TVC_LARGE_NATIVE_SCRATCH_RUN

; Draw one final-color 16x16 native source at HL. VID0 must already be mapped.
TVC_DRAW_LARGE_SOURCE_MAPPED:
TVC_DRAW_LARGE_SOURCE_MAPPED_RUN EQU TVC_SUPPORT_RUN+TVC_DRAW_LARGE_SOURCE_MAPPED-TVC_SUPPORT_IMAGE
        PUSH HL
        LD HL,(5CFEH)
        CALL TVC_CELL_ADDRESS_RUN
        LD A,(5D00H)
        LD (BC),A
        INC C
        LD (BC),A
        LD A,C
        ADD A,20H
        LD C,A
        LD A,(5D00H)
        JR NC,TVC_DRAW_LARGE_LOWER_ATTRIBUTE
        INC B
TVC_DRAW_LARGE_LOWER_ATTRIBUTE:
        LD (BC),A
        DEC C
        LD (BC),A
        EX DE,HL
        POP HL

; Copy one scanline-ordered 16x16 tile. HL is 64 contiguous source bytes and
; DE is the first VID0 byte. Keep this hot loop in U0: opcode fetches from
; VID0 incur video wait states. LDI's BC count ends the tile.
TVC_COPY_LARGE_SCANLINES:
TVC_COPY_LARGE_SCANLINES_RUN EQU TVC_SUPPORT_RUN+TVC_COPY_LARGE_SCANLINES-TVC_SUPPORT_IMAGE
        LD BC,0040H
TVC_COPY_LARGE_ROW:
        LDI
        LDI
        LDI
        LDI
        RET PO
        LD A,E
        ADD A,3CH
        LD E,A
        JR NC,TVC_COPY_LARGE_ROW
        INC D
        JR TVC_COPY_LARGE_ROW

; Writable state kept inside the relocated support image. The native large
; table begins at 2880H; the build rejects any overlap.
TVC_INK_SLOT:
TVC_INK_SLOT_RUN EQU TVC_SUPPORT_RUN+TVC_INK_SLOT-TVC_SUPPORT_IMAGE
        DB 00H
TVC_PAPER_SLOT:
TVC_PAPER_SLOT_RUN EQU TVC_SUPPORT_RUN+TVC_PAPER_SLOT-TVC_SUPPORT_IMAGE
        DB 00H
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

; Read the 49DFH game payload to B621H-FFFFH. VT-DOS selects the 64K+ page-0
; alias for any transfer that reaches C000H, so every device read stays at or
; below BFFFH. The U3 half is staged at 2880H. A scenario load replaces that
; area from Gxx immediately; a saved-game load rebuilds it from E8DFH.
; Input DE is the length-prefixed filename. Output A matches LOAD_BLOCK.
TVC_LOAD_GAME_PAYLOAD:
TVC_LOAD_GAME_PAYLOAD_RUN EQU TVC_SUPPORT_RUN+TVC_LOAD_GAME_PAYLOAD-TVC_SUPPORT_IMAGE
        LD A,0B0H               ; U0, U1, U2, U3
        LD (0003H),A
        OUT (02H),A
        LD A,0D0H
        LD (1705H),A
        OR 03H
        CALL TVC_END_DOS_RUN
        OR A
        RET NZ

        LD BC,0010H
        LD DE,19DFH
        CALL TVC_READ_OPEN_BLOCK_RUN
        OR A
        JR NZ,TVC_LOAD_GAME_PAYLOAD_CLOSE

        LD BC,0C000H-0B621H     ; 09DFH, last byte BFFF
        LD DE,0B621H
        CALL TVC_READ_OPEN_BLOCK_RUN
        OR A
        JR NZ,TVC_LOAD_GAME_PAYLOAD_CLOSE

        LD DE,0C000H
TVC_LOAD_GAME_PAYLOAD_CHUNK:
        PUSH DE
        LD BC,1000H
        LD DE,TVC_LARGE_NATIVE_LOW_RUN
        CALL TVC_READ_OPEN_BLOCK_RUN
        POP HL
        OR A
        JR NZ,TVC_LOAD_GAME_PAYLOAD_CLOSE
        ; TVC_END_DOS already restored B0H, so C000H is U3 for this copy.
        LD D,H
        LD E,L
        LD HL,TVC_LARGE_NATIVE_LOW_RUN
        LD BC,1000H
        LDIR
        LD A,D
        OR E
        JR NZ,TVC_LOAD_GAME_PAYLOAD_CHUNK

TVC_LOAD_GAME_PAYLOAD_CLOSE:
        PUSH AF
        LD A,(1705H)
        OR 04H
        CALL TVC_END_DOS_RUN
        POP AF
        OR A
        RET

TVC_READ_OPEN_BLOCK:
TVC_READ_OPEN_BLOCK_RUN EQU TVC_SUPPORT_RUN+TVC_READ_OPEN_BLOCK-TVC_SUPPORT_IMAGE
        LD A,(1705H)
        OR 82H
        JP TVC_END_DOS_RUN

; VT-DOS returns with interrupts enabled. The firmware IM 1 stub then selects
; SYS or the disk ROM in page 3, and the command line can run and return to
; its caller. Laser Squad has no EI of its own. Restore U0/U1/U2/U3 and DI
; before the next game instruction fetches C000H-FFFFH.
TVC_END_DOS:
TVC_END_DOS_RUN EQU TVC_SUPPORT_RUN+TVC_END_DOS-TVC_SUPPORT_IMAGE
        CALL 001BH
        PUSH AF
        DI
        LD A,0B0H
        LD (0003H),A
        OUT (02H),A
        POP AF
        RET

TVC_SUPPORT_IMAGE_END:

; The bootstrap copies this tail into hidden VID0 before any VT-DOS call can
; reuse its U0 source range, freeing scarce U0 support space.
TVC_HIDDEN_CODE_IMAGE:

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

; Build the converter's nibble table for one Spectrum attribute. Entry n and
; entry n*16 of the B000H page hold the final byte for Spectrum nibble n:
; paper XOR ((n*11H) AND (ink XOR paper)). Skip the rebuild when the
; delta/paper pair is unchanged.
TVC_SET_LARGE_CONVERT_COLOR:
TVC_SET_LARGE_CONVERT_COLOR_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_SET_LARGE_CONVERT_COLOR-TVC_HIDDEN_CODE_IMAGE
        CALL TVC_SELECT_INK_RUN
        LD A,(TVC_INK_SLOT_RUN)
        CALL TVC_SLOT_PATTERN_RUN
        LD C,A
        LD A,(TVC_PAPER_SLOT_RUN)
        CALL TVC_SLOT_PATTERN_RUN
        LD B,A
        XOR C
        LD C,A
        LD HL,(TVC_CONVERT_PAIR_RUN)
        OR A
        SBC HL,BC
        RET Z
        LD (TVC_CONVERT_PAIR_RUN),BC
        LD D,TVC_CONVERT_TABLE_PAGE
        LD HL,TVC_CONVERT_TABLE_RUN+0FH
TVC_SET_LARGE_CONVERT_ENTRY:
TVC_SET_LARGE_CONVERT_ENTRY_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_SET_LARGE_CONVERT_ENTRY-TVC_HIDDEN_CODE_IMAGE
        LD A,L
        RLCA
        RLCA
        RLCA
        RLCA
        LD E,A
        OR L
        AND C
        XOR B
        LD (HL),A
        LD (DE),A
        DEC L
        JP P,TVC_SET_LARGE_CONVERT_ENTRY_RUN
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

; Convert eight Spectrum bytes into one quadrant column of two native bytes per
; row. DE starts inside a 64-aligned destination, so its row offsets never
; carry and the quadrant ends when the row field (E AND 1CH) wraps to zero.
TVC_CONVERT_LARGE_QUADRANT:
TVC_CONVERT_LARGE_QUADRANT_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_CONVERT_LARGE_QUADRANT-TVC_HIDDEN_CODE_IMAGE
        LD B,TVC_CONVERT_TABLE_PAGE
TVC_CONVERT_LARGE_BYTE:
        LD A,(HL)
        AND 0F0H
        LD C,A
        LD A,(BC)
        LD (DE),A
        INC E
        LD A,(HL)
        AND 0FH
        LD C,A
        LD A,(BC)
        LD (DE),A
        INC HL
        LD A,E
        ADD A,03H
        LD E,A
        AND 1CH
        JR NZ,TVC_CONVERT_LARGE_BYTE
        RET

TVC_LARGE_REBUILD_COUNT:
TVC_LARGE_REBUILD_COUNT_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_LARGE_REBUILD_COUNT-TVC_HIDDEN_CODE_IMAGE
        DB 00H
; Last delta/paper pair in the B000H table. A delta of 01H is impossible, so
; the first conversion always builds the table.
TVC_CONVERT_PAIR:
TVC_CONVERT_PAIR_RUN EQU TVC_HIDDEN_CODE_RUN+TVC_CONVERT_PAIR-TVC_HIDDEN_CODE_IMAGE
        DB 01H                  ; delta
        DB 00H                  ; paper

TVC_HIDDEN_CODE_IMAGE_END:
