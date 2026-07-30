; TVC direct U3 disk-read probe.
;
; Purpose:
;   Determine whether the normal TVC 1.2 ROM/VT-DOS block-input path can write
;   directly to U3 at C000H while U3 is selected in page 3 on entry.
;
; Assemble with:
;   mkdir -p build
;   tools/rtvc-asm --format cas \
;       knowledge/tvc-disk-u3-read-probe.asm \
;       -o build/tvc-disk-u3-read-probe.cas
;
; Put the CAS on a 720 KiB DSK as U3PROBE.CAS, boot TVC 1.2 with VT-DOS, and
; LOAD "U3PROBE". The probe reopens its own CAS as the known input file.
;
; Result record in U0 RAM:
;   3000H  result:
;            01H = direct read returned success and U3 matched
;            02H = file open/header/prefix read failed
;            03H = direct block read returned an error
;            04H = direct read returned success but U3 did not match
;   3001H  direct block-read status returned in A
;   3002H  paging shadow at 0003H immediately after block input
;   3003H  first mismatching byte offset, or FFH when all bytes matched
;   3004H  read phase: 1=open, 2=header/prefix, 3=direct U3 block
;   3005H  close status returned in A
;
; Border patterns:
;   02H / 08H = direct U3 read succeeded
;   04H / 0AH = disk operation returned an error
;   06H / 0EH = disk read reported success, but U3 remained wrong
;
; This deliberately tests only C000H. When EXT is selected, C000H-CFFFH is
; HBF ROM, so a failed transfer cannot overwrite the HBF private RAM at D000H.

RESULT              EQU 3000H
READ_STATUS         EQU 3001H
MAP_AFTER_READ      EQU 3002H
MISMATCH_OFFSET     EQU 3003H
READ_PHASE          EQU 3004H
CLOSE_STATUS        EQU 3005H
U3_TARGET           EQU 0C000H
GUARD_BYTE          EQU 0A5H
PAYLOAD_SIZE        EQU 0020H
BASIC_PREFIX_SIZE   EQU 0041H

        BASIC_START

PROBE_ENTRY:
        XOR A
        LD (RESULT),A
        LD (READ_STATUS),A
        LD (MAP_AFTER_READ),A
        LD (READ_PHASE),A
        LD (CLOSE_STATUS),A
        DEC A
        LD (MISMATCH_OFFSET),A

        CALL FILL_U3_GUARD
        CALL DIRECT_U3_READ
        OR A
        JR NZ,READ_ERROR

        CALL CHECK_U3_PAYLOAD
        OR A
        JR NZ,COMPARE_ERROR

        LD A,01H
        LD (RESULT),A
        LD DE,0208H
        JR FLASH_RESULT

READ_ERROR:
        LD A,(READ_PHASE)
        CP 03H
        LD A,02H
        JR NZ,READ_ERROR_SELECTED
        LD A,03H
READ_ERROR_SELECTED:
        LD (RESULT),A
        LD DE,040AH
        JR FLASH_RESULT

COMPARE_ERROR:
        LD A,04H
        LD (RESULT),A
        LD DE,060EH

FLASH_RESULT:
        LD A,D
        OUT (00H),A
        CALL DELAY
        LD A,E
        OUT (00H),A
        CALL DELAY
        JR FLASH_RESULT

; Fill the physical U3 destination with a byte different from PROBE_ENTRY,
; then restore the caller's page-3 selection.
FILL_U3_GUARD:
        LD A,(0003H)
        PUSH AF
        AND 3FH
        OR 80H
        LD (0003H),A
        OUT (02H),A
        LD HL,U3_TARGET
        LD DE,U3_TARGET+1
        LD BC,PAYLOAD_SIZE-1
        LD (HL),GUARD_BYTE
        LDIR
        POP AF
        LD (0003H),A
        OUT (02H),A
        RET

; Reopen U3PROBE.CAS. Its disk-visible stream starts with a 16-byte application
; header followed by the BASIC payload loaded at 19EFH. BASIC_START places
; PROBE_ENTRY at 1A30H, so discard another 41H bytes before the direct read.
; Immediately before that read, map U3 at C000H and advertise the mapping
; through the firmware shadow at 0003H. The device dispatcher is then free to
; perform its normal mapping.
DIRECT_U3_READ:
        LD A,0D0H
        LD (1705H),A            ; disk device 5, input direction
        XOR A
        LD (0B6BH),A            ; non-buffered file access

        LD DE,DATA_NAME
        LD A,01H
        LD (READ_PHASE),A
        LD A,(1705H)
        OR 03H
        LD (READ_OPEN_FUNC),A
        RST 30H
READ_OPEN_FUNC:
        DB 03H
        OR A
        JR NZ,READ_OPEN_ERROR

        LD A,02H
        LD (READ_PHASE),A
        LD BC,0010H
        LD DE,READ_HEADER
        LD A,(1705H)
        OR 02H
        LD (READ_HEADER_FUNC),A
        RST 30H
READ_HEADER_FUNC:
        DB 02H
        OR A
        JR NZ,READ_EARLY_CLOSE

        LD BC,BASIC_PREFIX_SIZE
        LD DE,READ_PREFIX
        LD A,(1705H)
        OR 02H
        LD (READ_PREFIX_FUNC),A
        RST 30H
READ_PREFIX_FUNC:
        DB 02H
        OR A
        JR NZ,READ_EARLY_CLOSE

        LD A,03H
        LD (READ_PHASE),A
        LD A,(0003H)
        AND 3FH
        OR 80H
        LD (0003H),A
        OUT (02H),A             ; U3 visible at C000H on API entry

        LD BC,PAYLOAD_SIZE
        LD DE,U3_TARGET
        LD A,(1705H)
        OR 02H
        LD (READ_BLOCK_FUNC),A
        RST 30H
READ_BLOCK_FUNC:
        DB 02H
        LD (READ_STATUS),A
        PUSH AF
        LD A,(0003H)
        LD (MAP_AFTER_READ),A
        POP AF

READ_CLOSE:
        PUSH AF
        LD A,(1705H)
        OR 04H
        LD (READ_CLOSE_FUNC),A
        RST 30H
READ_CLOSE_FUNC:
        DB 04H
        LD (CLOSE_STATUS),A
        POP AF                  ; restore block-input status
        OR A
        RET

READ_EARLY_CLOSE:
        LD (READ_STATUS),A
        JR READ_CLOSE

READ_OPEN_ERROR:
        LD (READ_STATUS),A
        OR A
        RET

; Compare the resident bytes at PROBE_ENTRY in U0 with the physical U3
; destination.
; Return A=0 for a complete match, or A=1 and record the first bad offset.
CHECK_U3_PAYLOAD:
        LD A,(0003H)
        PUSH AF
        AND 3FH
        OR 80H
        LD (0003H),A
        OUT (02H),A

        LD HL,PROBE_ENTRY
        LD DE,U3_TARGET
        LD B,PAYLOAD_SIZE
        LD C,00H
CHECK_NEXT_BYTE:
        LD A,(DE)
        CP (HL)
        JR NZ,CHECK_MISMATCH
        INC HL
        INC DE
        INC C
        DJNZ CHECK_NEXT_BYTE
        LD A,0FFH
        LD (MISMATCH_OFFSET),A
        XOR A
        JR CHECK_RESTORE_MAP

CHECK_MISMATCH:
        LD A,C
        LD (MISMATCH_OFFSET),A
        LD A,01H

CHECK_RESTORE_MAP:
        LD C,A
        POP AF
        LD (0003H),A
        OUT (02H),A
        LD A,C
        OR A
        RET

DELAY:
        LD B,24
DELAY_OUTER:
        LD HL,0600H
DELAY_INNER:
        DEC HL
        LD A,H
        OR L
        JR NZ,DELAY_INNER
        DJNZ DELAY_OUTER
        RET

DATA_NAME:
        DB 7,"U3PROBE"

READ_HEADER:
        DS 16,00H

READ_PREFIX:
        DS BASIC_PREFIX_SIZE,00H
