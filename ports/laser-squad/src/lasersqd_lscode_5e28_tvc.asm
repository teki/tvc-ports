; Hardware-specific overlay for the original Laser Squad LSCODE block.
;
; The build starts with the pristine 5E28H-B620H payload from LASERSQD.TAP and
; applies only these patches. Do not place appended code at B621H: the original
; multiload system loads its first overlay there and calls that address.

        ORG 5E28H
        JP %TVC_MAIN_ENTRY%    ; map the game's U3 and reproduce original entry

        ; B1F7H returns here when the hidden-movement interstitial ends. Restore
        ; tactical colors and reproduce the original XOR / LD (B712H),A pair.
        ORG 5E95H
        CALL %TVC_MOVEMENT_COMPLETE%
        NOP

        ORG 0B0E8H
        JP %TVC_NUMBER_INPUT%  ; TVC numeric-key compatibility routine

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
        JP %TVC_MULTILOAD%     ; preserve selector, replace tape transport

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
