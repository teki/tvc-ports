; -----------------------------------------------------------------------------
; Laser Squad LS loader block at 7530H
; Source: /tmp/lasersqd_ls_7530.bin
; ORG: 7530H
; Size: 1661 bytes
; Data ranges: 753BH-7622H, 763AH-763EH, 76DCH-76E3H, 787DH-7BADH
; Auto labels: branch and call targets are emitted as Lxxxx.
;
; This is the original Spectrum block, kept byte-for-byte. Comments distinguish
; directly observed instruction behavior from higher-level interpretation.
;
; Important state used by the script interpreter:
;   761EH      mode flags (bits are described at the routines that test them)
;   761FH-20H indexed-string/table pointer
;   7621H-22H primary script base pointer
;   763AH      current row (low byte, 0-23)
;   763BH      current byte column (high byte, 0-31)
;   763CH      saved character code for the large-glyph renderer
;   763DH      normal attribute / first large-glyph attribute
;   763EH      second large-glyph attribute
;   76DCH-DFH current pointers for the primary and indexed script streams
;   76E0H-81H line/origin coordinate
;   76E2H-83H pointer to the current control token and its parameters
; -----------------------------------------------------------------------------

ORG 7530H

; Entry used by BASIC's RANDOMIZE USR 30000. Select a black Spectrum border,
; clear bitmap and attributes, then interpret the first | delimited item.
    XOR A
    OUT (FEH),A
    CALL 785EH
    LD A,01H
    JP 7623H

; 753BH-7622H: title drawing commands and text. Bytes F1H-FFH are interpreter
; controls, '/' changes position, and '|' delimits strings. The printable text
; is the original TARGET GAMES / LASER SQUAD title content. The non-ASCII bytes
; before it select custom glyphs from the same 8-byte font table used by text.
    DB 7CH, F9H, F6H, 44H, FBH, F5H, 02H, 02H, 70H, 71H, 73H, 73H, 73H, 73H, 73H, 73H ; ||..D....pqssssss|
    DB 73H, 73H, 73H, 73H, 73H, 73H, 73H, 73H, 73H, 73H, 73H, 73H, 73H, 73H, 73H, 73H ; |ssssssssssssssss|
    DB 73H, 73H, 5CH, F7H, 5DH, 5FH, 74H, 74H, 74H, 74H, 74H, 74H, 74H, 74H, 74H, 74H ; |ss\.]_tttttttttt|
    DB 74H, 74H, 74H, 74H, 74H, 74H, 75H, 77H, F5H, 03H, 02H, 72H, 5EH, 5EH, 5EH, 5EH ; |ttttttuw...r^^^^|
    DB 5EH, 5EH, 5EH, 5EH, 5EH, 5EH, 5EH, 5EH, 5EH, 5EH, 5EH, 5EH, 78H, F8H, 7AH, 7BH ; |^^^^^^^^^^^^x.z{|
    DB 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H ; |yyyyyyyyyyyyyyyy|
    DB 79H, 79H, 79H, 79H, 79H, 79H, 79H, 79H, 76H, FCH, F6H, 45H, F5H, 04H, 0EH, 01H ; |yyyyyyyyv..E....|
    DB F5H, 0CH, 04H, 01H, F5H, 0CH, 18H, 01H, FAH, F6H, 46H, 06H, F5H, 07H, 0AH, 02H ; |..........F.....|
    DB F5H, 09H, 0CH, 03H, F6H, 43H, 42H, F5H, 0FH, 0BH, 05H, F5H, 12H, 07H, 06H, F6H ; |.....CB.........|
    DB 47H, 07H, F5H, 0CH, 0AH, 04H, 7CH, 7CH, 60H, 61H, 64H, 65H, 2FH, 62H, 63H, 66H ; |G.....||`ade/bcf|
    DB 67H, 7CH, 54H, 41H, 52H, 47H, 45H, 54H, 20H, 47H, 41H, 4DH, 45H, 53H, 7CH, 50H ; |g|TARGET GAMES|P|
    DB 52H, 45H, 53H, 45H, 4EH, 54H, 53H, 7CH, 4CH, 41H, 53H, 45H, 52H, 20H, 20H, 53H ; |RESENTS|LASER  S|
    DB 51H, 55H, 41H, 44H, 7CH, 41H, 20H, 54H, 41H, 43H, 54H, 49H, 43H, 41H, 4CH, 7CH ; |QUAD|A TACTICAL||
    DB 57H, 41H, 52H, 46H, 41H, 52H, 45H, 20H, 53H, 49H, 4DH, 55H, 4CH, 41H, 54H, 49H ; |WARFARE SIMULATI|
    DB 4FH, 4EH, 7CH, 08H, D2H, 75H, 3BH, 75H                                       ; |ON|..u;u|

L7623:
    ; Initialize the interpreter. 761EH starts as 08H (large-glyph mode),
    ; 761FH points at the indexed title strings, and 7621H at the main script.
    ; A selects the A-th | delimited item in that main script.
    PUSH HL
    LD HL,761EH
    LD (HL),08H
    LD HL,75D2H
    LD (761FH),HL
    LD HL,753BH
    LD (7621H),HL
    CALL 76E4H
    POP HL
    RET
    ; 763AH-763EH initial coordinate/attribute state: row 12, column 23,
    ; normal attribute 44H, second large attribute 47H, trailing 07H.
    DB 0CH, 17H, 44H, 47H, 07H                                                      ; |..DG.|

L763F:
    ; Draw one large (8x16) glyph.
    ;
    ; Input: A = character/glyph code.
    ; The row in 763AH indexes the Spectrum scanline-address table at 787DH;
    ; the column in 763BH is added to the selected bitmap address. Each of the
    ; eight font rows is written twice vertically. Two attribute cells are
    ; then written from 763EH and 763DH to cover the doubled height.
    PUSH HL
    PUSH DE
    PUSH BC
    PUSH AF
    LD (763CH),A
    LD DE,(763AH)
    LD A,D
    LD D,00H
    LD HL,787DH
    ADD HL,DE
    ADD HL,DE
    LD E,(HL)
    INC HL
    LD D,(HL)
    INC HL
    LD C,(HL)
    INC HL
    LD B,(HL)
    LD L,A
    LD H,00H
    ADD HL,BC
    PUSH HL
    LD L,A
    LD H,00H
    ADD HL,DE
    PUSH HL
    LD DE,77ADH
    LD H,00H
    LD A,(763CH)
    LD L,A
    ADD HL,HL
    ADD HL,HL
    ADD HL,HL
    ADD HL,DE
    POP DE
    LD C,02H

L7673:
    ; Two passes of four font rows. The second pass starts from the second
    ; bitmap address saved above; each source row is duplicated with INC D.
    LD B,04H

L7675:
    LD A,(HL)
    LD (DE),A
    INC D
    LD (DE),A
    INC D
    INC HL
    DJNZ 7675H
    DEC C
    JR Z,7683H
    POP DE
    JR 7673H

L7683:
    ; Convert the final bitmap address to its 5800H attribute address. Write
    ; the lower large-glyph cell, move up one attribute row, and write the
    ; upper cell. This is Spectrum-specific screen-layout arithmetic.
    EX DE,HL
    DEC H
    LD A,H
    RRCA
    RRCA
    RRCA
    AND 03H
    OR 58H
    LD H,A
    LD A,(763EH)
    LD (HL),A
    LD DE,FFE0H
    ADD HL,DE
    LD A,(763DH)
    LD (HL),A
    POP AF
    POP BC
    POP DE
    POP HL
    RET

L769F:
    ; Draw one normal 8x8 glyph and its attribute.
    ; Input and coordinate lookup are the same as L763F, but each font row is
    ; written once and only attribute 763DH is stored.
    PUSH HL
    PUSH DE
    PUSH AF
    LD DE,(763AH)
    LD A,D
    LD D,00H
    LD HL,787DH
    ADD HL,DE
    ADD HL,DE
    LD E,(HL)
    INC HL
    LD D,(HL)
    LD L,A
    LD H,00H
    ADD HL,DE
    POP AF
    PUSH HL
    LD DE,77ADH
    LD H,00H
    LD L,A
    ADD HL,HL
    ADD HL,HL
    ADD HL,HL
    ADD HL,DE
    POP DE
    LD B,08H

L76C4:
    ; Spectrum bitmap scanlines for a character cell are 0100H apart, hence
    ; INC D advances to the next raster within the cell.
    LD A,(HL)
    LD (DE),A
    INC D
    INC HL
    DJNZ 76C4H
    EX DE,HL
    DEC H
    LD A,H
    RRCA
    RRCA
    RRCA
    AND 03H
    OR 58H
    LD H,A
    LD A,(763DH)
    LD (HL),A
    POP DE
    POP HL
    RET
    ; 76DCH-76E3H are mutable interpreter pointers/origin state. Their initial
    ; words are 75D1H, 75FFH, 0A0CH, and 75CFH respectively.
    DB D1H, 75H, FFH, 75H, 0CH, 0AH, CFH, 75H                                       ; |.u.u...u|

L76E4:
    ; Script interpreter entry. A is a 1-based | delimited item number.
    ; Locate that item in the primary stream, reset the current coordinate to
    ; the stored origin, then consume bytes until the next delimiter.
    PUSH HL
    PUSH DE
    PUSH BC
    LD B,A
    LD HL,(7621H)
    DEC HL

L76EC:
    INC HL
    LD A,(HL)
    CP 7CH
    JR NZ,76ECH
    DJNZ 76ECH
    LD (76DCH),HL
    LD HL,(76E0H)
    LD (763AH),HL

L76FD:
    ; Primary-stream byte dispatch:
    ;   7CH ('|')  end this interpreter call
    ;   F1H-FFH    control token handled by L77CC
    ;   2FH ('/')  position/newline operation handled by L77A4
    ;   other      render directly or expand through an indexed string
    LD HL,(76DCH)
    INC HL
    LD (76DCH),HL
    LD A,(HL)
    CP 7CH
    JR Z,772DH
    CP F1H
    JR C,7718H
    CALL 77CCH
    LD HL,(76E2H)
    LD (76DCH),HL
    JR 76FDH

L7718:
    CP 2FH
    JR NZ,7721H
    CALL 77A4H
    JR 76FDH

L7721:
    ; Flag bit 2 selects direct rendering. When clear, the byte is a 1-based
    ; index into the | delimited string table addressed through 761FH.
    LD HL,761EH
    BIT 2,(HL)
    JR Z,7731H
    CALL 7774H
    JR 76FDH

L772D:
    POP BC
    POP DE
    POP HL
    RET

L7731:
    ; Find indexed string A, then process it with the same token, slash, and
    ; glyph rules. 76DEH is the mutable cursor within this secondary stream.
    LD HL,(761FH)
    DEC HL
    LD B,A

L7736:
    INC HL
    LD A,(HL)
    CP 7CH
    JR NZ,7736H
    DJNZ 7736H
    LD (76DEH),HL

L7741:
    LD HL,(76DEH)
    INC HL
    LD (76DEH),HL
    LD A,(HL)
    CP 7CH
    JR NZ,7757H
    ; At an indexed-string delimiter, bit 1 suppresses the final coordinate
    ; advance when set. Return to the primary stream afterwards.
    LD HL,761EH
    BIT 1,(HL)
    CALL Z,7789H
    JR 76FDH

L7757:
    CP 80H
    JR C,7766H
    CALL 77CCH
    LD HL,(76E2H)
    LD (76DEH),HL
    JR 7741H

L7766:
    CP 2FH
    JR NZ,776FH
    CALL 77A4H
    JR 7741H

L776F:
    CALL 7774H
    JR 7741H

L7774:
    ; Render A using normal or large glyphs. Flag bit 3 selects L763F (large);
    ; every rendered glyph then advances the current coordinate via L7789.
    LD HL,761EH
    BIT 3,(HL)
    JR NZ,7782H
    CALL 769FH
    CALL 7789H
    RET

L7782:
    CALL 763FH
    CALL 7789H
    RET

L7789:
    ; Advance after a glyph. With bit 4 clear, increment the byte column at
    ; 763BH. With bit 4 set, increment the row at 763AH; large mode advances
    ; one additional row because its glyph occupies two character rows.
    LD HL,761EH
    BIT 4,(HL)
    JR NZ,7795H
    LD HL,763BH
    INC (HL)
    RET

L7795:
    LD A,(763AH)
    INC A
    LD (763AH),A
    BIT 3,(HL)
    RET Z
    INC A
    LD (763AH),A
    RET

L77A4:
    ; Handle '/'. Bit 0 changes slash into the ordinary post-glyph advance.
    ; Otherwise start from the saved origin and move one column (bit 4 clear)
    ; or one/two rows (bit 4 set, depending on large mode), then store the new
    ; origin and current coordinate.
    LD HL,761EH
    BIT 0,(HL)
    JR NZ,7789H
    BIT 4,(HL)
    JR Z,77B6H
    LD DE,(76E0H)
    INC D
    JR 77C3H

L77B6:
    LD DE,(76E0H)
    INC E
    LD HL,761EH
    BIT 3,(HL)
    JR Z,77C3H
    INC E

L77C3:
    LD (76E0H),DE
    LD (763AH),DE
    RET

L77CC:
    ; Handle F1H-FFH control tokens. Save the token position so immediate
    ; parameters can be read and so the caller can resume after them.
    ;
    ; Mechanically verified token effects:
    ;   FFH  set indexed-string pointer 761FH to 75D2H
    ;   FEH  set 761FH from the word stored at address 77CCH (purpose unclear)
    ;   FDH  set indexed-string pointer 761FH to 75D2H
    ;   FCH  clear mode bit 2       FBH  set mode bit 2
    ;   FAH  set mode bit 3         F9H  clear mode bit 3
    ;   F8H  clear mode bit 4       F7H  set mode bit 4
    ;   F6H  read attribute byte(s) F5H  read row/column word
    ;   F4H  clear mode bit 1       F3H  set mode bit 1
    ;   F2H  clear mode bit 0       F1H  set mode bit 0
    LD (76E2H),HL
    INC A
    JR NZ,77D9H
    LD HL,75D2H
    LD (761FH),HL
    RET

L77D9:
    INC A
    JR NZ,77E3H
    LD HL,(77CCH)
    LD (761FH),HL
    RET

L77E3:
    INC A
    JR NZ,77EDH
    LD HL,75D2H
    LD (761FH),HL
    RET

L77ED:
    LD HL,761EH
    INC A
    JR NZ,77F6H
    RES 2,(HL)
    RET

L77F6:
    INC A
    JR NZ,77FCH
    SET 2,(HL)
    RET

L77FC:
    INC A
    JR NZ,7802H
    SET 3,(HL)
    RET

L7802:
    INC A
    JR NZ,7808H
    RES 3,(HL)
    RET

L7808:
    INC A
    JR NZ,780EH
    RES 4,(HL)
    RET

L780E:
    INC A
    JR NZ,7814H
    SET 4,(HL)
    RET

L7814:
    ; F6H: read the next byte into normal attribute 763DH. In large mode also
    ; read a second byte into 763EH. 76E2H is advanced over each parameter.
    INC A
    JR NZ,7831H
    LD HL,(76E2H)
    INC HL
    LD (76E2H),HL
    LD A,(HL)
    LD (763DH),A
    LD A,(761EH)
    BIT 3,A
    RET Z
    INC HL
    LD (76E2H),HL
    LD A,(HL)
    LD (763EH),A
    RET

L7831:
    ; F5H: read the following little-endian coordinate word, then update both
    ; the saved origin and the live coordinate.
    INC A
    JR NZ,7847H
    LD HL,(76E2H)
    INC HL
    LD C,(HL)
    INC HL
    LD B,(HL)
    LD (76E2H),HL
    LD (76E0H),BC
    LD (763AH),BC
    RET

L7847:
    INC A
    JR NZ,784DH
    RES 1,(HL)
    RET

L784D:
    INC A
    JR NZ,7853H
    SET 1,(HL)
    RET

L7853:
    INC A
    JR NZ,7859H
    RES 0,(HL)
    RET

L7859:
    INC A
    RET NZ
    SET 0,(HL)
    RET

L785E:
    ; Clear the complete Spectrum display: attributes 5800H-5AFFH and bitmap
    ; 4000H-57FFH. The backward fills deliberately cover 0300H and 1800H bytes.
    XOR A
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
    RET

L7874:
    ; Busy-wait for any Spectrum key. Reading FEH with A=0 selects all keyboard
    ; rows; bits 0-4 are active low. OR E0H and INC produces zero only when no
    ; key is down, so the loop exits on the first sampled press.
    XOR A
    IN A,(FEH)
    OR E0H
    INC A
    JR Z,7874H
    RET

; 787DH-78ACH: 24 little-endian Spectrum bitmap row bases. There are eight
; character rows in each bitmap third: 4000H, 4800H, and 5000H, with 20H-byte
; steps inside each third. The renderers index this table with 763AH.
    DB 00H, 40H, 20H, 40H, 40H, 40H, 60H, 40H, 80H, 40H, A0H, 40H, C0H, 40H, E0H, 40H ; |.@ @@@`@.@.@.@.@|
    DB 00H, 48H, 20H, 48H, 40H, 48H, 60H, 48H, 80H, 48H, A0H, 48H, C0H, 48H, E0H, 48H ; |.H H@H`H.H.H.H.H|
    DB 00H, 50H, 20H, 50H, 40H, 50H, 60H, 50H, 80H, 50H, A0H, 50H, C0H, 50H, E0H, 50H ; |.P P@P`P.P.P.P.P|

; 78ADH onward: 8-byte, 1-bit glyphs indexed directly by character code. The
; renderer uses 77ADH + code*8, making code 20H land at 78ADH. The ordinary
; ASCII space-through-'Z' range occupies 78ADH-7A84H.
    DB 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H, 18H, 18H, 18H, 00H, 18H, 18H, 00H ; |................|
    DB 00H, 66H, 66H, 66H, 00H, 00H, 00H, 00H, 00H, 24H, 7EH, 24H, 24H, 7EH, 24H, 00H ; |.fff.....$~$$~$.|
    DB 00H, 08H, 7EH, 68H, 7EH, 0AH, 7EH, 08H, 00H, 62H, 64H, 08H, 10H, 26H, 46H, 00H ; |..~h~.~..bd..&F.|
    DB 00H, 10H, 28H, 10H, 2AH, 44H, 3AH, 00H, 00H, 08H, 10H, 00H, 00H, 00H, 00H, 00H ; |..(.*D:.........|
    DB 00H, 06H, 0CH, 0CH, 0CH, 0CH, 06H, 00H, 00H, 60H, 30H, 30H, 30H, 30H, 60H, 00H ; |.........`0000`.|
    DB 00H, 00H, 24H, 18H, 7EH, 18H, 24H, 00H, 00H, 00H, 18H, 18H, 7EH, 18H, 18H, 00H ; |..$.~.$.....~...|
    DB 00H, 00H, 00H, 00H, 00H, 18H, 18H, 30H, 00H, 00H, 00H, 00H, 7EH, 00H, 00H, 00H ; |.......0....~...|
    DB 00H, 00H, 00H, 00H, 00H, 18H, 18H, 00H, 01H, 03H, 06H, 0CH, 18H, 30H, 60H, 40H ; |.............0`@|
    DB 00H, 3CH, 46H, 4EH, 56H, 66H, 3CH, 00H, 00H, 18H, 28H, 08H, 18H, 18H, 3CH, 00H ; |.<FNVf<...(...<.|
    DB 00H, 3CH, 46H, 06H, 3CH, 60H, 7EH, 00H, 00H, 3CH, 46H, 0CH, 06H, 46H, 3CH, 00H ; |.<F.<`~..<F..F<.|
    DB 00H, 0CH, 14H, 24H, 4CH, 7EH, 0CH, 00H, 00H, 7EH, 40H, 7CH, 06H, 46H, 3CH, 00H ; |...$L~...~@|.F<.|
    DB 00H, 3CH, 60H, 7CH, 66H, 66H, 3CH, 00H, 00H, 7EH, 06H, 04H, 08H, 18H, 18H, 00H ; |.<`|ff<..~......|
    DB 00H, 3CH, 66H, 3CH, 66H, 66H, 3CH, 00H, 00H, 3CH, 66H, 66H, 3EH, 06H, 3CH, 00H ; |.<f<ff<..<ff>.<.|
    DB 00H, 40H, 60H, 70H, 70H, 60H, 40H, 00H, 00H, 18H, 18H, 00H, 00H, 18H, 18H, 30H ; |.@`pp`@........0|
    DB 00H, 02H, 06H, 0EH, 0EH, 06H, 02H, 00H, 00H, 00H, 00H, 3EH, 00H, 3EH, 00H, 00H ; |...........>.>..|
    DB 00H, 40H, 60H, 70H, 70H, 60H, 40H, 00H, 3CH, 46H, 06H, 0CH, 18H, 00H, 18H, 00H ; |.@`pp`@.<F......|
    DB 00H, 3CH, 4AH, 56H, 5EH, 40H, 3CH, 00H, 00H, 3CH, 46H, 46H, 7EH, 66H, 66H, 00H ; |.<JV^@<..<FF~ff.|
    DB 00H, 7CH, 46H, 7CH, 66H, 66H, 7CH, 00H, 00H, 3CH, 42H, 40H, 60H, 62H, 3CH, 00H ; |.|F|ff|..<B@`b<.|
    DB 00H, 7CH, 46H, 46H, 66H, 66H, 7CH, 00H, 00H, 7EH, 40H, 78H, 60H, 60H, 7EH, 00H ; |.|FFff|..~@x``~.|
    DB 00H, 7EH, 40H, 60H, 78H, 60H, 60H, 00H, 00H, 3CH, 42H, 40H, 66H, 62H, 3CH, 00H ; |.~@`x``..<B@fb<.|
    DB 00H, 42H, 42H, 7EH, 66H, 66H, 66H, 00H, 00H, 3CH, 08H, 08H, 18H, 18H, 3CH, 00H ; |.BB~fff..<....<.|
    DB 00H, 02H, 02H, 02H, 06H, 46H, 3CH, 00H, 00H, 42H, 44H, 78H, 64H, 66H, 66H, 00H ; |.....F<..BDxdff.|
    DB 00H, 40H, 40H, 60H, 60H, 60H, 7EH, 00H, 00H, 66H, 5AH, 42H, 66H, 66H, 66H, 00H ; |.@@```~..fZBfff.|
    DB 00H, 62H, 72H, 6AH, 66H, 66H, 66H, 00H, 00H, 3CH, 46H, 46H, 66H, 66H, 3CH, 00H ; |.brjfff..<FFff<.|
    DB 00H, 7CH, 46H, 46H, 7CH, 60H, 60H, 00H, 00H, 3CH, 42H, 42H, 6AH, 66H, 3CH, 00H ; |.|FF|``..<BBjf<.|
    DB 00H, 7CH, 46H, 46H, 7CH, 6CH, 66H, 00H, 00H, 3CH, 60H, 3CH, 06H, 46H, 3CH, 00H ; |.|FF|lf..<`<.F<.|
    DB 00H, 7EH, 08H, 08H, 18H, 18H, 18H, 00H, 00H, 46H, 46H, 66H, 66H, 66H, 3CH, 00H ; |.~.......FFfff<.|
    DB 00H, 66H, 66H, 66H, 66H, 3CH, 18H, 00H, 00H, 66H, 66H, 42H, 5AH, 66H, 42H, 00H ; |.ffff<...ffBZfB.|
    DB 00H, 66H, 3CH, 18H, 18H, 3CH, 66H, 00H, 00H, 42H, 24H, 18H, 18H, 18H, 18H, 00H ; |.f<..<f..B$.....|
    DB 00H, 7EH, 0CH, 08H, 10H, 30H, 7EH, 00H                                      ; |.~...0~.|

; 7A85H-7BADH: additional custom 8-byte graphics selected
; by the non-ASCII script codes. Their visual purpose is not yet fully named;
; they are retained as original data rather than guessed or replaced.
    DB 3CH, 7EH, FFH, FFH, FFH, FFH, 7EH, 3CH                                      ; |<~....~<|
    DB 3EH, 7EH, 7EH, 00H, 6AH, 54H, 2AH, 00H, E8H, E4H, EAH, 05H, E0H, F5H, F2H, 75H ; |>~~.jT*........u|
    DB 68H, 74H, 68H, 74H, 68H, 74H, 68H, 74H, 00H, 75H, 72H, 75H, 72H, 75H, 36H, 00H ; |hthththt.ururu6.|
    DB 00H, 00H, 00H, 00H, 00H, FFH, 47H, 3FH, 00H, 80H, E0H, F8H, 03H, F7H, ECH, ECH ; |......G?........|
    DB 11H, 0FH, 04H, 03H, 00H, 00H, 00H, 00H, EEH, EEH, 6EH, F7H, 03H, 1CH, 07H, 01H ; |..........n.....|
    DB 00H, 01H, 07H, 1FH, C0H, EFH, 37H, 37H, 00H, 00H, 00H, 00H, 00H, FFH, E2H, FCH ; |......77........|
    DB 77H, 77H, 76H, EFH, C0H, 38H, E0H, 80H, 88H, F0H, 20H, C0H, 00H, 00H, 00H, 00H ; |wwv..8.... .....|
    DB 00H, 08H, 1CH, 3EH, 7FH, 08H, 08H, 00H, 00H, 00H, 7CH, 3CH, 1CH, 2CH, 44H, 00H ; |...>......|<.,D.|
    DB 00H, 08H, 0CH, 0EH, 7FH, 0EH, 0CH, 08H, 00H, 44H, 2CH, 1CH, 3CH, 7CH, 00H, 00H ; |.........D,.<|..|
    DB 00H, 08H, 08H, 7FH, 3EH, 1CH, 08H, 00H, 00H, 22H, 34H, 38H, 3CH, 3EH, 00H, 00H ; |....>...."48<>..|
    DB 00H, 08H, 18H, 38H, 7EH, 38H, 18H, 08H, 00H, 00H, 3EH, 3CH, 38H, 34H, 22H, 00H ; |...8~8....><84".|
    DB 17H, 37H, 77H, F0H, 05H, EAH, E5H, EAH, 7CH, 7EH, 7EH, 02H, 56H, 2AH, 54H, 00H ; |.7w.....|~~.V*T.|
    DB 00H, EAH, E4H, EAH, E4H, EAH, 7CH, 00H, 00H, FFH, FFH, 55H, AAH, 55H, 00H, 00H ; |......|....U.U..|
    DB 34H, 3AH, 34H, 3AH, 34H, 3AH, 34H, 3AH, 00H, 3EH, 75H, 72H, 75H, 72H, 75H, 00H ; |4:4:4:4:.>ururu.|
    DB 00H, 3EH, 7EH, 7EH, 40H, 6AH, 54H, 2AH, 75H, F2H, F5H, F0H, 05H, AAH, 44H, A8H ; |.>~~@jT*u.....D.|
    DB 00H, 6CH, EAH, E4H, EAH, E4H, EAH, 00H, 00H, 00H, FFH, FFH, 55H, AAH, 55H, 00H ; |.l..........U.U.|
    DB EEH, EFH, EFH, 07H, A0H, 55H, 22H, 15H, 00H, 7CH, 7EH, 7EH, 00H, 56H, 2AH, 54H ; |.....U"..|~~.V*T|
    DB 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H, 1FH, 3FH, 7FH, 7FH, 7FH, 7FH, 7FH, 3FH ; |.........?.....?|
    DB F8H, FCH, FEH, FEH, FEH, FEH, FEH, FCH, 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H ; |................|
