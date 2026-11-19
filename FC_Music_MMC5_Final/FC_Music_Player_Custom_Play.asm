    .BANK PRG_DATA_BANK_E000 & BANK_DATA_MASK
    .ORG $F000

;==================================================
Final_Mission_Init
    INCLUDE "music_data/Final Mission/music_init.asm"
	
;==================================================
Ninja_Gaiden_Init
    INCLUDE "music_data/Ninja Gaiden/music_init.asm"

;==================================================
Crisis_Force_Init
    INCLUDE "music_data/Crisis Force/music_init.asm"
	
;==================================================
Crisis_Force_Play
    INCLUDE "music_data/Crisis Force/music_play.asm"
	
;==================================================
Tournament_Fighters_Init
    INCLUDE "music_data/Tournament Fighters/music_init.asm"
    
;==================================================
Dragon_Fighter_Init
    INCLUDE "music_data/Dragon Fighter/music_init.asm"

;==================================================
Island_Init
    CMP #$0E
    BCC .Label_1
    SBC #$0D
    STA <$A0
    RTS

.Label_1
    STA <$AB
    INC <$AB
    LDA #$00
    STA <$AC
    RTS
    
Island_Play
    LDA <$AB
    CMP #$00
    BEQ .Label_3
    JMP $C876

.Label_3
    JMP $C639

;==================================================
Island_2_Init
    TAX
    LDA .Data,X
    JMP $A7F9
.Data
    .HEX 40 49 43 41 42 44 45 46 47 48 4A 4B 4C 4D 4E 4F
    .HEX 50 51 52 53 54 55 56 57 58 5A 59 05 07 08 17 19
    .HEX 1A 1C 1D 1F 22 26 2B 2C 2D 31 32 37 38 39 3B 3D
    .HEX 3E 3F

Island_2_Play
    JMP $A89C

;==================================================
Island_3_Init
    TAX
    LDA .Data,X
    JMP $A9B4
.Data
    .HEX 09 40 49 43 42 44 45 46 47 48 4A 4B 4D 4F 50 51
    .HEX 52 53 54 55 56 57 5D 5F 60 59 3D 3E 39 05 06 07
    .HEX 07 08 19 1A 1D 1F 1F 20 22 2A 2B 2C 2D 31 32 37
    .HEX 38 3B 3F
Island_3_Play
    JMP $AA57

;==================================================
Island_4_Init
    CMP #$15
    BPL .Label_1
    CLC
    ADC #$41
    JMP $8006
.Label_1
    CMP #$15
    BNE .Label_2
    CLC
    SBC #$22
    JMP $8006
.Label_2
    CLC
    SBC #$15
    JMP $8006
    
Island_4_Play
    JMP $8009

;==================================================
Battletoads_Init
    CMP #.Data_39 - .Data_32
    BCS .Play_39
    TAX
    LDA .Data_32,X
    STA $32
    JMP $8003
.Play_39
    SEC
    SBC #.Data_39 - .Data_32
    TAX
    LDA .Data_39,X
    STA $39
    JMP $800C

.Data_32
    ;.HEX 10 03 04 01 02 05 06 07 08 09 0A 0B 0C 0D 0E 0F 11 12 13 14 15
    .HEX 10 12 0A 03 04 01 0E 0C 0F 08 09 11 13 0D 0B 14
    
.Data_39
    .HEX 30 89 6C 16 7B 12 14 46 58 24 A4 1E 56 AB 98 A9 A1 83
    
    
;==================================================
Battletoads_Play
    JMP $8855

;==================================================
Battletoads_Loop
    LDA $40
    BPL .End
    
    LDA PCM_Play_Addr_L
    CMP #<Battletoads_Loop
    BNE .End
    LDA PCM_Play_Addr_H
    CMP #>Battletoads_Loop
    BNE .End
    
    LDA Music_Play_Flag
    ORA #MUSIC_FLAG_PCM_EXIST
    STA Music_Play_Flag
    
    LDA Prg_Bank_8000
    STA Prg_Bank_8000_Bak
    MACRO_SWITCH_BANK_8000_A
    
    LDA Music_Play_Flag
    ORA #MUSIC_FLAG_PCM_RUNNING
    STA Music_Play_Flag
    
    JSR $852B
    
    LDA Music_Play_Flag
    AND #((MUSIC_FLAG_PCM_RUNNING) ^ 0xFF)
    STA Music_Play_Flag
.End
    RTS
    
;==================================================
Battletoads_And_DD_Init
    TAX
    LDA .Data_39,X
    STA $39
    JSR $8C5E
    RTS

.Data_39
    .HEX 0E 08 02 0D 01 0C 04 06 0A 10 2E 2F 13 14 15 16 
    .HEX 17 26 27 28 2A 2B 2C 30 31 32 33 34 35 36 37 09
    .HEX 29 0F
    
;==================================================
Battletoads_And_DD_Play
    JMP $8CC8

;==================================================
Battletoads_And_DD_Loop
    LDA $46
    BPL .End
    
    LDA PCM_Play_Addr_L
    CMP #<Battletoads_And_DD_Loop
    BNE .End
    LDA PCM_Play_Addr_H
    CMP #>Battletoads_And_DD_Loop
    BNE .End
    
    LDA Music_Play_Flag
    ORA #MUSIC_FLAG_PCM_EXIST
    STA Music_Play_Flag
    
    LDA Prg_Bank_8000
    STA Prg_Bank_8000_Bak
    MACRO_SWITCH_BANK_8000_A
    LDA Music_Play_Flag
    ORA #MUSIC_FLAG_PCM_RUNNING
    STA Music_Play_Flag
    
    JSR $8977
    ;LDA $46
    ;AND #$7F
    ;STA $46
    ;LDX $46
    ;LDA #$0F
    ;STA $4010
    ;LDA .Dmc_Addr,X
    ;STA $4012
    ;LDA .Dmc_Length,X
    ;STA $4013
    ;LDA #$1F
    ;STA $4015
    
    LDA Music_Play_Flag
    AND #((MUSIC_FLAG_PCM_RUNNING) ^ 0xFF)
    STA Music_Play_Flag
.End
    RTS
    
.Dmc_Addr
    .DB 0
    .DB ($D000 - $C000) / $40
    .DB ($D400 - $C000) / $40
    .DB 0
    .DB ($D800 - $C000) / $40
.Dmc_Length
    .DB 0
    .DB $34
    .DB $1D
    .DB 0
    .DB $25
    
;==================================================
Battletoads_JMP
    LDA ($37),Y
    STA $3F
    
    LDA $40
    BPL .End
    LDA $3F
    BEQ .End
    DEC $3F
.End
    JMP $88C1
    
Battletoads_And_DD_JMP
    LDA ($3D),Y
    STA $45
    
    LDA $46
    BPL .End
    LDA $45
    BEQ .End
    DEC $45
.End
    JMP $8D5A
    
;==================================================
Double_Dragon_Bar
    PHA
    LDA $07BA
    CLC
    ADC #<Sound_Bar_Cur
    STA Data_Addr_L
    LDA #>Sound_Bar_Cur
    STA Data_Addr_H
    PLA
    STY Reg_Y_Bak
    LDY #$00
    STA [Data_Addr_L],Y
    LDY Reg_Y_Bak
    JMP $07B9
    
;==================================================
Double_Dragon_2_Bar
    PHA
    LDA $07F1
    CLC
    ADC #<Sound_Bar_Cur
    STA Data_Addr_L
    LDA #>Sound_Bar_Cur
    STA Data_Addr_H
    PLA
    STY Reg_Y_Bak
    LDY #$00
    STA [Data_Addr_L],Y
    LDY Reg_Y_Bak
    JMP $07F0

;==================================================
Double_Dragon_3_Bar
    PHA
    LDA $07F1
    CLC
    ADC #<Sound_Bar_Cur
    STA Data_Addr_L
    LDA #>Sound_Bar_Cur
    STA Data_Addr_H
    PLA
    STY Reg_Y_Bak
    LDY #$00
    STA [Data_Addr_L],Y
    LDY Reg_Y_Bak
    JMP $07F0
    
    .BANK BANK(Double_Dragon_8000) & BANK_DATA_MASK
    .ORG $873C
    JMP Double_Dragon_Bar
    
    .BANK BANK(Double_Dragon_2_8000) & BANK_DATA_MASK
    .ORG $884E
    JMP Double_Dragon_2_Bar
    
    .BANK BANK(Double_Dragon_3_8000) & BANK_DATA_MASK
    .ORG $883E
    JMP Double_Dragon_3_Bar

    .BANK BANK(Double_Dragon_3_8000) & BANK_DATA_MASK
    .ORG $883E
    JMP Double_Dragon_3_Bar

    .BANK BANK(Battletoads_8000) & BANK_DATA_MASK
    .ORG $8DE6
    JMP Battletoads_JMP
    NOP
    
    .BANK BANK(Battletoads_And_DD_8000) & BANK_DATA_MASK
    .ORG $93A9
    JMP Battletoads_And_DD_JMP
    NOP
    
    .BANK (BANK(Island_2_8000) + 1) & BANK_DATA_MASK
    .ORG $A8BB
    LDA #$00
    .ORG $A8D1
    LDA #$00
    
    .BANK (BANK(Island_3_8000) + 1) & BANK_DATA_MASK
    .ORG $AA76
    LDA #$00
    .ORG $AA8C
    LDA #$00
