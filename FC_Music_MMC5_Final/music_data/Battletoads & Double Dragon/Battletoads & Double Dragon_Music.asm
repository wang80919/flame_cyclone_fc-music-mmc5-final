    .INESPRG 2                              ;16KB PRG 数量
    .INESCHR 0                                ;8KB CHR 数量
    .INESMAP 4                                       ;mapper号
    .INESMIR 0                                     ;命名表镜像 0水平 1垂直

Return_Level    =   $80
Stack_Pos       =   $81

    .BANK $00
    .INCBIN "8000_FFFF.bin"
    ;.INCBIN "C000_FFFF.bin"

    .BANK $03
    
    .ORG $FE80
;==================================================
Play_Proc
    JSR $8CC8
    RTS
    
Play_PCM
    JSR .Label_0
    JSR .Label_2
    LDA $46
    BPL .End
    JSR $8977
.End
    RTS
 
.Label_0
    LDX #$03
.Label_1
    LDA $2C,X
    ADC $0B
    SBC $03FE
    EOR $0458
    EOR $2D,X
    SBC $2B,X
    ADC $041C,X
    ADC $0B
    STA $2C,X
    DEX
    BPL .Label_1
    RTS

.Label_2
    LDA $2C
    EOR $2F
    ADC $2E
    STA $2D
    LDA $2E
    ROL
    SBC $2F
    STA $2E
    EOR $2D
    STA $2C
    RTS



;==================================================
Reset_Proc
    SEI
    CLD
    LDA #$00
    STA $2000
    STA $2001
    
    LDA #$C0
    STA $4017
    
    LDX #02
.Wait_VBlank
    LDA $2002
    BPL .Wait_VBlank
    DEX
    BNE .Wait_VBlank
    
    LDX #$00
    TXA
.Clear_Ram
    STA $00,X
    STA $0100,X
    STA $0200,X
    STA $0300,X
    STA $0400,X
    STA $0500,X
    STA $0600,X
    STA $0700,X
    INX
    BNE .Clear_Ram
    
    LDA #$2
    STA $39
    
    JSR $8C5E
    
    LDA #$0F
    STA $4015
    
    DEC Return_Level
    LDA #$80
    STA $2000
    CLI
    
Loop
    JSR Play_PCM
    JMP Loop
    
;==================================================
Nmi_Proc
    PHA
    TXA
    PHA
    TYA
    PHA
    
    LDA $2002
    JSR Play_Proc
    
    PLA
    TAY
    PLA
    TAX
    PLA
    RTI
    
;==================================================
    .ORG $FFFA
    .DW Nmi_Proc
    .DW Reset_Proc
