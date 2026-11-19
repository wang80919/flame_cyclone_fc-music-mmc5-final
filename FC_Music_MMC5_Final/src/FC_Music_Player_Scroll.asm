;==================================================
;底部文本滚动
Update_Bottom_Scroll
    LDA PPU_Mask_Buf
    BNE .Scroll
    RTS
    
.Scroll
    LDA Music_Play_Flag
    AND #MUSIC_FLAG_PCM_EXIST
    BNE .End
    
    LDA Scroll_Time_Delay
    BEQ .Update_Scroll
    LDA Menu_Proc_Flag
    AND #MENU_PROC_PAGE
    BNE .End
    DEC Scroll_Time_Delay
    RTS
.Update_Scroll
    INC Bottom_Text_Scroll
    BNE .End
    INC NT_Addr
.End
    RTS

;==================================================
;节目名滚动
Update_Name_Scroll
    .IF 0 == TEXT_NAME_SCROLL_ENABLE
    LDA Menu_Proc_Flag
    AND #MENU_PROC_PAGE
    BNE .Name_Scroll_Reset
    LDA Music_Name_Length
    CMP #ITEM_NAME_SCROLL_ENGTH + 1
    BCS .Name_Scroll_Update
.Name_Scroll_Reset
    LDA #$00
    STA Music_Name_NT_Addr
    STA Music_Name_Scroll
    BEQ .End
    
.Name_Scroll_Update
    LDA Music_Name_Length
    CMP #ITEM_NAME_SCROLL_ENGTH + 1
    BCC .Name_Scroll_Reset
    LDA Music_Name_Length
    CMP #$20 - 3
    BCS .Name_Scroll_Update_Data
    CMP #$20 - ((ITEM_SHOW_POS&0x1F) + 3)
    BCS .Name_Scroll_Update_Greater_32
.Name_Scroll_Update_Greater_Limit
    LDA Music_Name_NT_Addr
    AND #$01
    BNE .Name_Scroll_Update_Data
    LDA Music_Name_Length
    CLC
    ADC #(ITEM_SHOW_POS&0x1F) + 3
    STA Data_Buf
    ASL
    ASL
    ASL
    CMP Music_Name_Scroll
    BNE .Name_Scroll_Update_Data
    LDA #(ITEM_SHOW_POS&0x1F)
    ASL
    ASL
    ASL
    STA Music_Name_Scroll
    LDA #$01
    STA Music_Name_NT_Addr
    BNE .Name_Scroll_Update_Data
.Name_Scroll_Update_Greater_32
    LDA Music_Name_NT_Addr
    AND #$01
    BEQ .Name_Scroll_Update_Data
    LDA Music_Name_Length
    CLC
    ADC #$03
    SEC
    SBC #$20 - ((ITEM_SHOW_POS&0x1F))
    STA Data_Buf
.Name_Scroll_Update_Value
    ASL
    ASL
    ASL
    CMP Music_Name_Scroll
    BNE .Name_Scroll_Update_Data
    
    LDA #(ITEM_SHOW_POS&0x1F) << 3
    STA Music_Name_Scroll
.Name_Scroll_Update_Data
    LDA Nmi_Time_Count
    AND #ITEM_NAME_SCROLL_TIME
    CMP #ITEM_NAME_SCROLL_TIME
    BNE .End
    INC Music_Name_Scroll
    BNE .End
    INC Music_Name_NT_Addr
.End
    .ELSE
    
    LDA Track_Name_Delay
    BEQ .Scroll_Check
    DEC Track_Name_Delay
    RTS
.Scroll_Check
    LDA Scroll_Speed_Delay
    BEQ .Scroll_Start
    DEC Scroll_Speed_Delay
    RTS
    
.Scroll_Start
    LDA #ITEM_NAME_SCROLL_SPEED
    STA Scroll_Speed_Delay
    
    LDA Music_Name_Length
    CMP #ITEM_NAME_SCROLL_ENGTH
    BCC .End
    
    JSR Scroll_Item_Name_Text
    LDA FC_Data_Result
    BEQ .End
    LDA #ITEM_NAME_SCROLL_ENGTH
    STA Music_Name_Scroll
    LDA #ITEM_NAME_SCROLL_DELAY
    STA Track_Name_Delay
    LDA Menu_Proc_Flag
    AND #MENU_PROC_SCROLL ^ $FF
    STA Menu_Proc_Flag
    JSR Scroll_Item_Name_Text
.End
    .ENDIF
    RTS


;==================================================
Scroll_Item_Name_Text
    LDA Menu_Proc_Flag
    AND #MENU_PROC_PAGE | MENU_PROC_SCROLL
    BNE .End
    
    .IF MUSIC_INFO_BANK
    LDA Prg_Bank_A000_Bak
    PHA
    LDA #MUSIC_INFO_BANK & BANK_DATA_MASK
    JSR Switch_Bank_A000_A
    .ENDIF
    
    LDA Menu_Proc_Flag
    ORA #MENU_PROC_SCROLL
    STA Menu_Proc_Flag
    
    LDA Music_Item_Cur
    SEC
    SBC Page_Cur_Index
    
    ASL A
    TAY
    LDA Item_Pos_Data,Y
    PHA
    INY
    LDA Item_Pos_Data,Y
    STA FC_Data_Index_H
    INX
    PLA
    CLC
    ADC #$03
    STA FC_Data_Index_L

    ;设置显示宽度
    LDA #ITEM_NAME_SCROLL_ENGTH
    STA FC_Data_Count
    
    ;获取文本数据
    LDA Music_Item_Cur
    JSR Get_Music_Collection_Name
    
    ;设置滚动计数器地址
    LDA #<Music_Name_Scroll
    STA FC_Data_Count_L
    LDA #>Music_Name_Scroll
    STA FC_Data_Count_H
    
    JSR PPU_Write_Text_Buf_By_Scroll_Index

    .IF MUSIC_INFO_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
.End
    RTS

;==================================================
;曲目名滚动
Update_Track_Name_Scroll
    LDA Menu_Proc_Flag
    AND #MENU_PROC_PAGE
    BNE .Track_Name_Scroll_Reset
    LDA Track_Name_Length
    CMP #TRACK_NAME_SCROLL_LENGTH
    BCS .Track_Name_Scroll_Data
.Track_Name_Scroll_Reset
    LDA #$00
    STA Track_Name_NT_Addr
    STA Track_Name_Scroll
    BEQ .End
    
.Track_Name_Scroll_Update
    LDA Track_Name_NT_Addr
    AND #$01
    BEQ .Track_Name_Scroll_Data
    LDA Music_Name_Length
    SEC
    SBC #TRACK_NAME_SCROLL_LENGTH - ((Track_Name_Pos&0x1F)) + 1
    STA Data_Buf
    ASL
    ASL
    ASL
    CMP Track_Name_Scroll
    BNE .Track_Name_Scroll_Data
    
    LDA #(Track_Name_Pos&0x1F) << 3
    STA Track_Name_Scroll
.Track_Name_Scroll_Data
    LDA Nmi_Time_Count
    AND #TRACK_NAME_SCROLL_TIME
    CMP #TRACK_NAME_SCROLL_TIME
    BNE .End
    INC Track_Name_Scroll
    BNE .End
    INC Track_Name_NT_Addr
.End
    RTS
