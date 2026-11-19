    .INESPRG 2                              ;16KB PRG 数量
    .INESCHR 0                                ;8KB CHR 数量
    .INESMAP 4                                       ;mapper号
    .INESMIR 0                                     ;命名表镜像 0水平 1垂直

Return_Level    =   $80
Stack_Pos       =   $81

    .BANK $00
    .INCBIN "8000_FFFF_U.bin"

    .BANK $03
    
    .ORG $FE80
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
    
    LDA #$10
    STA $32
    JSR $8003
    
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
    JSR $8006
    
    PLA
    TAY
    PLA
    TAX
    PLA
    RTI
    
;==================================================
Play_Proc
    JSR $8855
    RTS
    
Play_PCM
    JSR .Label_0
    JSR .Label_2
    LDA $40
    BPL .End
    JSR $8018
.End
    RTS
 
.Label_0
    LDX #$03
.Label_1
    LDA $25,X
    ADC $0B
    SBC $03FD
    EOR $0457
    EOR $26,X
    SBC $24,X
    ADC $041B,X
    ADC $0B
    STA $25,X
    DEX
    BPL .Label_1
    RTS
.Label_2
    LDA $25
    EOR $28
    ADC $27
    STA $26
    LDA $27
    ROL
    SBC $28
    STA $27
    EOR $26
    STA $25
    RTS

;==================================================
    .ORG $FFFA
    .DW Nmi_Proc
    .DW Reset_Proc
