; TVC disk write probe.
;
; Assemble with:
;   mkdir -p build
;   ../rtvc/target/debug/rtvc-asm --format cas \
;       knowledge/tvc-disk-write-probe.asm \
;       -o build/tvc-disk-write-probe.cas
;
; Run the CAS from a writable DSK, then inspect PROBE.CAS on the disk. This
; tells us what VT-DOS actually stores for a machine-code-created data file.

        BASIC_START

        LD A,50H
        LD (1705H),A            ; VT-DOS disk output device (device 5 * 10H).
        XOR A
        LD (0B6BH),A            ; BUFFER: 0 = non-buffered file.

        LD DE,PROBE_NAME
        LD A,(1705H)
        OR 03H
        LD (OPEN_WRITE_FUNC),A
        RST 30H
OPEN_WRITE_FUNC:
        DB 03H
        OR A
        JR NZ,ERROR_FLASH

        LD HL,PROBE_HEADER
WRITE_HEADER:
        LD C,(HL)
        PUSH HL
        LD A,(1705H)
        OR 01H
        LD (CHAR_WRITE_FUNC),A
        RST 30H
CHAR_WRITE_FUNC:
        DB 01H
        POP HL
        OR A
        JR NZ,ERROR_FLASH
        INC HL
        LD DE,PROBE_PAYLOAD
        OR A
        SBC HL,DE
        ADD HL,DE
        JR NZ,WRITE_HEADER

        LD BC,PROBE_PAYLOAD_END - PROBE_PAYLOAD
        LD DE,PROBE_PAYLOAD
        LD A,(1705H)
        OR 02H
        LD (BLOCK_WRITE_FUNC),A
        RST 30H
BLOCK_WRITE_FUNC:
        DB 02H
        PUSH AF

        LD A,(1705H)
        OR 04H
        LD (CLOSE_FUNC),A
        RST 30H
CLOSE_FUNC:
        DB 04H

        POP AF
        OR A
        JR NZ,ERROR_FLASH

OK_FLASH:
        LD A,02H
        OUT (00H),A
        CALL DELAY
        LD A,08H
        OUT (00H),A
        CALL DELAY
        JR OK_FLASH

ERROR_FLASH:
        LD A,04H
        OUT (00H),A
        CALL DELAY
        LD A,0AH
        OUT (00H),A
        CALL DELAY
        JR ERROR_FLASH

DELAY:
        LD B,24
DELAY_OUTER:
        LD DE,0600H
DELAY_INNER:
        DEC DE
        LD A,D
        OR E
        JR NZ,DELAY_INNER
        DJNZ DELAY_OUTER
        RET

PROBE_NAME:
        DB 5,"PROBE"

PROBE_HEADER:
        DB 00H                 ; data file type
        DW PROBE_PAYLOAD_END - PROBE_PAYLOAD
        DB 00H                 ; no autorun
        DS 10,00H
        DB 00H                 ; version
PROBE_PAYLOAD:
        DB "RTVC DISK PROBE",0
PROBE_PAYLOAD_END:
