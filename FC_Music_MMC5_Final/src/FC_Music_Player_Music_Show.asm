;==============================
    .IF Track_Name_Pos;显示曲目信息

;==============================
Show_Track_Name_Check;检测是否有曲目名
    STA Data_Index
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    ASL A
    TAY
    
    ;获取曲名索引表
    LDA Track_Name_Addr_Port,Y
    PHA
    INY
    LDA Track_Name_Addr_Port,Y
    STA <Data_Addr_H
    PLA
    STA <Data_Addr_L
    
    ;检查曲名数量
    LDY #$00
    LDA [Data_Addr_L],Y
    STA Data_Cnt
    BEQ .Invalid
    
    ;获取曲名数据
    LDA Data_Index
    CMP Data_Cnt
    BCS .Invalid
    ASL A
    TAY
    INY
    LDA [Data_Addr_L],Y
    PHA
    INY
    LDA [Data_Addr_L],Y
    STA <Data_Addr_H
    PLA
    STA <Data_Addr_L
    
    LDA <Data_Addr_H
    ORA <Data_Addr_L
    BEQ .Invalid
    
    ;检查曲名长度
    LDY #$00
    LDA [Data_Addr_L],Y
    BEQ .Invalid

.Valid
    SEC
    LDA Data_Index
    RTS
    
.Invalid
    CLC
    LDA Data_Index
    RTS

;==============================
Show_Get_Track_Name_Pos;
    PHA
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    ASL A
    TAY
    LDA Track_Name_Addr_Port,Y
    PHA
    INY
    LDA Track_Name_Addr_Port,Y
    STA <Data_Addr_H
    PLA
    STA <Data_Addr_L
    PLA
    
    ASL A
    TAY
    INY
    LDA [Data_Addr_L],Y
    PHA
    INY
    LDA [Data_Addr_L],Y
    STA Data_Addr_H
    PLA
    STA Data_Addr_L
    
    LDY #$00
    STY Item_Text_Data_Count
    LDA [Data_Addr_L],Y
    STA Track_Name_Length
    CMP #TRACK_NAME_SCROLL_LENGTH
    BCC .Center_Show
    LDA Track_Name_Length
    SEC
    SBC #32 - (Track_Name_Pos&0x1F)
    STA Item_Text_Data_Count
    LDA #32 - (Track_Name_Pos&0x1F)
    
.Update_Count
    STA Data_Cnt
    
    LDA #HIGH(Track_Name_Pos)
    STA PPU_Data_Buf,X
    ORA #$08
    STA Item_Text_PPU_Addr_H
    INX
    LDA #LOW(Track_Name_Pos)
    STA PPU_Data_Buf,X
    AND #$E0
    STA Item_Text_PPU_Addr_L
    INX
    LDA Data_Cnt
    STA PPU_Data_Buf,X
    INX
    RTS
    
.Center_Show
    LDY #$00
    LDA [Data_Addr_L],Y
    STA Track_Name_Length
    STA Data_Cnt
    
    LDA #$20
    SEC
    SBC Data_Cnt
    LSR A
    STA Data_Buf
    
    LDA #HIGH(Track_Name_Pos)
    STA PPU_Data_Buf,X
    INX
    LDA #LOW(Track_Name_Pos)
    AND #$E0
    CLC
    ADC Data_Buf
    STA PPU_Data_Buf,X
    INX
    LDA Data_Cnt
    STA PPU_Data_Buf,X
    INX
    RTS
    
;==============================
;设置PPU模式和地址
Set_Name_PPU_Mode_And_Addr
    STA PPU_Data_Buf,X
    INX
    LDA Item_Text_PPU_Addr_H
    STA PPU_Data_Buf,X
    INX
    LDA Item_Text_PPU_Addr_L
    STA PPU_Data_Buf,X
    INX
    LDA Item_Text_Data_Count
    STA PPU_Data_Buf,X
    INX
    RTS

;==============================
;检查曲目名索引
Check_Track_Name_Port
    JSR Get_Collection_Order
    ASL A
    TAY
    LDA Track_Name_Addr_Port,Y
    ORA Track_Name_Addr_Port + 1,Y
    BEQ .End_Invalid
    SEC
    RTS
.End_Invalid
    CLC
    RTS

;==============================
;清除曲目名
Clear_Track_Name
    JSR Show_Track_Name_Check
    BCC .End
    PHA
    LDA Music_Item_Cur
    JSR Check_Track_Name_Port
    BCC .End_Nothing
    
    LDX PPU_Buf_Pos
    LDA #PPU_MODE_CNT_CLEAR
    STA PPU_Data_Buf,X
    INX
    PLA
    JSR Show_Get_Track_Name_Pos
    
    LDA Item_Text_Data_Count
    BEQ .Write_End
   
    LDA #PPU_MODE_CNT_CLEAR
    JSR Set_Name_PPU_Mode_And_Addr
.Write_End
    STX PPU_Buf_Pos
.End
    RTS
.End_Nothing
    PLA
    RTS
    
;==============================
;写入曲目名
Write_Track_Name
    JSR Show_Track_Name_Check
    BCC .End
    PHA
    LDA Music_Item_Cur
    JSR Check_Track_Name_Port
    BCC .End_Nothing
    
    LDX PPU_Buf_Pos
    LDA #PPU_MODE_CNT_LINE
    STA PPU_Data_Buf,X
    INX
    PLA
    JSR Show_Get_Track_Name_Pos
.Write
    INY
    LDA [Data_Addr_L],Y
    
    CONVERT_TO_UPPERCASE
    
    STA PPU_Data_Buf,X
    INX
    DEC Data_Cnt
    BNE .Write
    
    LDA Item_Text_Data_Count
    BEQ .Write_End
    STA Data_Cnt
    
    LDA #PPU_MODE_CNT_LINE
    JSR Set_Name_PPU_Mode_And_Addr
    LDA #$00
    STA Item_Text_Data_Count
    BEQ .Write
    
.Write_End
    STX PPU_Buf_Pos
    
.End
    
    RTS
.End_Nothing
    PLA
    RTS
    
;==============================
Clear_Last_Music_Last_Track_Name
    LDX Music_Item_Last
    LDA Music_Track_Cur,X
    
    JSR Clear_Track_Name
    RTS
    
;==============================
Write_Cur_Music_Cur_Track_Name
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    
    JSR Write_Track_Name
    RTS
    
;==============================
Clear_Last_Track_Name
    .IF MUSIC_NAME_BANK
    LDA Music_Item_Last
    JSR Get_Collection_Order
    TAX
    LDA Music_Name_Bank_Index,X
    BEQ .End
    
    LDA Prg_Bank_A000_Bak
    PHA
    
    LDA Music_Item_Last
    JSR Get_Collection_Order
    TAX
    LDA Music_Name_Bank_Index,X
    JSR Switch_Bank_A000_A
    .ENDIF
    
    JSR Clear_Last_Music_Last_Track_Name
    
    .IF MUSIC_NAME_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
.End
    RTS

;==============================
Show_Cur_Track_Name
    .IF MUSIC_NAME_BANK
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    TAX
    LDA Music_Name_Bank_Index,X
    BEQ .End
    
    LDA Prg_Bank_A000_Bak
    PHA
    
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    TAX
    LDA Music_Name_Bank_Index,X
    JSR Switch_Bank_A000_A
    .ENDIF
    
    ;JSR Clear_Last_Music_Last_Track_Name
    JSR Write_Cur_Music_Cur_Track_Name
    
    .IF MUSIC_NAME_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
.End
    RTS

    .ENDIF

;==================================================
Clear_Cur_Music_Last_Track_Name
    .IF Track_Name_Pos
    .IF MUSIC_NAME_BANK
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    TAX
    LDA Music_Name_Bank_Index,X
    BEQ .End
    
    LDA Prg_Bank_A000_Bak
    PHA
    
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    TAX
    LDA Music_Name_Bank_Index,X
    JSR Switch_Bank_A000_A
    .ENDIF
    
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    JSR Clear_Track_Name
    
    .IF MUSIC_NAME_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
.End

    .ENDIF
    RTS


;==============================
    .IF MUSIC_SHOW_INFO_ENABLE;显示音乐集信息
    
;==============================
Get_Music_Info_Check
    TYA
    PHA
    CLC
    ADC #$02
    TAY
    LDA [Data_Addr_L],Y
    STA Data_Cnt
    BEQ .Invalid
    
.Valid
    PLA
    TAY
    SEC
    RTS
    
.Invalid
    PLA
    CLC
    RTS
    
;==============================
;居中显示
Get_PPU_Addr_Center_Pos
    INY
    LDA [Data_Addr_L],Y
    STA PPU_Data_Buf,X
    INX
    DEY
    LDA [Data_Addr_L],Y
    STA PPU_Data_Buf,X
    INX
    INY
    INY
    LDA [Data_Addr_L],Y
    STA PPU_Data_Buf,X
    INX
    STA Data_Cnt
    
    .IF MUSIC_SHOW_INFO_CENTER
    DEX
    DEX
    LDA #$20
    SEC
    SBC Data_Cnt
    LSR A
    STA Data_Buf

    LDA PPU_Data_Buf,X
    AND #$E0
    CLC
    ADC Data_Buf
    STA PPU_Data_Buf,X
    INX
    INX
    .ENDIF
    
    RTS
    
;==============================
;获取音乐信息
Get_Music_Info_Data
    JSR Get_Collection_Order
    ASL A
    TAY
    LDA Music_Info_Addr_Port,Y
    ORA Music_Info_Addr_Port + 1,Y
    BEQ .End_Invalid
    LDA Music_Info_Addr_Port,Y
    STA Data_Addr_L
    LDA Music_Info_Addr_Port + 1,Y
    STA Data_Addr_H
    SEC
    RTS

.End_Invalid
    CLC
    RTS

;==============================
;清除上次显示的音乐信息
Clear_Music_Info
    LDX PPU_Buf_Pos
    
    JSR Get_Music_Info_Data
    BCC .End
    
    LDX PPU_Buf_Pos
    LDY #$00
.Write_Data_Check
    LDA [Data_Addr_L],Y
    INY
    ORA [Data_Addr_L],Y
    BEQ .End
    DEY
    JSR Get_Music_Info_Check
    BCC .Continue
    LDA #PPU_MODE_CNT_CLEAR
    STA PPU_Data_Buf,X
    INX
    
    ;居中显示
    JSR Get_PPU_Addr_Center_Pos

.Continue
    INY
    TYA
    CLC
    ADC Data_Cnt
    TAY
    BNE .Write_Data_Check
.End
    STX PPU_Buf_Pos
    RTS

;==============================
;写入显示音乐信息
Write_Music_Info
    LDX PPU_Buf_Pos
    
    JSR Get_Music_Info_Data
    BCC .End
    
    LDX PPU_Buf_Pos
    LDY #$00
.Write_Data_Check
    LDA [Data_Addr_L],Y
    INY
    ORA [Data_Addr_L],Y
    BEQ .End
    DEY
    JSR Get_Music_Info_Check
    BCS .Valid
    INY
    BNE .Write_Data_Check
.Valid
    LDA #PPU_MODE_CNT_LINE
    STA PPU_Data_Buf,X
    INX
    
    ;居中显示
    JSR Get_PPU_Addr_Center_Pos
    
    INY
.Write_PPU_Buffer
    LDA [Data_Addr_L],Y
    CONVERT_TO_UPPERCASE
    STA PPU_Data_Buf,X
    INX
    INY
    DEC Data_Cnt
    BNE .Write_PPU_Buffer
    BEQ .Write_Data_Check
.End
    STX PPU_Buf_Pos
    RTS
    
;==============================
;显示专辑信息
Show_Music_Info

    .IF MUSIC_INFO_BANK
    LDA Prg_Bank_A000_Bak
    PHA
    LDA #MUSIC_INFO_BANK & BANK_DATA_MASK
    JSR Switch_Bank_A000_A
    .ENDIF
    
    LDA Music_Item_Last
    JSR Clear_Music_Info
    LDA Music_Item_Cur
    JSR Write_Music_Info
    
    .IF MUSIC_INFO_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
    RTS

    .ENDIF

;==============================
PPU_Buf_Write;PPU数据写入
    STY <Data_Addr_L
    STX <Data_Addr_H
    LDY #$FF
    LDX PPU_Buf_Pos
    DEX
.Write
    INX
    INY
    LDA [Data_Addr_L],Y
    STA PPU_Data_Buf,X
    BNE .Write
    STX PPU_Buf_Pos
    RTS
    
    .IF SOUND_BAR_SHOW_ENABLE
;==============================
Sound_Bar_Text_Set;标题与音乐条初始化

    .IF MUSIC_INFO_BANK
    LDA Prg_Bank_A000_Bak
    PHA
    LDA #MUSIC_INFO_BANK & BANK_DATA_MASK
    JSR Switch_Bank_A000_A
    .ENDIF
    
    LDY #LOW(Sound_Bar_Text_Data)
    LDX #HIGH(Sound_Bar_Text_Data)
    JSR PPU_Buf_Write
    
    .IF MUSIC_INFO_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
    RTS
    
    .ENDIF
    
;==================================================
Set_Static_Text_Info
    PHA
    LDA #BANK(Static_Text_Data_Info_Index) & BANK_DATA_MASK
    STA Text_Bank
    LDA #<Static_Text_Data_Info_Index
    STA Text_Info_Index_L
    LDA #>Static_Text_Data_Info_Index
    STA Text_Info_Index_H
    LDA #(Static_Text_Data_Info_Index_End - Static_Text_Data_Info_Index) / 2
    STA Text_Info_Count
    PLA
    RTS

;==============================
Show_Static_Text;显示静态文本
    JSR Set_Static_Text_Info
    JSR Init_Text_By_Data
    RTS

;==============================
Clear_Static_String
    JSR Set_Static_Text_Info
    JSR Clear_Text_By_Buffer
    RTS

;==============================
Show_Static_String
    JSR Set_Static_Text_Info
    JSR Write_Text_By_Buffer
    RTS
