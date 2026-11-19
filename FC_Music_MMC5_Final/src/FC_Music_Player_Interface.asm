;==================================================
;辅助工具宏
;==================================================
    .MACRO AUDIO_INTERFACE
        .ORG \1
        JMP \2
    .ENDM
    
    .MACRO APU_PORT_A
        STA \1
        STA \2
        RTS
    .ENDM
    
    .MACRO APU_PORT_X
        STX \1
        STX \2
        RTS
    .ENDM
    
    .MACRO APU_PORT_Y
        STY \1
        STY \2
        RTS
    .ENDM
    
    .MACRO APU_PORT_A_X
        STA \1,X
        STA \2,X
        RTS
    .ENDM
    
    .MACRO APU_PORT_A_Y
        STA \1,Y
        STA \2,Y
        RTS
    .ENDM
;==================================================
    
    .IF SOUND_BAR_SHOW_ENABLE
;==================================================
;NES APU
;==================================================
;APU写入接口A
Sound_Apu_4000_A APU_PORT_A $4000,Sound_Bar_Cur + $00
Sound_Apu_4001_A APU_PORT_A $4001,Sound_Bar_Cur + $01
Sound_Apu_4002_A APU_PORT_A $4002,Sound_Bar_Cur + $02
Sound_Apu_4003_A APU_PORT_A $4003,Sound_Bar_Cur + $03
Sound_Apu_4004_A APU_PORT_A $4004,Sound_Bar_Cur + $04
Sound_Apu_4005_A APU_PORT_A $4005,Sound_Bar_Cur + $05
Sound_Apu_4006_A APU_PORT_A $4006,Sound_Bar_Cur + $06
Sound_Apu_4007_A APU_PORT_A $4007,Sound_Bar_Cur + $07
Sound_Apu_4008_A APU_PORT_A $4008,Sound_Bar_Cur + $08
Sound_Apu_4009_A APU_PORT_A $4009,Sound_Bar_Cur + $09;未使用
Sound_Apu_400A_A APU_PORT_A $400A,Sound_Bar_Cur + $0A
Sound_Apu_400B_A APU_PORT_A $400B,Sound_Bar_Cur + $0B
Sound_Apu_400C_A APU_PORT_A $400C,Sound_Bar_Cur + $0C
Sound_Apu_400D_A APU_PORT_A $400D,Sound_Bar_Cur + $0D;未使用
Sound_Apu_400E_A APU_PORT_A $400E,Sound_Bar_Cur + $0E
Sound_Apu_400F_A APU_PORT_A $400F,Sound_Bar_Cur + $0F

;==================================================
;APU写入接口A,X
Sound_Apu_4000_A_X APU_PORT_A_X $4000,Sound_Bar_Cur + $00
Sound_Apu_4001_A_X APU_PORT_A_X $4001,Sound_Bar_Cur + $01
Sound_Apu_4002_A_X APU_PORT_A_X $4002,Sound_Bar_Cur + $02
Sound_Apu_4003_A_X APU_PORT_A_X $4003,Sound_Bar_Cur + $03
Sound_Apu_4004_A_X APU_PORT_A_X $4004,Sound_Bar_Cur + $04
Sound_Apu_4005_A_X APU_PORT_A_X $4005,Sound_Bar_Cur + $05
Sound_Apu_4006_A_X APU_PORT_A_X $4006,Sound_Bar_Cur + $06
Sound_Apu_4007_A_X APU_PORT_A_X $4007,Sound_Bar_Cur + $07
Sound_Apu_4008_A_X APU_PORT_A_X $4008,Sound_Bar_Cur + $08
Sound_Apu_4009_A_X APU_PORT_A_X $4009,Sound_Bar_Cur + $09;未使用
Sound_Apu_400A_A_X APU_PORT_A_X $400A,Sound_Bar_Cur + $0A
Sound_Apu_400B_A_X APU_PORT_A_X $400B,Sound_Bar_Cur + $0B
Sound_Apu_400C_A_X APU_PORT_A_X $400C,Sound_Bar_Cur + $0C
Sound_Apu_400D_A_X APU_PORT_A_X $400D,Sound_Bar_Cur + $0D;未使用
Sound_Apu_400E_A_X APU_PORT_A_X $400E,Sound_Bar_Cur + $0E
Sound_Apu_400F_A_X APU_PORT_A_X $400F,Sound_Bar_Cur + $0F

;==================================================
;APU写入接口A,Y
Sound_Apu_4000_A_Y APU_PORT_A_Y $4000,Sound_Bar_Cur + $00
Sound_Apu_4001_A_Y APU_PORT_A_Y $4001,Sound_Bar_Cur + $01
Sound_Apu_4002_A_Y APU_PORT_A_Y $4002,Sound_Bar_Cur + $02
Sound_Apu_4003_A_Y APU_PORT_A_Y $4003,Sound_Bar_Cur + $03
Sound_Apu_4004_A_Y APU_PORT_A_Y $4004,Sound_Bar_Cur + $04
Sound_Apu_4005_A_Y APU_PORT_A_Y $4005,Sound_Bar_Cur + $05
Sound_Apu_4006_A_Y APU_PORT_A_Y $4006,Sound_Bar_Cur + $06
Sound_Apu_4007_A_Y APU_PORT_A_Y $4007,Sound_Bar_Cur + $07
Sound_Apu_4008_A_Y APU_PORT_A_Y $4008,Sound_Bar_Cur + $08
Sound_Apu_4009_A_Y APU_PORT_A_Y $4009,Sound_Bar_Cur + $09;未使用
Sound_Apu_400A_A_Y APU_PORT_A_Y $400A,Sound_Bar_Cur + $0A
Sound_Apu_400B_A_Y APU_PORT_A_Y $400B,Sound_Bar_Cur + $0B
Sound_Apu_400C_A_Y APU_PORT_A_Y $400C,Sound_Bar_Cur + $0C
Sound_Apu_400D_A_Y APU_PORT_A_Y $400D,Sound_Bar_Cur + $0D;未使用
Sound_Apu_400E_A_Y APU_PORT_A_Y $400E,Sound_Bar_Cur + $0E
Sound_Apu_400F_A_Y APU_PORT_A_Y $400F,Sound_Bar_Cur + $0F

;==================================================
;APU写入接口X
Sound_Apu_4000_X APU_PORT_X $4000,Sound_Bar_Cur + $00
Sound_Apu_4004_X APU_PORT_X $4004,Sound_Bar_Cur + $04
Sound_Apu_4008_X APU_PORT_X $4008,Sound_Bar_Cur + $08
Sound_Apu_400C_X APU_PORT_X $400C,Sound_Bar_Cur + $0C
;==================================================
;APU写入接口Y
Sound_Apu_4000_Y APU_PORT_Y $4000,Sound_Bar_Cur + $00
Sound_Apu_4004_Y APU_PORT_Y $4004,Sound_Bar_Cur + $04
Sound_Apu_4008_Y APU_PORT_Y $4008,Sound_Bar_Cur + $08
Sound_Apu_400C_Y APU_PORT_Y $400C,Sound_Bar_Cur + $0C

;==================================================
;Konami VRC7
;==================================================
    .IF 85 = MAPPER_NUMBER
;--------------------------------------------------
;音频寄存器地址选择写入 ($9010)
VRC7_Audio_Addr_9010_A
    STA $9010
    STA Reg_Addr_Bak
    RTS
VRC7_Audio_Addr_9010_X
    STX $9010
    STX Reg_Addr_Bak
    RTS
VRC7_Audio_Addr_9010_Y
    STY $9010
    STY Reg_Addr_Bak
    RTS
;--------------------------------------------------
;音频寄存器写入 ($9030) 要写入通过 $9010 选择的内部寄存器的 8 位值
VRC7_Audio_Data_9030_A
    STA $9030
    STA Reg_A_Bak
    STX Reg_X_Bak
    LDX Reg_Addr_Bak
    STA Sound_Bar_Ex_Cur,X
    LDA Reg_Addr_Bak
    LSR
    LSR
    TAX
    LDA Reg_A_Bak
    STA Sound_Bar_Cur + $10,X
    LDX Reg_X_Bak
    RTS
;--------------------------------------------------
VRC7_Audio_Data_9030_X
    STX $9030
    STX Reg_Data_Bak
    STX Reg_X_Bak
    STA Reg_A_Bak
    LDX Reg_Addr_Bak
    LDA Reg_Data_Bak
    STA Sound_Bar_Ex_Cur,X
    LDA Reg_A_Bak
    LDX Reg_X_Bak
    RTS
;--------------------------------------------------
VRC7_Audio_Data_9030_Y
    STY $9030
    STY Reg_Data_Bak
    STA Reg_A_Bak
    STX Reg_X_Bak
    LDX Reg_Addr_Bak
    LDA Reg_Data_Bak
    STA Sound_Bar_Ex_Cur,X
    LDA Reg_A_Bak
    LDX Reg_X_Bak
    RTS
    .ENDIF

;==================================================
;MMC5
;==================================================
    .IF 5 = MAPPER_NUMBER
;音频脉冲5000
MMC5_Audio_Data_5000_A
    STA $5000
    STA Sound_Bar_Cur + $10
    RTS
MMC5_Audio_Data_5001_A
    STA $5001
    STA Sound_Bar_Cur + $11
    RTS
MMC5_Audio_Data_5002_A
    STA $5002
    STA Sound_Bar_Cur + $12
    RTS
MMC5_Audio_Data_5003_A
    STA $5003
    STA Sound_Bar_Cur + $13
    RTS
;音频脉冲5004
MMC5_Audio_Data_5004_A
    STA $5004
    STA Sound_Bar_Cur + $14
    RTS
MMC5_Audio_Data_5005_A
    STA $5005
    STA Sound_Bar_Cur + $15
    RTS
MMC5_Audio_Data_5006_A
    STA $5006
    STA Sound_Bar_Cur + $16
    RTS
MMC5_Audio_Data_5007_A
    STA $5007
    STA Sound_Bar_Cur + $17
    RTS
MMC5_Audio_Data_5000_A_X
    STA $5000,X
    STA Sound_Bar_Cur + $10,X
    RTS
MMC5_Audio_Data_5000_A_Y
    STA $5000,Y
    STA Sound_Bar_Cur + $10,Y
    RTS
    .ENDIF

;==================================================
;Konami VRC6
;==================================================
    .IF ((24 = MAPPER_NUMBER) | (26 = MAPPER_NUMBER))
VRC6_Audio_Data_9000_A
    STA $9000
    STA Sound_Bar_Cur + $10
    RTS

VRC6_Audio_Data_A000_A
    STA $A000
    STA Sound_Bar_Cur + $14
    RTS
    
VRC6_Audio_Data_B000_A
    STA $B000
    STA Sound_Bar_Cur + $18
    RTS
    .ENDIF
  
;==================================================
;Sunsoft 5B
;==================================================
    .IF 69 = MAPPER_NUMBER
Sunsoft_Audio_Addr_C000_A
    STA $C000
    STA Sound_Bar_Cur + $11
    RTS

Sunsoft_Audio_Data_E000_A
    STA $E000
    PHA
    LDA Sound_Bar_Cur + $11
    CMP #$08
    BEQ Sunsoft_Audio_Ch1
    CMP #$09
    BEQ Sunsoft_Audio_Ch2
    CMP #$0A
    BEQ Sunsoft_Audio_Ch3
    PLA
    RTS
Sunsoft_Audio_Ch1
    PLA
    STA Sound_Bar_Cur + $10
    RTS
Sunsoft_Audio_Ch2
    PLA
    STA Sound_Bar_Cur + $14
    RTS
Sunsoft_Audio_Ch3
    PLA
    STA Sound_Bar_Cur + $18
    RTS
    
    .ENDIF
 
;==================================================
Sound_Apu_Interface;声音寄存器接口
    AUDIO_INTERFACE $FE00, Sound_Apu_4000_A
    AUDIO_INTERFACE $FE04, Sound_Apu_4001_A
    AUDIO_INTERFACE $FE08, Sound_Apu_4002_A
    AUDIO_INTERFACE $FE0C, Sound_Apu_4003_A
    AUDIO_INTERFACE $FE10, Sound_Apu_4004_A
    AUDIO_INTERFACE $FE14, Sound_Apu_4005_A
    AUDIO_INTERFACE $FE18, Sound_Apu_4006_A
    AUDIO_INTERFACE $FE1C, Sound_Apu_4007_A
    AUDIO_INTERFACE $FE20, Sound_Apu_4008_A
    AUDIO_INTERFACE $FE24, Sound_Apu_4009_A
    AUDIO_INTERFACE $FE28, Sound_Apu_400A_A
    AUDIO_INTERFACE $FE2C, Sound_Apu_400B_A
    AUDIO_INTERFACE $FE30, Sound_Apu_400C_A
    AUDIO_INTERFACE $FE34, Sound_Apu_400D_A
    AUDIO_INTERFACE $FE38, Sound_Apu_400E_A
    AUDIO_INTERFACE $FE3C, Sound_Apu_400F_A

    AUDIO_INTERFACE $FE40, Sound_Apu_4000_A_X
    AUDIO_INTERFACE $FE44, Sound_Apu_4001_A_X
    AUDIO_INTERFACE $FE48, Sound_Apu_4002_A_X
    AUDIO_INTERFACE $FE4C, Sound_Apu_4003_A_X
    AUDIO_INTERFACE $FE50, Sound_Apu_4004_A_X
    AUDIO_INTERFACE $FE54, Sound_Apu_4005_A_X
    AUDIO_INTERFACE $FE58, Sound_Apu_4006_A_X
    AUDIO_INTERFACE $FE5C, Sound_Apu_4007_A_X
    AUDIO_INTERFACE $FE60, Sound_Apu_4008_A_X
    AUDIO_INTERFACE $FE64, Sound_Apu_4009_A_X
    AUDIO_INTERFACE $FE68, Sound_Apu_400A_A_X
    AUDIO_INTERFACE $FE6C, Sound_Apu_400B_A_X
    AUDIO_INTERFACE $FE70, Sound_Apu_400C_A_X
    AUDIO_INTERFACE $FE74, Sound_Apu_400D_A_X
    AUDIO_INTERFACE $FE78, Sound_Apu_400E_A_X
    AUDIO_INTERFACE $FE7C, Sound_Apu_400F_A_X

    AUDIO_INTERFACE $FE80, Sound_Apu_4000_A_Y
    AUDIO_INTERFACE $FE84, Sound_Apu_4001_A_Y
    AUDIO_INTERFACE $FE88, Sound_Apu_4002_A_Y
    AUDIO_INTERFACE $FE8C, Sound_Apu_4003_A_Y
    AUDIO_INTERFACE $FE90, Sound_Apu_4004_A_Y
    AUDIO_INTERFACE $FE94, Sound_Apu_4005_A_Y
    AUDIO_INTERFACE $FE98, Sound_Apu_4006_A_Y
    AUDIO_INTERFACE $FE9C, Sound_Apu_4007_A_Y
    AUDIO_INTERFACE $FEA0, Sound_Apu_4008_A_Y
    AUDIO_INTERFACE $FEA4, Sound_Apu_4009_A_Y
    AUDIO_INTERFACE $FEA8, Sound_Apu_400A_A_Y
    AUDIO_INTERFACE $FEAC, Sound_Apu_400B_A_Y
    AUDIO_INTERFACE $FEB0, Sound_Apu_400C_A_Y
    AUDIO_INTERFACE $FEB4, Sound_Apu_400D_A_Y
    AUDIO_INTERFACE $FEB8, Sound_Apu_400E_A_Y
    AUDIO_INTERFACE $FEBC, Sound_Apu_400F_A_Y

    AUDIO_INTERFACE $FFC0, Sound_Apu_4000_X
    AUDIO_INTERFACE $FFC4, Sound_Apu_4004_X
    AUDIO_INTERFACE $FFC8, Sound_Apu_4008_X
    AUDIO_INTERFACE $FFCC, Sound_Apu_400C_X
    
    AUDIO_INTERFACE $FFD0, Sound_Apu_4000_Y
    AUDIO_INTERFACE $FFD4, Sound_Apu_4004_Y
    AUDIO_INTERFACE $FFD8, Sound_Apu_4008_Y
    AUDIO_INTERFACE $FFDC, Sound_Apu_400C_Y
    .ENDIF

;==================================================
Expansion_Audio_Interface;扩展音频接口
    .IF SOUND_BAR_SHOW_ENABLE
        
        ;VRC6
        .IF ((24 = MAPPER_NUMBER) | (26 = MAPPER_NUMBER))
            AUDIO_INTERFACE $FEF0, VRC6_Audio_Data_9000_A
            AUDIO_INTERFACE $FEF4, VRC6_Audio_Data_A000_A
            AUDIO_INTERFACE $FEF8, VRC6_Audio_Data_B000_A
        .ENDIF
        
        ;VRC7
        .IF 85 = MAPPER_NUMBER
            AUDIO_INTERFACE $FEF0, VRC7_Audio_Addr_9010_A
            AUDIO_INTERFACE $FEF4, VRC7_Audio_Addr_9010_X
            AUDIO_INTERFACE $FEF8, VRC7_Audio_Addr_9010_Y
            
            AUDIO_INTERFACE $FF00, VRC7_Audio_Data_9030_A
            AUDIO_INTERFACE $FF04, VRC7_Audio_Data_9030_X
            AUDIO_INTERFACE $FF08, VRC7_Audio_Data_9030_Y
        .ENDIF

        ;Sunsoft 5B
        .IF 69 = MAPPER_NUMBER
            AUDIO_INTERFACE $FEF0, Sunsoft_Audio_Addr_C000_A
            AUDIO_INTERFACE $FEF4, Sunsoft_Audio_Data_E000_A
        .ENDIF
        
        ;MMC5
        .IF 5 = MAPPER_NUMBER
            AUDIO_INTERFACE $FEF0, MMC5_Audio_Data_5000_A
            AUDIO_INTERFACE $FEF4, MMC5_Audio_Data_5001_A
            AUDIO_INTERFACE $FEF8, MMC5_Audio_Data_5002_A
            AUDIO_INTERFACE $FEFC, MMC5_Audio_Data_5003_A
            AUDIO_INTERFACE $FF00, MMC5_Audio_Data_5004_A
            AUDIO_INTERFACE $FF04, MMC5_Audio_Data_5005_A
            AUDIO_INTERFACE $FF08, MMC5_Audio_Data_5006_A
            AUDIO_INTERFACE $FF0C, MMC5_Audio_Data_5007_A
            AUDIO_INTERFACE $FF10, MMC5_Audio_Data_5000_A_X
            AUDIO_INTERFACE $FF14, MMC5_Audio_Data_5000_A_Y
        .ENDIF

    .ENDIF

;==================================================
Sound_Bank_Interface;音频切页接口
    AUDIO_INTERFACE $FEC0, Switch_Bank_8000_A_Pre
    AUDIO_INTERFACE $FEC4, Switch_Bank_A000_A_Pre
    AUDIO_INTERFACE $FEC8, Switch_Bank_C000_A_Pre
    
    .IF 5 = MAPPER_NUMBER
        AUDIO_INTERFACE $FECC, Switch_Bank_E000_A_Pre
    .ENDIF

    .IF SWITCH_BANK_X_ENABLE
    
        AUDIO_INTERFACE $FED0, Switch_Bank_8000_X_Pre
        AUDIO_INTERFACE $FED4, Switch_Bank_A000_X_Pre
        AUDIO_INTERFACE $FED8, Switch_Bank_C000_X_Pre
        
        .IF 5 = MAPPER_NUMBER
            AUDIO_INTERFACE $FEDC, Switch_Bank_E000_X_Pre
        .ENDIF
    
    .ENDIF

    .IF SWITCH_BANK_Y_ENABLE
    
        AUDIO_INTERFACE $FEE0, Switch_Bank_8000_Y_Pre
        AUDIO_INTERFACE $FEE4, Switch_Bank_A000_Y_Pre
        AUDIO_INTERFACE $FEE8, Switch_Bank_C000_Y_Pre
        
        .IF 5 = MAPPER_NUMBER
            AUDIO_INTERFACE $FEEC, Switch_Bank_E000_Y_Pre
        .ENDIF
    
    .ENDIF

;==================================================
;DMC偏移调整
    .ORG $FFF0
    JMP DMC_Offset_Set
