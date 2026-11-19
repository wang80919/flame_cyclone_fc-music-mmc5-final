
Switch_Bank_8000_A_Pre
    PHA
    CLC
    ADC Prg_Bank_8000
    MACRO_SWITCH_BANK_8000_A
    PLA
    RTS
Switch_Bank_A000_A_Pre
    PHA
    CLC
    ADC Prg_Bank_8000
    MACRO_SWITCH_BANK_A000_A
    PLA
    RTS
Switch_Bank_C000_A_Pre
    PHA
    CLC
    ADC Prg_Bank_8000
    MACRO_SWITCH_BANK_C000_A
    PLA
    RTS
    
    .IF 5 = MAPPER_NUMBER
Switch_Bank_E000_A_Pre
    PHA
    CLC
    ADC Prg_Bank_E000
    MACRO_SWITCH_BANK_E000_A
    PLA
    RTS
    .ENDIF


    .IF SWITCH_BANK_X_ENABLE
;==================================================
Switch_Bank_8000_X_Pre_Get
    CLC
    ADC Prg_Bank_8000
    RTS
    
Switch_Bank_8000_X_Pre
    PHA
    TXA
    PHA
    JSR Switch_Bank_8000_X_Pre_Get
    JSR Switch_Bank_8000_A
    PLA
    TAX
    PLA
    RTS
Switch_Bank_A000_X_Pre
    PHA
    TXA
    PHA
    JSR Switch_Bank_8000_X_Pre_Get
    JSR Switch_Bank_A000_A
    PLA
    TAX
    PLA
    RTS
Switch_Bank_C000_X_Pre
    PHA
    TXA
    PHA
    JSR Switch_Bank_8000_X_Pre_Get
    JSR Switch_Bank_C000_A
    PLA
    TAX
    PLA
    RTS
    
    .IF 5 = MAPPER_NUMBER
Switch_Bank_E000_X_Pre
    PHA
    TXA
    PHA
    JSR Switch_Bank_8000_X_Pre_Get
    JSR Switch_Bank_E000_A
    PLA
    TAX
    PLA
    RTS
    .ENDIF
    
    .ENDIF
    
    .IF SWITCH_BANK_Y_ENABLE
;==================================================
Switch_Bank_8000_Y_Pre_Get
    CLC
    ADC Prg_Bank_8000
    RTS
    
Switch_Bank_8000_Y_Pre
    PHA
    TYA
    PHA
    JSR Switch_Bank_8000_Y_Pre_Get
    JSR Switch_Bank_8000_A
    PLA
    TAY
    PLA
    RTS
Switch_Bank_A000_Y_Pre
    PHA
    TYA
    PHA
    JSR Switch_Bank_8000_Y_Pre_Get
    JSR Switch_Bank_A000_A
    PLA
    TAY
    PLA
    RTS
Switch_Bank_C000_Y_Pre
    PHA
    TYA
    PHA
    JSR Switch_Bank_8000_Y_Pre_Get
    JSR Switch_Bank_C000_A
    PLA
    TAY
    PLA
    RTS
    
    .IF 5 = MAPPER_NUMBER
Switch_Bank_E000_Y_Pre
    PHA
    TYA
    PHA
    JSR Switch_Bank_8000_Y_Pre_Get
    JSR Switch_Bank_E000_A
    PLA
    TAY
    PLA
    RTS
    .ENDIF
    
    .ENDIF
    
;==================================================
Switch_Bank_8000_A;切换bank到8000-9FFF
    .IF 5 = MAPPER_NUMBER
    PHA
    .ENDIF
    STA Prg_Bank_8000_Bak
    MACRO_SWITCH_BANK_8000_A
    .IF 5 = MAPPER_NUMBER
    PLA
    .ENDIF
    RTS
;==================================================
Switch_Bank_A000_A;切换bank到A000-BFFF
    .IF 5 = MAPPER_NUMBER
    PHA
    .ENDIF
    STA Prg_Bank_A000_Bak
    MACRO_SWITCH_BANK_A000_A
    .IF 5 = MAPPER_NUMBER
    PLA
    .ENDIF
    RTS
;==================================================
Switch_Bank_C000_A;切换bank到C000-DFFF
    .IF 5 = MAPPER_NUMBER
    PHA
    .ENDIF
    STA Prg_Bank_C000_Bak
    MACRO_SWITCH_BANK_C000_A
    .IF 5 = MAPPER_NUMBER
    PLA
    .ENDIF
    RTS
    
    .IF 5 = MAPPER_NUMBER
;==================================================
Switch_Bank_E000_A;切换bank到E000-FFFF
    .IF 5 = MAPPER_NUMBER
    PHA
    .ENDIF
    STA Prg_Bank_E000_Bak
    MACRO_SWITCH_BANK_E000_A
    .IF 5 = MAPPER_NUMBER
    PLA
    .ENDIF
    RTS
    .ENDIF

;==================================================
Switch_Main_Bank;切到主程序bank
    PHP
    SEI
    LDA #PROGRAM_BANK & BANK_DATA_MASK
    .IF PROGRAM_ADDR & $2000
        JSR Switch_Bank_A000_A   ;设置$A000地址bank
    .ELSE
        JSR Switch_Bank_8000_A   ;设置$8000地址bank
    .ENDIF
    
    .IF 5 = MAPPER_NUMBER
    LDA #RESET_BANK & BANK_DATA_MASK
    JSR Switch_Bank_E000_A   ;设置$E000地址bank
    .ENDIF
    
    PLP
    RTS

;==================================================
Switch_Music_Bank_8000_FFFF;切换音乐bank
    PHP
    SEI
    JSR Init_Sound_Bank    ;拿到音乐bank号
    LDA Prg_Bank_8000
    JSR Switch_Bank_8000_A   ;设置$8000地址bank
    LDA Prg_Bank_A000
    JSR Switch_Bank_A000_A   ;设置$A000地址bank
    LDA Prg_Bank_C000
    JSR Switch_Bank_C000_A   ;设置$C000地址bank
    
    .IF 5 = MAPPER_NUMBER
    LDA Prg_Bank_E000
    JSR Switch_Bank_E000_A   ;设置$E000地址bank
    .ENDIF
    
    PLP
    RTS

;==================================================
Switch_Music_Bank_8000_DFFF;切换音乐bank
    PHP
    SEI
    JSR Init_Sound_Bank    ;拿到音乐bank号
    LDA Prg_Bank_8000
    JSR Switch_Bank_8000_A   ;设置$8000地址bank
    LDA Prg_Bank_A000
    JSR Switch_Bank_A000_A   ;设置$A000地址bank
    LDA Prg_Bank_C000
    JSR Switch_Bank_C000_A   ;设置$C000地址bank
    PLP
    RTS

;==================================================
Switch_Music_Bank_8000_BFFF;切换音乐bank
    PHP
    SEI
    JSR Init_Sound_Bank    ;拿到音乐bank号
    LDA Prg_Bank_8000
    JSR Switch_Bank_8000_A   ;设置$8000地址bank
    LDA Prg_Bank_A000
    JSR Switch_Bank_A000_A   ;设置$A000地址bank
    PLP
    RTS
