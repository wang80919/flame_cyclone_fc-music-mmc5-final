Label_0
    LDA #$0F
    STA $4015
    LDA #$C0
    STA $4017
    LDA #$1C
    STA <$F0
    LDA #$03
    STA <$F1
    LDX #$00
    LDY #$00
Label_1
    TYA
    STA [$F0],Y
    STA $0300,X
    CLC
    LDA <$F0
    ADC #$08
    STA <$F0
    BCC Label_2
    INC <$F1
Label_2
    INX
    CPX #$1C
    BNE Label_1
    RTS

;==================================================
Battle_City_Music_Play
    LDA <$6D
    BNE Label_4
    LDA #$1C
    STA <$F5
    BPL Label_5
Label_4
    LDA #$01
    STA <$F5
Label_5
    LDA #$00
    LDX #$03
Label_6
    STA <$F9,X
    DEX
    BPL Label_6
    LDA #$00
    STA <$F4
    LDA #$1C
    STA <$F0
    LDA #$03
    STA <$F1
Label_7
    LDX <$F4
    LDA $0300,X
    BEQ Label_10
    LDY #$00
    LDA [$F0],Y
    BEQ Label_10
    CMP #$05
    BCC Label_8
    SEC
    SBC #$05
    TAX
    LDA #$01
    STA <$F9,X
    JMP Label_10

Label_8
    TAX
    DEX
    LDA <$F9,X
    BNE Label_10
    LDA #$01
    STA <$F9,X
    TXA
    TAY
    CLC
    ADC #$05
    LDY #$00
    STA [$F0],Y
    TXA
    ASL A
    ASL A
    TAX
    LDA #$04
    STA <$FD
Label_9
    INY
    LDA [$F0],Y
    STA $4000,X
    STA Sound_Bar_Cur,X
    INX
    DEC <$FD
    BNE Label_9
Label_10
    CLC
    LDA <$F0
    ADC #$08
    STA <$F0
    BCC Label_11
    INC <$F1
Label_11
    INC <$F4
    LDA <$F4
    CMP <$F5
    BCC Label_7
    LDX #$00
Label_12
    STX <$FD
    LDA <$F9,X
    BNE Label_13
    TXA
    ASL A
    ASL A
    TAX
    ASL A
    AND #$10
    EOR #$10
    STA $4000,X
    STA Sound_Bar_Cur,X
Label_13
    LDX <$FD
    INX
    CPX #$04
    BCC Label_12
    LDY #$00
    STY <$F4
    LDA #$1C
    STA <$F0
    LDA #$03
    STA <$F1
Label_14
    LDX <$F4
    LDA $0300,X
    BEQ Label_15
    CMP #$01
    BNE Label_17
    INC $0300,X
    JMP Label_18

Label_15
    CLC
    LDA <$F0
    ADC #$08
    STA <$F0
    BCC Label_16
    INC <$F1
Label_16
    INC <$F4
    LDA <$F4
    CMP <$F5
    BCC Label_14
    RTS

Label_17
    LDY #$07
    LDA [$F0],Y
    SEC
    SBC #$01
    STA [$F0],Y
    BEQ Label_19
    BNE Label_15
Label_18
    LDA #$00
    LDY #$05
    STA [$F0],Y
    JSR Label_43
    JSR Label_44
    LDY #$00
    STA [$F0],Y
    JSR Label_44
    LDY #$01
    STA [$F0],Y
    JSR Label_44
    LDY #$02
    STA [$F0],Y
    JSR Label_44
    LDY #$04
    STA [$F0],Y
    LDY #$00
    LDA [$F0],Y
    CMP #$04
    BNE Label_20
    JSR Label_44
    LDY #$03
    STA [$F0],Y
    BPL Label_20
Label_19
    JSR Label_43
Label_20
    JSR Label_44
    CMP #$E8
    BCS Label_25
    CMP #$60
    BEQ Label_24
    BCC Label_21
    SBC #$60
    LDY #$06
    STA [$F0],Y
    JMP Label_20

Label_21
    PHA
    AND #$F8
    LSR A
    LSR A
    TAX
    LDA Label_46,X
    STA <$FD
    LDA Label_46 + 1,X
    STA <$FE
    PLA
    AND #$07
    BEQ Label_23
    TAX
Label_22
    LSR <$FD
    ROR <$FE
    DEX
    BNE Label_22
Label_23
    LDY #$04
    LDA [$F0],Y
    AND #$F8
    ORA <$FD
    STA [$F0],Y
    LDA <$FE
    DEY
    STA [$F0],Y
    LDY #$00
    LDA [$F0],Y
    CMP #$05
    BCC Label_24
    SEC
    SBC #$04
    STA [$F0],Y
Label_24
    LDY #$06
    LDA [$F0],Y
    INY
    STA [$F0],Y
    JMP Label_15

Label_25
    SBC #$E8
    JSR Label_45
Label_26
    .DW Label_27
    .DW Label_28
    .DW Label_29
    .DW Label_30
    .DW Label_31
    .DW Label_32
    .DW Label_33
    .DW Label_34
    .DW Label_36
    .DW Label_37
    .DW Label_39
    .DW Label_41
    .DW Label_41
    .DW Label_41
    .DW Label_41
    .DW Label_41
    .DW Label_41
    .DW Label_42
    
Label_27
    LDX <$F4
    LDA #$00
    STA $0300,X
    LDY #$00
    STA [$F0],Y
    LDY #$05
    LDA [$F0],Y
    SEC
    SBC #$01
    STA [$F0],Y
    JMP Label_15

Label_28
    JSR Label_44
    STA <$FD
    LDY #$01
    LDA [$F0],Y
    AND #$3F
    ORA <$FD
    STA [$F0],Y
    JMP Label_20

Label_29
    JSR Label_44
    STA <$FD
    LDY #$01
    LDA [$F0],Y
    AND #$C0
    ORA <$FD
    STA [$F0],Y
    JMP Label_20

Label_30
    JSR Label_44
    STA <$FD
    LDY #$01
    LDA [$F0],Y
    AND #$F0
    ORA <$FD
    STA [$F0],Y
    JMP Label_20

Label_31
    JSR Label_44
    LDY #$02
    STA [$F0],Y
    JMP Label_20

Label_32
    JSR Label_44
    LDY #$04
    STA [$F0],Y
    JMP Label_20

Label_33
    JSR Label_44
    LDY #$01
    STA [$F0],Y
    JMP Label_20

Label_34
    LDA #$00
    LDX #$02
Label_35
    STA <$F6,X
    DEX
    BPL Label_35
    JMP Label_20

Label_36
    LDX #$00
    BEQ Label_40
Label_37
    LDX #$01
Label_38
    .DB $2C
    
Label_39
    LDX #$02
Label_40
    JSR Label_44
    INC <$F6,X
    CMP <$F6,X
    BNE Label_42
    LDA #$00
    STA <$F6,X
    BEQ Label_41
Label_41
    LDY #$05
    LDA [$F0],Y
    CLC
    ADC #$01
    STA [$F0],Y
    JMP Label_20

Label_42
    JSR Label_44
    LDY #$05
    STA [$F0],Y
    JMP Label_20

Label_43
    LDA <$F4
    ASL A
    TAX
    LDA Label_47,X
    STA <$F2
    LDA Label_47 + 1,X
    STA <$F3
    RTS

Label_44
    LDA <$F4
    LDY #$05
    LDA [$F0],Y
    TAY
    LDA [$F2],Y
    PHA
    INY
    TYA
    LDY #$05
    STA [$F0],Y
    PLA
    RTS

Label_45
    ASL A
    TAY
    INY
    PLA
    STA <$FD
    PLA
    STA <$FE
    LDA [$FD],Y
    TAX
    INY
    LDA [$FD],Y
    STA <$FE
    STX <$FD
    JMP [$00FD]

Label_46
    .DB $07,$F2,$07,$80,$07,$14,$06,$AE,$06,$43,$05,$F4,$05,$9E,$05,$4E
    .DB $05,$02,$04,$BA,$04,$76,$04,$36
    
Label_47
    .DW Label_57
    .DW Label_48
    .DW Label_49
    .DW Label_50
    .DW Label_68
    .DW Label_69
    .DW Label_56
    .DW Label_51
    .DW Label_52
    .DW Label_59
    .DW Label_54
    .DW Label_53
    .DW Label_61
    .DW Label_60
    .DW Label_62
    .DW Label_55
    .DW Label_67
    .DW Label_66
    .DW Label_65
    .DW Label_63
    .DW Label_64
    .DW Label_70
    .DW Label_71
    .DW Label_72
    .DW Label_73
    .DW Label_74
    .DW Label_75
    .DW Label_58
    
Label_48
    .DB $01,$81,$7F,$40,$EF,$68,$1B,$2B,$33,$F0,$02,$06,$33,$43,$53,$F0
    .DB $02,$0C,$43,$53,$04,$F0,$02,$12,$5B,$0C,$1C,$F0,$02,$18,$78,$1C
    .DB $68,$1C,$1C,$1C,$78,$1C,$E8
    
Label_49
    .DB $03,$10,$7F,$08,$78,$1A,$68,$1A,$F1,$03,$07,$78,$32,$68,$32,$F1
    .DB $03,$0E,$78,$42,$68,$42,$F1,$03,$15,$5A,$F1,$03,$19,$0B,$F1,$03
    .DB $1D,$78,$52,$68,$52,$F1,$03,$24,$78,$52,$E8
    
Label_50
    .DB $02,$81,$7F,$40,$78,$51,$68,$51,$F2,$03,$07,$78,$0A,$68,$0A,$F2
    .DB $03,$0E,$78,$1A,$68,$1A,$F2,$03,$15,$32,$F2,$03,$19,$42,$F2,$03
    .DB $1D,$78,$3A,$68,$3A,$F2,$03,$24,$78,$3A,$E8
    
Label_51
    .DB $04,$1F,$7F,$30,$0A,$62,$49,$49,$EA,$1E,$49,$49,$EA,$1D,$49,$49
    .DB $EA,$1C,$49,$49,$EA,$1B,$49,$49,$EA,$1A,$49,$EA,$19,$49,$EA,$18
    .DB $49,$E8
    
Label_52
    .DB $02,$1F,$7F,$30,$62,$00,$01,$00,$EA,$1E,$01,$00,$EA,$1D,$01,$00
    .DB $01,$00,$EA,$1C,$01,$EA,$1B,$00,$EA,$1A,$01,$EA,$19,$00,$E8
    
Label_53
    .DB $02,$20,$7F,$30,$63,$1A,$12,$51,$31,$19,$11,$50,$30,$18,$E8
    
Label_54
    .DB $04,$1F,$7F,$40,$0A,$62,$51,$EA,$1E,$51,$EA,$08,$6A,$51,$E8
    
Label_55
    .DB $01,$8F,$82,$10,$6F,$2C,$E8
    
Label_56
    .DB $02,$80,$7F,$40,$63,$52,$1B,$3B,$53,$4A,$13,$33,$4B,$1B,$3B,$53
    .DB $1C,$3C,$E8
    
Label_57
    .DB $02,$82,$7F,$40,$64,$1B,$2B,$3B,$1C,$2C,$3C,$6C,$53,$E8
    
Label_58
    .DB $02,$82,$7F,$40,$63,$53,$1B,$1C,$3B,$3C,$53,$6A,$54,$E8
    
Label_59
    .DB $02,$60,$7F,$40,$64,$52,$3A,$52,$03,$52,$03,$13,$1B,$E8
    
Label_60
    .DB $02,$D5,$7F,$00,$62,$1C,$1D,$E8
    
Label_61
    .DB $03,$07,$7F,$08,$61,$3A,$13,$22,$E8
    
Label_62
    .DB $02,$40,$7F,$00,$61,$3D,$62,$45,$EA,$10,$28,$E8
    
Label_63
    .DB $02,$80,$7F,$18,$61,$39,$E8
    
Label_64
    .DB $04,$00,$7F,$28,$0A,$61,$28,$E8
    
Label_65
    .DB $02,$8C,$94,$40,$61,$10,$64,$18,$F9,$05
    
Label_66
    .DB $02,$80,$94,$48,$62,$40,$48,$F9,$05
    
Label_67
    .DB $01,$1F,$7F,$28,$61,$22,$42,$5A,$1B,$E8
    
Label_68
    .DB $01,$A0,$7F,$40,$66,$1C,$3C,$1C,$53,$1C,$3C,$05,$72,$54,$E8
    
Label_69
    .DB $02,$90,$7F,$40,$62,$38,$66,$EA,$20,$3B,$53,$3B,$1B,$3B,$53,$1C
    .DB $6A,$14,$E8
    
Label_70
    .DB $01,$B8,$7F,$40,$EF,$65,$0C,$53,$F0,$0C,$05,$0C,$53,$F0,$0C,$0B
    .DB $34,$24,$F0,$08,$10,$EA,$30,$B0,$50,$EA,$20,$9C,$54,$E8
    
Label_71
    .DB $02,$B8,$7F,$40,$65,$43,$33,$F1,$0C,$04,$43,$33,$F1,$0C,$0A,$14
    .DB $4B,$F1,$08,$0F,$EA,$3A,$30,$50,$09,$29,$31,$51,$0A,$2A,$32,$52
    .DB $0B,$2B,$33,$53,$0C,$2C,$9C,$EA,$20,$2C,$E8
    
Label_72
    .DB $03,$00,$7F,$08,$A1,$01,$01,$EE,$15,$6A,$0B,$0B,$0B,$EE,$22,$6F
    .DB $33,$65,$43,$7E,$EE,$33,$53,$6A,$EE,$15,$43,$33,$53,$6F,$EE,$22
    .DB $13,$65,$23,$7E,$EE,$33,$33,$6A,$EE,$15,$23,$13,$4A,$9C,$EE,$FF
    .DB $32,$E8
    
Label_73
    .DB $01,$42,$7F,$40,$66,$1B,$0B,$78,$1B,$68,$52,$42,$32,$1A,$1A,$1A
    .DB $78,$1A,$E8
    
Label_74
    .DB $02,$82,$7F,$40,$66,$52,$52,$78,$52,$68,$32,$2A,$12,$1A,$1A,$1A
    .DB $78,$1A,$E8
    
Label_75
    .DB $03,$10,$7F,$08,$66,$3B,$33,$78,$3B,$68,$1B,$0B,$52,$52,$52,$52
    .DB $78,$52,$E8,$FF
    
;==================================================
Battle_City_Music_Init
    PHA
    JSR Label_0
    PLA
    ASL A
    TAX
    LDY Label_78,X
    LDA Label_78 + 1,X
    TAX
    LDA #$01
Label_77
    STA $0300,Y
    INY
    DEX
    BNE Label_77
    RTS

Label_78
    .DB $01,$03,$15,$03,$18,$03,$00,$01,$04,$02,$06,$01,$07,$01,$08,$01
    .DB $09,$01,$0A,$01,$0B,$01,$0C,$01,$0D,$01,$0E,$01,$0F,$01,$10,$01
    .DB $11,$01,$12,$01,$13,$01,$14,$01,$1B,$01
    
