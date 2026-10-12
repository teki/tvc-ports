; Hardware-specific overlay for the original Laser Squad LSCODE block.
;
; The build starts with the pristine 5E28H-B620H payload from LASERSQD.TAP and
; applies only these patches. Do not place appended code at B621H: the original
; multiload system loads its first overlay there and calls that address.

; Spectrum speaker bit 4 becomes TVC port 06H amplitude 0 or 15. Both values
; keep the firmware mirror's GRAPHICS 4 mode and bit 7 (0B13H = 81H in play).
TVC_SPEAKER_OFF EQU 81H
TVC_SPEAKER_ON  EQU 0BDH

        ORG 5E28H
        JP %TVC_MAIN_ENTRY%    ; map the game's U3 and reproduce original entry

        ; B1F7H returns here when the hidden-movement interstitial ends. Restore
        ; tactical colors and reproduce the original XOR / LD (B712H),A pair.
        ORG 5E95H
        CALL %TVC_MOVEMENT_COMPLETE%
        NOP

        ; Control methods 1-3 are Spectrum joysticks that share one action
        ; byte. Read the TVC joystick instead. Method 4 stays keyboard.
        ORG 0B0E8H
        JP %TVC_JOYSTICK%      ; Sinclair -> TVC joystick

        ORG 0B0FDH
        JP %TVC_JOYSTICK%      ; Kempston -> TVC joystick

        ORG 0B117H
        JP %TVC_JOYSTICK%      ; Protek/AGF/cursor -> TVC joystick

        ORG 0B136H
        JP %TVC_GAME_KEYS%     ; Q/A/O/P/Space gameplay controls

        ORG 6A74H
        CALL %TVC_KEY_SCAN%    ; replace release-loop Spectrum ROM KEY-SCAN

        ORG 0A290H
        CALL %TVC_KEY_SCAN%    ; replace Spectrum ROM KEY-SCAN at 028EH

        ORG 0B0ADH
        CALL %TVC_CONTROLS_SCREEN_CLEAR% ; select cyan profile, then clear

        ORG 0B0C3H
        CALL %TVC_CONTROLS_SELECTED% ; store method, select normal-game profile

        ORG 9D55H
        CALL %TVC_TEAM_SETUP_CLEAR% ; select team palette before its clear

        ORG 0A370H
        CALL %TVC_PLACEMENT_SCREEN_CLEAR% ; preserve cyan/yellow deployment teams

        ; Select the firing palette around the original 8495H display. Its
        ; entry calls the non-XOR screen clear with A=45H; its 85C3H exit uses
        ; the normal clear before redrawing the tactical map.
        ORG 8497H
        CALL %TVC_FIRE_SCREEN_CLEAR%

        ORG 85C3H
        CALL %TVC_FIRE_SCREEN_EXIT%

        ; Select the setup palette around the original 874DH unit-information
        ; display. Its entry calls the non-XOR screen clear with A=46H; its
        ; 8875H exit uses the normal clear before redrawing the tactical map.
        ORG 875AH
        CALL %TVC_UNIT_INFO_SCREEN_CLEAR%

        ORG 8875H
        CALL %TVC_UNIT_INFO_SCREEN_EXIT%

        ORG 0B15CH
        JP %TVC_SAVELOAD%      ; preserve menu selector, replace tape transport

        ORG 0B1F7H
        CALL %TVC_MOVEMENT_SCREEN_CLEAR% ; hidden-movement phase palette

        ORG 602DH
        JP %TVC_CLEAR_SCREEN%  ; 602CH retains its original XOR A entry

        ORG 6072H
        JP %TVC_DRAW_NORMAL%   ; original normal glyph entry L6067_0

        ORG 64F7H
        JP %TVC_DRAW_DOUBLE%   ; original double-height text renderer

        ; The original selection highlighter transforms and stores attributes
        ; directly. Preserve the transform through OR C, then replace its
        ; OR 40H / store / increment sequence with a native TVC recolor.
        ORG 693FH
        CALL %TVC_STORE_ATTRIBUTE_AND_REDRAW%
        NOP

        ORG 60AFH
        JP %TVC_DRAW_LARGE%    ; original four-quadrant glyph renderer

        ; The original 11-by-11 map loop is U1-resident and consumes U3 map
        ; data. Map VID0 once around that loop and use its mapped-only lookup.
        ORG 612AH
        JP %TVC_DRAW_LARGE_GRID%
        NOP

        ORG 6150H
        CALL %TVC_DRAW_LARGE_LOOKUP_MAPPED%

        ; Translate the common direct pixel plotter itself. This covers the
        ; firing cross plus every later set/clear/XOR and collision test.
        ORG 844CH
        JP %TVC_PLOT_PIXEL%

        ; B1C3H reloads the selected scenario and then restores the Spectrum
        ; stack before entering the game. Keep the post-multiload stack in U0
        ; too; otherwise the next TVC firmware interrupt overwrites 5Dxx state.
        ORG 0B1E8H
        LD SP,4000H

        ; Effect player: B5BDH now holds the TVC speaker level instead of the
        ; Spectrum port FEH value. Same bytes and T-states per toggle.
        ORG 0B5F3H
        XOR TVC_SPEAKER_ON-TVC_SPEAKER_OFF ; 3CH: amplitude bits only

        ORG 0B5F8H
        OUT (06H),A

        ORG 0B5BDH
        DB TVC_SPEAKER_OFF

        ; Projectile chirp: retain its period and accumulator logic; translate
        ; the on, off, and random speaker writes.
        ORG 8F47H
        LD A,TVC_SPEAKER_ON
        OUT (06H),A

        ORG 8F52H
        LD A,TVC_SPEAKER_OFF
        OUT (06H),A
        LD A,(5D7BH)
        LD B,A
TVC_CHIRP_LOW:
        NOP
        DJNZ TVC_CHIRP_LOW
        CALL TVC_RANDOM_BEEP
        NOP
        NOP

        ; Explosion particle noise. L9517H jumps to 94E0H, so keep that entry.
        ORG 94E0H
        CALL TVC_RANDOM_BEEP
        NOP
        NOP
        NOP

        ; The unreferenced gap before the B621H multiload overlay.
        ORG 0B614H
TVC_RANDOM_BEEP:
        LD A,R
        AND 10H
        LD A,TVC_SPEAKER_OFF
        JR Z,TVC_RANDOM_BEEP_OUT
        LD A,TVC_SPEAKER_ON
TVC_RANDOM_BEEP_OUT:
        OUT (06H),A
        RET
