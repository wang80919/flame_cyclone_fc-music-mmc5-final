;==================================================
;获取当前页号起始与条目数量
Get_Page_Start_Index
    STA Data_Buf
    LDA #$00
Get_Page_Index_Calc
    CLC
    ADC #PAGE_SIZE
    CMP Data_Buf
    BCC Get_Page_Index_Calc
    BEQ Get_Page_Index_Calc_End
    SEC
    SBC #PAGE_SIZE
Get_Page_Index_Calc_End
    STA Data_Buf
Get_Page_Index_Cnt
    LDA #PAGE_SIZE
    STA Data_Cnt
    
    LDA Data_Buf
    CLC
    ADC #PAGE_SIZE
    CMP #ITEM_MAX_SIZE
    BCC Get_Page_Index_Cnt_End

    LDA #ITEM_MAX_SIZE
    SEC
    SBC Data_Buf
    STA Data_Cnt

Get_Page_Index_Cnt_End
    RTS


;==================================================
;获取上一页起始索引
Get_Last_Page_Start_Index
    LDA Music_Item_Last
    JSR Get_Page_Start_Index
    LDA Data_Buf
    STA Page_Last
    STA Page_Last_Index
    LDA Data_Cnt
    STA Page_Last_Cnt
    RTS

;==================================================
;获取当前页起始索引
Get_Cur_Page_Start_Index
    LDA Music_Item_Cur
    JSR Get_Page_Start_Index
    LDA Data_Buf
    STA Page_Cur
    STA Page_Cur_Index
    LDA Data_Cnt
    STA Page_Cur_Cnt
    RTS

;==================================================
Item_Pos_Data                         ;光标箭头位置
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 00)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 01)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 02)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 03)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 04)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 05)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 06)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 07)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 08)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 09)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 10)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 11)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 12)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 13)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 14)
    .DW ITEM_SHOW_POS + ($20 * ITEM_LINE_SPACING * 15)
 
    .IF ITEM_CENTER_SHOW
;==================================================
;获取节目居中显示位置
Get_Item_Center_Text_Pos
    JSR Get_Music_Collection_Name
    LDY #$00
    LDA [Data_Addr_L],Y
    CLC
    ADC #$03
    STA Data_Buf
    LDA #$20
    SEC
    SBC Data_Buf
    LSR A
    STA Data_Buf
    RTS
    .ENDIF

;==================================================
;获取节目数据显示位置
Get_Item_Text_Show_Pos
    ASL A
    TAY
    LDA Item_Pos_Data,Y
    PHA
    INY
    LDA Item_Pos_Data,Y
    STA PPU_Data_Buf,X
    ORA #$04
    STA Item_Text_PPU_Addr_H
    INX
    PLA
    RTS

;==================================================
Clear_Item_Text;清除页项目
    LDX PPU_Buf_Pos
    LDA #PPU_MODE_CNT_CLEAR
    STA PPU_Data_Buf,X
    INX
    
    .IF ITEM_CENTER_SHOW
    LDA Page_Last
    JSR Get_Item_Center_Text_Pos
    .ENDIF
    
    ;写入文本显示位置
    LDA Page_Last
    SEC
    SBC Page_Last_Index
    JSR Get_Item_Text_Show_Pos
    
    .IF ITEM_CENTER_SHOW
    AND #$E0
    CLC
    ADC Data_Buf
    .ENDIF
    
    STA PPU_Data_Buf,X
    AND #$E0
    STA Item_Text_PPU_Addr_L
    INX
    
    LDA Page_Last
    JSR Get_Music_Collection_Name
    
    LDY #$00
    LDA [Data_Addr_L],Y
    
    .IF TEXT_NAME_SCROLL_ENABLE
        CMP #ITEM_NAME_SCROLL_ENGTH
        BCC .Write_Text
        LDA #ITEM_NAME_SCROLL_ENGTH
    .ELSE
        CMP #$20 - ((ITEM_SHOW_POS&0x1F) + 3)
        BCC .Write_Text
        SEC
        SBC #$20 - ((ITEM_SHOW_POS&0x1F) + 3)
        STA Item_Text_Data_Count
        LDA #$20 - ((ITEM_SHOW_POS&0x1F) + 3)
    .ENDIF
    
.Write_Text
    CLC
    ADC #$03
    STA PPU_Data_Buf,X
    INX
    
    .IF 0 = TEXT_NAME_SCROLL_ENABLE
    ;超过单行则转换PPU命名表
    LDA Item_Text_Data_Count
    BEQ .End
    
    LDA #PPU_MODE_CNT_CLEAR
    JSR Set_Name_PPU_Mode_And_Addr
    LDA #$00
    STA Item_Text_Data_Count
    .ENDIF
.End
    STX PPU_Buf_Pos
    RTS

;==================================================
Show_Item_Text;显示页项目
    LDX PPU_Buf_Pos
    LDA #PPU_MODE_CNT_LINE
    STA PPU_Data_Buf,X
    INX
    
    .IF ITEM_CENTER_SHOW
    LDA Page_Cur
    JSR Get_Item_Center_Text_Pos
    .ENDIF
    
    LDA Page_Cur
    SEC
    SBC Page_Cur_Index
    JSR Get_Item_Text_Show_Pos
    
    .IF ITEM_CENTER_SHOW
    AND #$E0
    CLC
    ADC Data_Buf
    .ENDIF
    
    STA PPU_Data_Buf,X
    AND #$E0
    STA Item_Text_PPU_Addr_L
    INX
    
    LDA Page_Cur
    CLC
    ADC #$01
    JSR HEX_To_Dec
    
    LDA Page_Cur
    JSR Get_Music_Collection_Name
    
    LDY #$00
    LDA [Data_Addr_L],Y
    
    .IF TEXT_NAME_SCROLL_ENABLE
        CMP #ITEM_NAME_SCROLL_ENGTH
        BCC .Write_Text
        LDA #ITEM_NAME_SCROLL_ENGTH
    .ELSE
        CMP #$20 - ((ITEM_SHOW_POS&0x1F) + 3)
        BCC .Write_Text
        SEC
        SBC #$20 - ((ITEM_SHOW_POS&0x1F) + 3)
        STA Item_Text_Data_Count
        LDA #$20 - ((ITEM_SHOW_POS&0x1F) + 3)
    .ENDIF
    
.Write_Text

    STA Data_Cnt
    CLC
    ADC #$03
    STA PPU_Data_Buf,X
    INX
    
    JSR Convert_Dec_To_PPU_10
    
    LDA #'.'
    STA PPU_Data_Buf,X
    INX
    
.Write_Line
    LDA Data_Cnt
    BEQ .End
    INY
.Write
    LDA [Data_Addr_L],Y
    STA PPU_Data_Buf,X
    INY
    INX
    DEC Data_Cnt
    BNE .Write
    
    .IF 0 = TEXT_NAME_SCROLL_ENABLE
    ;超过单行则转换PPU命名表
    LDA Item_Text_Data_Count
    BEQ .End
    STA Data_Cnt
    
    ;转换写入屏幕
    LDA #PPU_MODE_CNT_LINE
    JSR Set_Name_PPU_Mode_And_Addr
    LDA #$00
    STA Item_Text_Data_Count
    BEQ .Write
    .ENDIF
.End
    STX PPU_Buf_Pos
    RTS

;==================================================
;显示页文本
Show_Page_Text
    JSR Get_Last_Page_Start_Index
    JSR Get_Cur_Page_Start_Index

    LDA Music_Item_Last
    SEC
    SBC Page_Last_Index
    STA Data_Buf
    
    LDA Music_Item_Cur
    SEC
    SBC Page_Cur_Index
    CMP Data_Buf
    BEQ Show_Page_Text_Begin
    
    JSR Disable_Sprite_Show

Show_Page_Text_Begin
    
    LDA Menu_Proc_Flag
    ORA #MENU_PROC_PAGE
    STA Menu_Proc_Flag
    
    ;先处理完PPU缓冲, 防止翻页时添加数据导致缓冲过多导致画面抖动
    LDA #$01
    JSR Wait_For_Time_Delay
    
Show_Page_Text_Set

Clear_Page_Last_Item;清理上一页
    LDA Page_Last_Cnt
    BEQ Clear_Page_Last_Item_End
    
    .IF MUSIC_INFO_BANK
    LDA Prg_Bank_A000_Bak
    PHA
    LDA #MUSIC_INFO_BANK & BANK_DATA_MASK
    JSR Switch_Bank_A000_A
    .ENDIF
    
    JSR Clear_Item_Text
    
    .IF MUSIC_INFO_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
    INC Page_Last
    DEC Page_Last_Cnt
Clear_Page_Last_Item_End
    
Show_Page_Cur_Item;显示当前页
    LDA Page_Cur_Cnt
    BEQ Show_Page_Cur_Item_End
    
    .IF MUSIC_INFO_BANK
    LDA Prg_Bank_A000_Bak
    PHA
    LDA #MUSIC_INFO_BANK & BANK_DATA_MASK
    JSR Switch_Bank_A000_A
    .ENDIF
    
    JSR Show_Item_Text
    
    .IF MUSIC_INFO_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
    INC Page_Cur
    DEC Page_Cur_Cnt
Show_Page_Cur_Item_End

    ;等待NMI完成PPU操作
    LDA #$01
    JSR Wait_For_Time_Delay
    
    LDA Page_Last_Cnt
    ORA Page_Cur_Cnt
    BNE Show_Page_Text_Set
    LDA Menu_Proc_Flag
    AND #(MENU_PROC_PAGE) ^ $FF
    STA Menu_Proc_Flag

    JSR Enable_Sprite_Show
    
    ;恢复文本
    .IF TEXT_NAME_SCROLL_ENABLE
        JSR Reset_Item_Name_Scroll_Config
    .ENDIF
    
    RTS
