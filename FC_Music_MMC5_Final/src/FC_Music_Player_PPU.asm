;==================================================
;PPU处理
PPU_Pre_Proc
    LDA Music_Ram_Clear_Cnt
    BPL PPU_Pre_Proc_End
    JSR FC_PPU_Buffer_Process
PPU_Pre_Proc_End
    JSR FC_PPU_Reset_Scroll
    RTS
    
;==================================================
PPU_MODE_CNT_LINE         = $FE    ;行计数写入
PPU_MODE_CNT_CLEAR        = $FC    ;行计数清除
;==================================================

;==================================================
FC_PPU_Reset_Scroll
    LDA #$00
    STA PPU_ADDRESS
    STA PPU_ADDRESS
    LDA Scroll_H
    STA PPU_SCROLL
    LDA Scroll_V
    STA PPU_SCROLL
    LDA PPU_Mask_Buf
    STA PPU_MASK
    RTS

;PPU缓冲处理
FC_PPU_Buffer_Process
    LDX PPU_Buf_Pos
    LDA #$00
    STA PPU_Buf_Pos
    STA PPU_Data_Buf,X
    LDA PPU_Data_Buf
    BEQ .End
    JSR .PPU_Proc_Beg
    
.End
    .IF UPDATE_PALETTE_ENABLE
        .IF 0 = COVER_ENABLE
            JSR Update_Palette_Color
        .ENDIF
    .ENDIF
    
    JSR FC_PPU_Reset_Scroll
    
    LDA Menu_Proc_Flag
    AND #(MENU_PROC_BAR | MENU_PROC_TIME | MENU_PROC_ITEM | MENU_PROC_SCROLL) ^ $FF
    STA Menu_Proc_Flag
    RTS
    
;------------------------------
.PPU_Proc_Beg  ;处理开始
    LDX #$00
    STX PPU_MASK
;------------------------------
.Mode_Select  ;模式选择
    LDA PPU_Data_Buf,X
    CMP #PPU_MODE_CNT_LINE
    BEQ .Line_Mode
    CMP #PPU_MODE_CNT_CLEAR
    BEQ .Clear_Mode
    BNE .End
;------------------------------
.Line_End  ;单行写入结束
    INX
    LDA PPU_Data_Buf,X
    BNE .Mode_Select
    STA PPU_Data_Buf
    BEQ .End
    
.Clear_Mode
    INX
    LDA PPU_Data_Buf,X
    STA PPU_ADDRESS
    INX
    LDA PPU_Data_Buf,X
    STA PPU_ADDRESS
    INX
    LDY PPU_Data_Buf,X
    LDA #$00
.Clear_Write
    STA PPU_DATA
    DEY
    BNE .Clear_Write
    BEQ .Line_End

.Line_Mode
    INX
    LDA PPU_Data_Buf,X
    STA PPU_ADDRESS
    INX
    LDA PPU_Data_Buf,X
    STA PPU_ADDRESS
    INX
    LDY PPU_Data_Buf,X
.Line_Write
    INX
    LDA PPU_Data_Buf,X
    STA PPU_DATA
    DEY
    BNE .Line_Write
    BEQ .Line_End

    .IF UPDATE_PALETTE_ENABLE
;==============================
Update_Palette_Color;更新调色板颜色
    LDA Menu_Proc_Flag
    AND #MENU_PROC_PALETTE
    BNE Update_Palette_Color_End
    LDA #$3F
    STA PPU_ADDRESS
    LDA #$0D
    STA PPU_ADDRESS
    LDA PPU_Palette_Buf + $0D
    STA PPU_DATA
    LDA #$3F
    STA PPU_ADDRESS
    LDA #$11
    STA PPU_ADDRESS
    LDA PPU_Palette_Buf + $11
    STA PPU_DATA
Update_Palette_Color_End
    RTS
    .ENDIF

    .IF EXTENDED_ATTRIBUTES_ENABLE
;==============================
Set_NameTable_Attributes_Ex;设置命名表属性
    
    .IF EXTENDED_ATTR_DATA_BANK
        LDA Prg_Bank_A000_Bak
        PHA
        LDA #EXTENDED_ATTR_DATA_BANK & BANK_DATA_MASK
        JSR Switch_Bank_A000_A
    .ENDIF

    LDA #$5C
    STA Data_Index_H
    LDA #$00
    STA Data_Index_L
    
    LDA #<Palette_Attributes_Ex
    STA Data_Addr_L
    LDA #>Palette_Attributes_Ex
    STA Data_Addr_H
    
    LDY #$00
    LDX #$04
.Write
    LDA [Data_Addr_L],Y
    STA [Data_Index_L],Y
    INY
    BNE .Write
    INC Data_Addr_H
    INC Data_Index_H
    DEX
    BNE .Write
    
    .IF EXTENDED_ATTR_DATA_BANK
        PLA
        JSR Switch_Bank_A000_A
    .ENDIF

    RTS

    .ENDIF
;==============================
Set_NameTable_Attributes;设置命名表属性
    BIT PPU_STATUS
    LDA #$23
    STA PPU_ADDRESS
    LDA #$C0
    STA PPU_ADDRESS
    LDX #$00
    LDY #$40
.Write_2000
    LDA Palette_Attributes_2000,X
    STA PPU_DATA
    INX
    DEY
    BNE .Write_2000
    
.Set_Attributes_2400;设置命名表属性
    BIT PPU_STATUS
    LDA #$27
    STA PPU_ADDRESS
    LDA #$C0
    STA PPU_ADDRESS
    LDX #$00
    LDY #$40
.Write_2400
    LDA Palette_Attributes_2400,X
    STA PPU_DATA
    INX
    DEY
    BNE .Write_2400
    RTS

;==============================
Init_Palette_Color;初始化调色板数据
    BIT PPU_STATUS
    LDA #$3F
    STA PPU_ADDRESS
    LDA #$00
    STA PPU_ADDRESS
    LDX #$00
    LDY #$20
.Write
    LDA Palette_Data,X
    STA PPU_DATA
    INX
    DEY
    BNE .Write
    RTS

;==============================
Init_Palette_Buffer;初始化调色板数据
    LDX #$1F
Init_Palette_Buffer_Write
    LDA Palette_Data,X
    STA PPU_Palette_Buf,X
    DEX
    BPL Init_Palette_Buffer_Write
    RTS

;==================================================
;通过PPU缓冲方式写入文本并指定文本起始字符和显示宽度
;--------------------------------------------------
;前提: 需要先设置滚动所需参数
;参数1    FC_Data_Index_L 文本显示地址低位
;参数2    FC_Data_Index_H 文本显示地址高位
;参数3    FC_Data_Addr_L  文本数据地址低位
;参数4    FC_Data_Addr_H  文本数据地址高位
;参数5    FC_Data_Count_L 滚动计数器地址低位
;参数6    FC_Data_Count_H 滚动计数器地址高位
;参数7    FC_Data_Count   滚动区域字符宽度(0-128)
;--------------------------------------------------
;返回1    FC_Data_Result  滚动结束则 FC_Data_Result = 1
;--------------------------------------------------
;例如
;   LDA #>$2080
;   STA FC_Data_Index_H
;   LDA #<$2080
;   STA FC_Data_Index_L
;   
;   LDA #<Text_Scroll_Data
;   STA FC_Data_Addr_L
;   LDA #>Text_Scroll_Data
;   STA FC_Data_Addr_H
;
;   LDA #<$80
;   STA FC_Data_Count_L
;   LDA #>$80
;   STA FC_Data_Count_H
;   
;   LDA #64
;   STA FC_Data_Count
;   
;   JSR PPU_Write_Text_Buf_By_Scroll_Index
;--------------------------------------------------
PPU_Write_Text_Buf_By_Scroll_Index
    LDA FC_Data_Count
    BEQ .End
    
    LDA FC_Data_Index
    PHA
    
    LDY #$00
    LDA [FC_Data_Count_L],Y
    STA FC_Data_Index
    
    ;获取文本长度
    LDY #$00
    LDA [FC_Data_Addr_L],Y
    STA FC_Data_Length
    
    ;检查重置起始显示字符
    LDA #$00
    STA FC_Data_Result
    
    LDA FC_Data_Length
    CLC
    ADC FC_Data_Count
    BCS .Text_Index_Reset_End
    CMP FC_Data_Index
    BCS .Text_Index_Reset_End
.Text_Index_Reset
    LDA #$00
    STA FC_Data_Index
    LDA #$01
    STA FC_Data_Result
    PLA
    STA FC_Data_Index
    RTS
.Text_Index_Reset_End

    LDX FC_PPU_Buf_Count
    
    LDA #PPU_MODE_CNT_LINE
    STA FC_PPU_Buf_Addr,X
    INX
    
    ;设置PPU地址高位
    LDA FC_Data_Index_H
    STA FC_PPU_Buf_Addr,X
    INX

    ;设置PPU地址低位
    LDA FC_Data_Index_L
    STA FC_PPU_Buf_Addr,X
    INX
    
    ;设置PPU显示字符数量
    LDA FC_Data_Count
    STA FC_PPU_Buf_Addr,X
    INX
    
    JSR .Write_Scroll_Text_Buf
    STX FC_PPU_Buf_Count
    INC FC_Data_Index
    
    LDY #$00
    LDA FC_Data_Index
    STA [FC_Data_Count_L],Y
    
    PLA
    STA FC_Data_Index
    
.End
    RTS

;--------------------------------------------------
;滚动文本缓冲
.Write_Scroll_Text_Buf
    LDA FC_Data_Count
    STA FC_Data_Buf
    
    ;检查是否需要在文本前填充空字符
    LDA FC_Data_Index
    CMP FC_Data_Count
    BCS .Write_Text_Begin

    ;获取文本前填充字符数量
    LDA FC_Data_Count
    SEC
    SBC FC_Data_Index
    TAY
    
    ;填充空字符
    LDA #$00
.Write_Empty_Data
    STA FC_PPU_Buf_Addr,X
    INX
    DEC FC_Data_Buf
    DEY
    BNE .Write_Empty_Data

;开始写入文本
.Write_Text_Begin
    LDA FC_Data_Index
    CMP FC_Data_Count
    BCS .Write_Update_Data_Index
    LDA #$00
    BEQ .Write_Start
.Write_Update_Data_Index
    SEC
    SBC FC_Data_Count
.Write_Start
    TAY
    INY
    
    LDA FC_Data_Buf
    BEQ .Write_End
    
    INC FC_Data_Length
    
.Write_Text_Data
    CPY FC_Data_Length
    BCC .Write_Text_Char_Data

    ;尾部补上空字符
    LDA #$00
    LDY FC_Data_Buf
.Write_Empty_Char
    STA FC_PPU_Buf_Addr,X
    INX
    DEY
    BNE .Write_Empty_Char
    RTS
    
    ;写入文本字符
.Write_Text_Char_Data
    LDA [FC_Data_Addr_L],Y
.Write_Text_Set_Data
    STA FC_PPU_Buf_Addr,X
    INX
    INY
    DEC FC_Data_Buf
    BNE .Write_Text_Data
.Write_End
    RTS
