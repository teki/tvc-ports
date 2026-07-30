; Hardware-specific overlay for the original Laser Squad LSCODE block.
;
; The build starts with the pristine 5E28H-B620H payload from LASERSQD.TAP and
; applies only these patches. Do not place appended code at B621H: the original
; multiload system loads its first overlay there and calls that address.

        ORG 5E28H
        JP %TVC_MAIN_ENTRY%    ; map the game's U3 and reproduce original entry

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

        ORG 0B15CH
        JP %TVC_MULTILOAD%     ; preserve selector, replace tape transport

        ORG 602DH
        JP %TVC_CLEAR_SCREEN%  ; 602CH retains its original XOR A entry

        ORG 6072H
        JP %TVC_DRAW_NORMAL%   ; original normal glyph entry L6067_0

        ORG 64F7H
        JP %TVC_DRAW_DOUBLE%   ; original double-height text renderer

        ; The original selection highlighter transforms and stores attributes
        ; directly. Preserve the transform through OR C, then replace its
        ; OR 40H / store / increment sequence with a shadow-aware TVC write.
        ORG 693FH
        CALL %TVC_STORE_ATTRIBUTE_AND_REDRAW%
        NOP

        ORG 60AFH
        JP %TVC_DRAW_LARGE%    ; original four-quadrant glyph renderer

        ; B1C3H reloads the selected scenario and then restores the Spectrum
        ; stack before entering the game. Keep the post-multiload stack in U0
        ; too; otherwise the next TVC firmware interrupt overwrites 5Dxx state.
        ORG 0B1E8H
        LD SP,4000H
