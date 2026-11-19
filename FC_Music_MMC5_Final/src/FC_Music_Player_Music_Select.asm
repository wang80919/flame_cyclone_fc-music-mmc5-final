;==================================================
;快速选择音乐曲目
Music_Fast_Select_Item
    LDA Fast_Item
    CMP #$FF
    BEQ Music_Fast_Select_Item_End
    
    ;CMP Music_Item_Cur
    ;BEQ Music_Fast_Select_Item_End
    
    LDA Fast_Item
    CMP #ITEM_MAX_INDEX
    BCC .MaxItemIndexCheckEnd
    LDA #ITEM_MAX_INDEX
    STA Fast_Item
    
.MaxItemIndexCheckEnd
    
    JSR Clear_Cur_Music_Last_Track_Name
    
    LDA #$01
    STA Music_Update_Flag
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Clear_Item_Color
    .ENDIF
    
    LDA Music_Item_Cur
    STA Music_Item_Last
    LDA Fast_Item
    STA Music_Item_Cur
    
    LDA #$FF
    STA Fast_Item

    LDA Music_Item_Cur
    JSR Reset_Current_Music
    
    JSR Show_Page_Text
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Update_Item_Color
    .ENDIF
    
    LDA #$00
    STA Music_Update_Flag
    
    SEC
    RTS
    
Music_Fast_Select_Item_End
    LDA #$FF
    STA Fast_Item
    CLC
    RTS

;==================================================
;快速选择指定音乐集
Music_Fast_Select_Music
    LDA Fast_Music
    CMP #$FF
    BEQ Music_Fast_Select_Music_End
    
    LDA Fast_Music
    CMP Music_Total
    BCC .MaxMusicTotalCheckEnd
    LDA Music_Total
    STA Fast_Music

.MaxMusicTotalCheckEnd
    
    JSR Clear_Cur_Music_Last_Track_Name
    
    LDX Music_Item_Cur
    LDA Fast_Music
    STA Music_Track_Cur,X
    
    LDA #$FF
    STA Fast_Music
    
    LDA Music_Item_Cur
    JSR Reset_Current_Music
    SEC
    RTS

Music_Fast_Select_Music_End
    LDA #$FF
    STA Fast_Item
    CLC
    RTS
    
;==================================================
Music_Song_Last;上一曲
    JSR Clear_Cur_Music_Last_Track_Name
    JSR Disable_Bar_Time_Draw
    JSR Set_Sound_Total
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    BEQ Music_Song_Last_Set
    DEC Music_Track_Cur,X
Music_Song_Last_Set
    JSR Sound_Reset_Proc
    JSR Music_Show
Music_Song_Last_End
    RTS
    
;==================================================
Music_Song_Last_10;上10曲
    JSR Clear_Cur_Music_Last_Track_Name
    JSR Disable_Bar_Time_Draw
    JSR Set_Sound_Total
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    SEC
    SBC #10
    BCS Music_Song_Last_10_Set
    LDA #$00
Music_Song_Last_10_Set
    STA Music_Track_Cur,X
    JSR Sound_Reset_Proc
    JSR Music_Show
Music_Song_Last_10_End
    RTS
    
;==================================================
Music_Song_Next;下一曲
    JSR Clear_Cur_Music_Last_Track_Name
    JSR Disable_Bar_Time_Draw
    JSR Set_Sound_Total
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    CMP Music_Total
    BCS Music_Song_Next_Set
    INC Music_Track_Cur,X
Music_Song_Next_Set
    JSR Sound_Reset_Proc
    JSR Music_Show
Music_Song_Next_End
    RTS
    
;==================================================
Music_Song_Next_10;下10曲
    JSR Clear_Cur_Music_Last_Track_Name
    JSR Disable_Bar_Time_Draw
    JSR Set_Sound_Total
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    CLC
    ADC #10
    CMP Music_Total
    BCC Music_Song_Next_10_Set
    LDA Music_Total
Music_Song_Next_10_Set
    STA Music_Track_Cur,X
    JSR Sound_Reset_Proc
    JSR Music_Show
Music_Song_Next_10_End
    RTS
    
;==================================================
Change_Select_Item;改变当前选择项
;--------------------------------------------------
Change_Select_Stop_Play_Item;停止/播放
    LDA Key_Once
    CMP #$10
    BNE Change_Select_Start
    LDA Music_Stop_State
    BNE Change_Select_Play
    JSR Music_Song_Stop
    LDA Music_Stop_State
    RTS
    
Change_Select_Play
    JSR Music_Song_Play
    RTS

;--------------------------------------------------
Change_Select_Start
    LDA Menu_Proc_Flag
    AND #MENU_PROC_ITEM
    BEQ Change_Select_Auto_Play_Enable
    JMP Change_Select_Item_End
;--------------------------------------------------
Change_Select_Auto_Play_Enable
    LDA Key_Keep
    CMP #$28
    BNE Change_Select_Auto_Play_Disable
    LDA Key_Once
    CMP #$08
    BNE Change_Select_Auto_Play_Disable
    LDA #$01
    STA Music_Auto_Play
    RTS
;--------------------------------------------------
Change_Select_Auto_Play_Disable
    LDA Key_Keep
    CMP #$24
    BNE Change_Select_Last_Item
    LDA Key_Once
    CMP #$04
    BNE Change_Select_Last_Item
    LDA #$00
    STA Music_Auto_Play
    RTS
;--------------------------------------------------
Change_Select_Last_Item;上一个专辑
    LDA Key_Keep
    AND #$30
    BNE Change_Select_Next_Item
    LDA Key_Once
    CMP #$08
    BNE Change_Select_Next_Item
    JSR Last_Item
;--------------------------------------------------
Change_Select_Next_Item;下一个专辑
    LDA Key_Keep
    AND #$30
    BNE Change_Select_Last_10
    LDA Key_Once
    CMP #$04
    BNE Change_Select_Last_10
    JSR Next_Item
    
;--------------------------------------------------
Change_Select_Last_10;前10曲
    LDA Key_Keep
    AND #$20
    BEQ Change_Select_Next_10
    LDA Key_Once
    CMP #$40
    BNE Change_Select_Next_10
    JSR Music_Song_Last_10
;--------------------------------------------------
Change_Select_Next_10;后10曲
    LDA Key_Keep
    AND #$20
    BEQ Change_Select_Last_1
    LDA Key_Once
    CMP #$80
    BNE Change_Select_Last_1
    JSR Music_Song_Next_10
;--------------------------------------------------
Change_Select_Last_1;前1曲
    LDA Key_Keep
    AND #$30
    BNE Change_Select_Next_1
    LDA Key_Once
    CMP #$40
    BNE Change_Select_Next_1
    JSR Music_Song_Last
;--------------------------------------------------
Change_Select_Next_1;后1曲
    LDA Key_Keep
    AND #$30
    BNE Change_Select_Last_Page
    LDA Key_Once
    CMP #$80
    BNE Change_Select_Last_Page
    JSR Music_Song_Next
;--------------------------------------------------
Change_Select_Last_Page;上一页
    LDA Key_Keep
    AND #$30
    BNE Change_Select_Next_Page
    LDA Key_Once
    CMP #$02
    BNE Change_Select_Next_Page
    JSR Pre_Page
;--------------------------------------------------
Change_Select_Next_Page;下一页
    LDA Key_Keep
    AND #$30
    BNE Change_Page_Next
    LDA Key_Once
    CMP #$01
    BNE Change_Page_Next
    JSR Next_Page
;--------------------------------------------------
Change_Page_Next;下一页
    LDA Key_Once
    CMP #$20
    BNE Change_Select_Item_End
    
Change_Select_Item_End
    LDA Music_Item_Cur
    SEC
    SBC Page_Cur_Index
    STA Page_Cur_Item_Index
    
    RTS
    
;==================================================
Pre_Page;上一页
    LDA #PAGE_MAX_INDEX
    CMP #$01
    BEQ .End

    JSR Clear_Cur_Music_Last_Track_Name
    LDA Music_Item_Cur
    STA Music_Item_Last
    JSR Get_Last_Page_Start_Index
    
    LDA Page_Last_Index
    BEQ .Pre_In_Begin_Page
    
.Pre_Not_Begin_Page;不是在起始页
    LDA Music_Item_Cur
    SEC
    SBC #PAGE_SIZE
    STA Music_Item_Cur
    JMP .Page_Reset
.Pre_In_Begin_Page;在起始页
    LDA Music_Item_Cur
    SEC
    SBC Page_Last_Index
    CLC
    ADC #PAGE_MAX_INDEX
    CMP #ITEM_MAX_SIZE
    BCC .Pre_Limit
    LDA #ITEM_MAX_INDEX
.Pre_Limit
    STA Music_Item_Cur
.Page_Reset
    LDA Music_Item_Cur
    JSR Reset_Current_Music
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Clear_Item_Color
    .ENDIF
    
    JSR Show_Page_Text
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Update_Item_Color
    .ENDIF
    
.End
    RTS
    
;==================================================
;下一页
Next_Page
    LDA #PAGE_MAX_INDEX
    CMP #$01
    BEQ .End

    JSR Clear_Cur_Music_Last_Track_Name
    LDA Music_Item_Cur
    STA Music_Item_Last
    JSR Get_Last_Page_Start_Index
    
    LDA Page_Last_Index
    CMP #PAGE_MAX_INDEX
    BCS .Next_In_End_Page
    
.Next_Not_End_Page;不是在最后一页
    LDA Music_Item_Cur
    CLC
    ADC #PAGE_SIZE
    CMP #ITEM_MAX_SIZE
    BCC .Next_Not_End_Page_Less
    LDA Music_Item_Cur
    SEC
    SBC Page_Last_Index
    CLC
    ADC #PAGE_MAX_INDEX
    CMP #ITEM_MAX_SIZE
    BCC .Next_Not_End_Page_Less
    LDA #ITEM_MAX_INDEX
.Next_Not_End_Page_Less
    STA Music_Item_Cur
    JMP .Page_Reset
.Next_In_End_Page;在最后一页
    LDA Music_Item_Cur
    SEC
    SBC Page_Last_Index
    STA Music_Item_Cur
.Page_Reset
    LDA Music_Item_Cur
    JSR Reset_Current_Music
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Clear_Item_Color
    .ENDIF
    
    JSR Show_Page_Text
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Update_Item_Color
    .ENDIF
    
.End
    RTS

;==================================================
Reset_Scroll_Item_Name
    LDA Music_Name_Length
    CMP #ITEM_NAME_SCROLL_ENGTH
    BCC .End
    
    ;恢复文本
    .IF TEXT_NAME_SCROLL_ENABLE
        LDA #ITEM_NAME_SCROLL_ENGTH
        STA Music_Name_Scroll
        
        LDA Menu_Proc_Flag
        AND #MENU_PROC_SCROLL ^ $FF
        STA Menu_Proc_Flag
        
        JSR Scroll_Item_Name_Text
    .ENDIF
    
    JSR Reset_Item_Name_Scroll_Config
    
.End
    RTS
    
    
;==================================================
Update_Scroll_Item_Name
    RTS
    LDA Music_Name_Length
    CMP #ITEM_NAME_SCROLL_ENGTH
    BCC .End
    
    ;恢复文本
    .IF TEXT_NAME_SCROLL_ENABLE
        LDA #ITEM_NAME_SCROLL_ENGTH
        STA Music_Name_Scroll
        JSR Scroll_Item_Name_Text
    .ENDIF
    RTS
    
.End
    LDA #$00
    STA Music_Name_Scroll
    STA Music_Name_NT_Addr
    RTS
    
    
;==================================================
Last_Item;上一项

    ;恢复文本
    JSR Reset_Scroll_Item_Name

    JSR Clear_Cur_Music_Last_Track_Name
    JSR Disable_Bar_Time_Draw
    
    LDA Music_Item_Cur
    STA Music_Item_Last
    
    JSR Get_Last_Page_Start_Index
    
    LDA #$00
    STA Page_Update_Flag
    
    LDA Page_Last
    CMP Music_Item_Cur
    BNE Last_Item_Begin
    
    INC Page_Update_Flag
Last_Item_Begin
    LDA Music_Item_Cur
    BNE Last_Item_Set
    LDA #ITEM_MAX_INDEX + 1
    STA Music_Item_Cur
    
Last_Item_Set
    DEC Music_Item_Cur
    LDA Music_Item_Cur
    JSR Reset_Current_Music
    JSR Update_Scroll_Item_Name
Last_Item_Play

    LDA Page_Update_Flag
    BEQ Last_Item_End
    
    .IF 0 != PAGE_MAX_INDEX
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Clear_Item_Color
    .ENDIF
    
    JSR Show_Page_Text
    .ENDIF
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Update_Item_Color
    .ENDIF
    
    RTS
    
Last_Item_End
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Update_Item_Color
    .ENDIF
    RTS

;==================================================
Next_Item;下一项

    ;恢复文本
    JSR Reset_Scroll_Item_Name

    JSR Clear_Cur_Music_Last_Track_Name
    JSR Disable_Bar_Time_Draw
    
    LDA Music_Item_Cur
    STA Music_Item_Last
    
    JSR Get_Last_Page_Start_Index
    
    LDA #$00
    STA Page_Update_Flag
    
    LDA Page_Last
    CLC
    ADC Page_Last_Cnt
    SEC
    SBC #$01
    CMP Music_Item_Cur
    BNE Next_Item_Begin
    
    INC Page_Update_Flag
Next_Item_Begin
    LDA Music_Item_Cur
    CMP #ITEM_MAX_INDEX
    BCC Next_Item_Set
    LDA #$FF
    STA Music_Item_Cur
Next_Item_Set
    INC Music_Item_Cur
    LDA Music_Item_Cur
    JSR Reset_Current_Music
    JSR Update_Scroll_Item_Name
    
Next_Item_Play
    LDA Page_Update_Flag
    BEQ Next_Item_End
    
    .IF 0 != PAGE_MAX_INDEX
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Clear_Item_Color
    .ENDIF
    
    JSR Show_Page_Text
    .ENDIF
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Update_Item_Color
    .ENDIF
    
    RTS
    
Next_Item_End
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Update_Item_Color
    .ENDIF
    
    RTS

    ; 更新选择行颜色
    .IF EXTENDED_ATTRIBUTES_ENABLE
    
;==================================================
Update_Item_Color
    LDA #$02
    STA MAPPER_REG_EX_RAM_MODE
    
    LDA Music_Item_Last
    SEC
    SBC Page_Last_Index
    JSR Update_Inactive_Item_Color
    
    LDA Music_Item_Cur
    SEC
    SBC Page_Cur_Index
    JSR Update_Active_Item_Color
    
    LDA #$01
    STA MAPPER_REG_EX_RAM_MODE
    
    RTS

;==================================================
Clear_Item_Color
    LDA #$02
    STA MAPPER_REG_EX_RAM_MODE
    
.Clear_Last
    LDA Music_Item_Last
    SEC
    SBC Page_Last_Index
    CMP #PAGE_SIZE
    BCS .Clear_Cur
    JSR Update_Inactive_Item_Color
    
.Clear_Cur
    LDA Music_Item_Cur
    SEC
    SBC Page_Cur_Index
    CMP #PAGE_SIZE
    BCS .End
    JSR Update_Inactive_Item_Color

.End
    LDA #$01
    STA MAPPER_REG_EX_RAM_MODE
    RTS

;==================================================
Get_Item_Color_Addr
    PHA
    LDA #$00
    STA Data_Addr_L
    STA Data_Addr_H
    PLA
    CLC
    ADC #04
    ASL
    ASL
    ASL
    STA Data_Addr_L
    
    ASL Data_Addr_L
    ROL Data_Addr_H
    ASL Data_Addr_L
    ROL Data_Addr_H
    
    LDA Data_Addr_H
    ORA #$5C
    STA Data_Addr_H
    RTS

;==================================================
Set_Item_Color_Data
    LDX #$20
    LDY #$00
.Write_Attribute_Data
    STA [Data_Addr_L],Y
    INY
    DEX
    BNE .Write_Attribute_Data
    RTS

;==================================================
Update_Active_Item_Color
    JSR Get_Item_Color_Addr
    LDA #$80
    JSR Set_Item_Color_Data
    RTS
    
;==================================================
Update_Inactive_Item_Color
    JSR Get_Item_Color_Addr
    LDA #$40
    JSR Set_Item_Color_Data
    RTS
    .ENDIF
