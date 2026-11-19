
;==================================================
;获取文本信息
Get_Text_Data_Info
    CMP Text_Info_Count
    BCS .End_Invalid
    ASL
    TAY
    
    ;获取信息地址
    LDA Data_Addr_L
    PHA
    LDA Data_Addr_H
    PHA
    
    LDA Text_Info_Index_L
    STA Data_Addr_L
    LDA Text_Info_Index_H
    STA Data_Addr_H
    
    LDA [Data_Addr_L],Y
    STA Data_Index_L
    INY
    LDA [Data_Addr_L],Y
    STA Data_Index_H
    
    PLA
    STA Data_Addr_H
    PLA
    STA Data_Addr_L
    
    ;没有信息则跳过
    LDA Data_Index_L
    ORA Data_Index_H
    BEQ .End_Invalid

    ;取得文本数据
    LDY #$02
    LDA [Data_Index_L],Y
    STA Data_Addr_L
    INY 
    LDA [Data_Index_L],Y
    STA Data_Addr_H
    
    ;文本长度为0则跳过
    LDY #$00
    LDA [Data_Addr_L],Y
    BEQ .End_Invalid
    STA Data_Cnt
    
    ;取得显示地址
    LDY #$00
    LDA [Data_Index_L],Y
    STA Item_Text_PPU_Addr_L
    INY
    LDA [Data_Index_L],Y
    STA Item_Text_PPU_Addr_H
    
    ;检查显示模式
    LDY #$04
    LDA [Data_Index_L],Y
    BEQ .End
    
    ;设置居中显示
    LDA #$20
    SEC
    SBC Data_Cnt
    LSR A 
    STA Data_Buf
    LDA Item_Text_PPU_Addr_L
    AND #$E0
    CLC
    ADC Data_Buf
    STA Item_Text_PPU_Addr_L
.End
    SEC
    RTS
    
.End_Invalid
    CLC
    RTS

;==================================================
;以缓冲方式显示文本
Write_Text_By_Buffer

    STA Data_Buf
    LDA Prg_Bank_A000_Bak
    PHA
    LDA Text_Bank
    JSR Switch_Bank_A000_A
    
    LDA Data_Buf
    JSR Get_Text_Data_Info
    BCC .End
    
    LDX PPU_Buf_Pos
    LDA #PPU_MODE_CNT_LINE
    STA PPU_Data_Buf,X
    INX
    LDA Item_Text_PPU_Addr_H
    STA PPU_Data_Buf,X
    INX
    LDA Item_Text_PPU_Addr_L
    STA PPU_Data_Buf,X
    INX
    LDA Data_Cnt
    STA PPU_Data_Buf,X
    INX
    
    LDY #$01
.Write
    LDA [Data_Addr_L],Y
    STA PPU_Data_Buf,X
    INX
    INY
    DEC Data_Cnt
    BNE .Write
    STX PPU_Buf_Pos
    
.End

    PLA
    JSR Switch_Bank_A000_A
    
    RTS

;==================================================
;以缓冲方式清除文本
Clear_Text_By_Buffer

    STA Data_Buf
    LDA Prg_Bank_A000_Bak
    PHA
    LDA Text_Bank
    JSR Switch_Bank_A000_A
    
    LDA Data_Buf
    JSR Get_Text_Data_Info
    BCC .End
    
    LDX PPU_Buf_Pos
    LDA #PPU_MODE_CNT_CLEAR
    STA PPU_Data_Buf,X
    INX
    LDA Item_Text_PPU_Addr_H
    STA PPU_Data_Buf,X
    INX
    LDA Item_Text_PPU_Addr_L
    STA PPU_Data_Buf,X
    INX
    LDA Data_Cnt
    STA PPU_Data_Buf,X
    INX
    STX PPU_Buf_Pos

.End
    PLA
    JSR Switch_Bank_A000_A
    
    RTS

;==================================================
;以数据方式显示文本
Write_Text_By_Data

    STA Data_Buf
    LDA Prg_Bank_A000_Bak
    PHA
    LDA Text_Bank
    JSR Switch_Bank_A000_A
    
    LDA Data_Buf
    JSR Get_Text_Data_Info
    BCC .End
    
    LDA Item_Text_PPU_Addr_H
    STA PPU_ADDRESS
    LDA Item_Text_PPU_Addr_L
    STA PPU_ADDRESS
    
    LDY #$00
    LDA [Data_Addr_L],Y
    TAX
    INY

.Write
    LDA [Data_Addr_L],Y
    STA PPU_DATA
    INY
    DEX
    BNE .Write


.End

    PLA
    JSR Switch_Bank_A000_A
    
    RTS

;==================================================
;以数据方式清除文本
Clear_Text_By_Data

    STA Data_Buf
    LDA Prg_Bank_A000_Bak
    PHA
    LDA Text_Bank
    JSR Switch_Bank_A000_A
    
    LDA Data_Buf
    JSR Get_Text_Data_Info
    BCC .End
    
    LDA Item_Text_PPU_Addr_H
    STA PPU_ADDRESS
    LDA Item_Text_PPU_Addr_L
    STA PPU_ADDRESS
    
    LDY #$00
    LDA [Data_Addr_L],Y
    TAX
    
    LDA #$00
.Write
    STA PPU_DATA
    DEX
    BNE .Write

.End

    PLA
    JSR Switch_Bank_A000_A
    
    RTS

;==================================================
Init_Text_By_Data
    ;备份并切换数据bank
    LDA Prg_Bank_A000_Bak
    PHA
    LDA Text_Bank
    JSR Switch_Bank_A000_A
    
    LDA #$00
    STA Data_Index
    LDA Text_Info_Count
    BEQ .End
    
.Write_Text
    LDA Data_Index
    JSR Get_Text_Data_Info
    BCC .Continue
    
    ;非缓冲时不处理调色板
    LDA Item_Text_PPU_Addr_H
    CMP #$3F
    BCS .Continue
    
    LDA Item_Text_PPU_Addr_H
    STA PPU_ADDRESS
    LDA Item_Text_PPU_Addr_L
    STA PPU_ADDRESS
    
    LDY #$00
    LDA [Data_Addr_L],Y
    TAX
    INY

.Write
    LDA [Data_Addr_L],Y
    STA PPU_DATA
    INY
    DEX
    BNE .Write
    
.Continue
    INC Data_Index
    LDA Data_Index
    CMP Text_Info_Count
    BCC .Write_Text

.End

    ;恢复bank
    PLA
    JSR Switch_Bank_A000_A
    RTS
