;==============================
;按键处理
Joystick_Proc
    JSR Joystick_Scan
    LDA Key_Keep
    STA Key_Temp
    JSR Joystick_Scan
    LDA Key_Keep
    CMP Key_Temp
    BEQ Joystick_Get_Once
    LDA Key_Kemp
    STA Key_Keep
Joystick_Get_Once
    TAY
    EOR Key_Kemp
    AND Key_Keep
    STA Key_Once
    STY Key_Kemp
    RTS
;------------------------------
;按键扫描
Joystick_Scan
    LDX #$01
    STX JOY1_FRAME
    DEX
    STX JOY1_FRAME
    LDX #$08
Joystick_Value
    LDA JOY1_FRAME
    STA Key_Getv
    LSR A
    ORA Key_Getv
    LSR A
    ROL Key_Keep
    DEX
    BNE Joystick_Value
    RTS
