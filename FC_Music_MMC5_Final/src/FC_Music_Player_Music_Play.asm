;==================================================
PCM_Playing_Proc
    LDA Music_Play_Flag
    AND #MUSIC_FLAG_PCM_RUNNING
    BEQ .Check
    
    JSR PPU_Pre_Proc_End
    
    ;启用NMI中断
    LDA PPU_Ctrl_Buf
    STA PPU_CTRL
    
    LDA #$00
    STA Bottom_Text_Scroll
    STA NT_Addr
    
    JSR Music_Play_Proc
    
    JSR Update_Name_Scroll
    JSR Update_Track_Name_Scroll
    SEC
    RTS
.Check
    
    LDA Music_Play_Flag
    AND #MUSIC_FLAG_PCM_EXIST
    BEQ .End
    
    LDA #$00
    STA Bottom_Text_Scroll
    LDA #$01
    STA NT_Addr
    
.End
    CLC
    RTS

;==================================================
;音频相关RAM清理处理
Sound_Ram_Clear_Proc
    LDA Music_Ram_Clear_Cnt
    BMI Sound_Ram_Clear_Proc_End_Cln
    LDA Music_Ram_Clear_Cnt
    ASL A
    TAX
    LDA Sound_Ram_Clear_Port, X
    STA Data_Addr_L
    LDA Sound_Ram_Clear_Port + 1,X
    STA Data_Addr_H
    JMP [Data_Addr_L]
Sound_Ram_Clear_Proc_End_Set
    DEC Music_Ram_Clear_Cnt
    SEC
    RTS
Sound_Ram_Clear_Proc_End_Cln
    CLC
    RTS

;==================================================
;音频相关RAM清理地址, 分2部分清除, 防止量大导致递归进入NMI
Sound_Ram_Clear_Port
    .DW Sound_Ram_Clear_Part_0
    .DW Sound_Ram_Clear_Part_1

;==================================================
Sound_Ram_Clear_Part_0
    JMP Sound_Ram_Clear_Proc_End_Set

;==================================================
Sound_Ram_Clear_Part_1
    JSR Sound_Port_Clear
    JSR Mapper_Sound_Clear
    
    LDA #$00

Sound_Ram_Clear_Task_0
    LDX #Sound_Ram_Addr_0_Size - 1
Sound_Ram_Clear_Task_0_Set
    STA Sound_Ram_Addr_0,X
    DEX
    BNE Sound_Ram_Clear_Task_0_Set
    STA Sound_Ram_Addr_0,X
    
    LDA #$00
Sound_Ram_Clear_Task_1
    LDX #Sound_Ram_Addr_1_Size - 1
Sound_Ram_Clear_Task_1_Set
    STA Sound_Ram_Addr_1,X
    DEX
    BNE Sound_Ram_Clear_Task_1_Set
    STA Sound_Ram_Addr_1,X
    
Sound_Ram_Clear_Task_2
    LDX #Sound_Ram_Addr_2_Size - 1
Sound_Ram_Clear_Task_2_Set
    STA Sound_Ram_Addr_2,X
    DEX
    BNE Sound_Ram_Clear_Task_2_Set
    STA Sound_Ram_Addr_2,X
    
Sound_Ram_Clear_Task_3
    LDX #$00
Sound_Ram_Clear_Task_3_Set
    STA Sound_Ram_Addr_3,X
    STA Sound_Ram_Addr_4,X
    STA Sound_Ram_Addr_5,X
    STA Sound_Ram_Addr_6,X
    STA Sound_Ram_Addr_7,X
    STA Sound_Ram_Addr_8,X
    STA Sound_Ram_Addr_9,X
    INX
    BNE Sound_Ram_Clear_Task_3_Set

    JMP Sound_Ram_Clear_Proc_End_Set
    
;==================================================
;清理Mapper声音
Mapper_Sound_Clear
    MACRO_MAPPER_SOUND_CLEAR
    
    .IF 19 = MAPPER_NUMBER
        MACRO_SRAM_ENABLE      ;启用SRAM
    .ENDIF
    
    RTS

;==============================
Time_Show;播放时间显示
    LDA Nmi_Level
    BNE Time_Show_End
    LDA Menu_Proc_Flag
    AND #MENU_PROC_TIME | MENU_PROC_PAGE
    BNE Time_Show_End

    LDX PPU_Buf_Pos
    LDA #PPU_MODE_CNT_LINE
    STA PPU_Data_Buf,X
    INX
    LDA #HIGH(Play_Time_Pos)
    STA PPU_Data_Buf,X
    INX
    LDA #LOW(Play_Time_Pos)
    STA PPU_Data_Buf,X
    INX
    LDA #$08
    STA PPU_Data_Buf,X
    INX
Time_Show_H
    LDA Time_H
    JSR HEX_To_Dec
    JSR Convert_Dec_To_PPU_10
    LDA #':'
    STA PPU_Data_Buf,X
    INX
Time_Show_M
    LDA Time_M
    JSR HEX_To_Dec
    JSR Convert_Dec_To_PPU_10
    LDA #':'
    STA PPU_Data_Buf,X
    INX
Time_Show_S
    LDA Time_S
    JSR HEX_To_Dec
    JSR Convert_Dec_To_PPU_10
    
    .IFDEF SHOW_TIME_MM_SECOND
    LDA #'.'
    STA PPU_Data_Buf,X
    INX
    LDA Time_Cnt
    ASL
    CLC
    ADC Time_Cnt
    TAY
    INY
    LDA Millisecond_Text,Y
    STA PPU_Data_Buf,X
    INX
    INY
    LDA Millisecond_Text,Y
    STA PPU_Data_Buf,X
    INX
    INY
    LDA Millisecond_Text,Y
    STA PPU_Data_Buf,X
    INX
    INY
    .ENDIF
    
    STX PPU_Buf_Pos
Time_Show_End
    RTS
    
    .IFDEF SHOW_TIME_MM_SECOND
Millisecond_Text
    .USTR "000017033050067083100117133150167183200217233250267283300317333350367383400417433450467483500517533550567583600617633650667683700717733750767783800817833850867883900917933950967983"
    .ENDIF

;==================================================
Get_Collection_Order;获取序号指定目标=
    STY Data_Buf
    TAY
    LDA Music_Collection_Order,Y
    SEC
    SBC #$01
    LDY Data_Buf
    RTS
    
;==================================================
Get_Music_Item_Profile;获取音乐配置地址
    ASL A
    TAY
    LDA Music_Profile,Y
    STA Data_Addr_L
    LDA Music_Profile + 1,Y
    STA Data_Addr_H
    RTS
    
;==============================
;音乐曲目显示
Music_Show
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    CLC
    ADC #$01
    JSR HEX_To_Dec
    LDX PPU_Buf_Pos
    LDA #PPU_MODE_CNT_LINE
    STA PPU_Data_Buf,X
    INX
    LDA #HIGH(Play_Index_Pos)
    STA PPU_Data_Buf,X
    INX
    LDA #LOW(Play_Index_Pos)
    STA PPU_Data_Buf,X
    INX
    
    LDA #$07
    BNE Music_Show_Length
    
Music_Show_Length
    STA PPU_Data_Buf,X
    INX

    JSR Convert_Dec_To_PPU_100

    LDA #'/'
    STA PPU_Data_Buf,X
    INX
Music_Show_Total
    LDA Music_Total
    CLC
    ADC #$01
    JSR HEX_To_Dec
    
    JSR Convert_Dec_To_PPU_100
    
    STX PPU_Buf_Pos
Music_Show_End
    RTS

;==============================
;获取当前专辑名
Get_Music_Collection_Name
    JSR Get_Collection_Order
    JSR Get_Music_Item_Profile
    LDY #MUSIC_PROFILE_NAME_INDEX
    LDA [Data_Addr_L],Y
    PHA
    INY
    LDA [Data_Addr_L],Y
    STA <Data_Addr_H
    PLA
    STA <Data_Addr_L
    RTS

;==============================
;获取当前专辑歌曲总数
Set_Sound_Total
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    JSR Get_Music_Item_Profile
    LDY #MUSIC_PROFILE_TOTAL_INDEX
    LDA [Data_Addr_L],Y
    SEC
    SBC #$01
    STA Music_Total
    RTS
    
;==============================
;获取当前歌曲时长
Set_Sound_Time
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    ASL A
    TAY
    LDA Track_Time_Addr_Port,Y
    STA Data_Addr_L
    LDA Track_Time_Addr_Port + 1,Y
    STA Data_Addr_H
    
    LDA Data_Addr_L
    ORA Data_Addr_H
    BEQ Get_Cur_Item_Time_No_Found

    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    TAX
    INX
    STX Music_Song_Total_Time
    LDY #$00
    LDX #$00
Get_Cur_Item_Time_Find
    LDA [Data_Addr_L],Y
    CMP Music_Song_Total_Time
    BNE Get_Cur_Item_Time_Continue
    INY
    LDA [Data_Addr_L],Y
    STA Music_Song_Total_Time
    RTS
Get_Cur_Item_Time_Continue
    CMP #$FF
    BEQ Get_Cur_Item_Time_No_Found
    INY
    INY
    BNE Get_Cur_Item_Time_Continue_Next
    INC Data_Addr_H
Get_Cur_Item_Time_Continue_Next
    INX
    CPX Music_Total
    BCC Get_Cur_Item_Time_Find
Get_Cur_Item_Time_No_Found
    LDA #$00
    STA Music_Song_Total_Time
Set_Sound_Time_End
    RTS
    
;==================================================
Sound_State_Reset;音乐状态重置
    JSR Music_Bar_Reset        ;重置音乐条
    JSR Time_Reset             ;重置播放时间
    
    LDA #$00
    STA Music_Stop_State
    
    RTS

;==================================================
Music_Song_Stop;音乐停止
    JSR Disable_Bar_Time_Draw
    
    LDA #$01
    STA Music_Stop_State
    JSR Music_Bar_Reset
    JSR Time_Reset
    JSR Sound_Data_Clear
    RTS
    
;==================================================
Music_Song_Play;音乐播放
    JSR Disable_Bar_Time_Draw
    LDA #$00
    STA Music_Stop_State
    JSR Music_Song_Play_Current_Item
    RTS

;==================================================
Music_Song_Play_Current_Item;播放当前选择的音乐
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    JSR Sound_Init_Proc
    RTS
    
;==============================
;设置音乐初始化地址
Set_Sound_Init_Port
    PHA
    LDA #$4C
    STA Music_Play_Addr_Op
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    JSR Get_Music_Item_Profile
    LDY #MUSIC_PROFILE_INIT_INDEX
    LDA [Data_Addr_L],Y
    STA Music_Play_Addr_L
    INY
    LDA [Data_Addr_L],Y
    STA Music_Play_Addr_H
    
    LDA #$4C
    STA PCM_Play_Addr_Op
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    ASL
    TAY
    LDA Music_Loop_Profile,Y
    STA PCM_Play_Addr_L
    INY
    LDA Music_Loop_Profile,Y
    STA PCM_Play_Addr_H
    
    LDA PCM_Play_Addr_L
    ORA PCM_Play_Addr_H
    BNE .End_PCM_Exist
    
    LDA #$60
    STA PCM_Play_Addr_Op
    PLA
    RTS
    
.End_PCM_Exist
    LDA #$00
    STA Bottom_Text_Scroll
    STA NT_Addr
    LDA #$08
    STA Scroll_Time_Delay
    PLA
    RTS

;==============================
;设置音乐播放地址
Set_Sound_Play_Port
    PHA
    LDA #$4C
    STA Music_Play_Addr_Op
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    JSR Get_Music_Item_Profile
    LDY #MUSIC_PROFILE_PLAY_INDEX
    LDA [Data_Addr_L],Y
    STA Music_Play_Addr_L
    INY
    LDA [Data_Addr_L],Y
    STA Music_Play_Addr_H
    PLA
    RTS

;==============================
;初始化音乐bank
Init_Sound_Bank
    LDA Music_Item_Cur
    JSR Get_Collection_Order
    JSR Get_Music_Item_Profile
    LDY #MUSIC_PROFILE_BANK_INDEX
    LDA [Data_Addr_L],Y
    STA Prg_Bank_8000
    INY
    LDA [Data_Addr_L],Y
    STA Prg_Bank_A000
    INY
    LDA [Data_Addr_L],Y
    STA Prg_Bank_C000
    
    .IF 5 = MAPPER_NUMBER
    INY
    LDA [Data_Addr_L],Y
    STA Prg_Bank_E000
    .ENDIF
    
    LDY #MUSIC_PROFILE_DMC_INDEX
    LDA [Data_Addr_L],Y
    STA Music_DMC_Offset
    
    RTS

;==================================================
Sound_Init_Proc;音乐初始化处理
    PHA
    
    LDA Music_Ready_Flag
    BEQ Sound_Init_Proc_End
    
    BIT BIT_TRACK_CHANGE
    
    JSR Set_Sound_Init_Port    ;设置音乐初始化地址
    LDA #$00
    STA Music_Song_Cur_Time
    STA Music_Mute_Second
    STA Music_Mute_Count
    
    LDA Music_Ram_Clear_Cnt
    BPL Sound_Init_Proc_End
    
    LDA #$0F
    STA APU_STATUS
    PLA
    
    JSR Sound_Init             ;音乐初始化
    JSR Sound_State_Reset      ;重置音乐播放状态
    
    .IF MUSIC_TIME_BANK
    LDA Prg_Bank_A000_Bak
    PHA
    LDA #MUSIC_TIME_BANK & BANK_DATA_MASK
    JSR Switch_Bank_A000_A
    .ENDIF
    
    JSR Set_Sound_Time
    
    .IF MUSIC_TIME_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
    RTS
    
Sound_Init_Proc_End
    PLA
    RTS
    
;==================================================
Sound_Play_Proc;音乐播放处理
    PHA

    LDA Music_Ram_Clear_Cnt
    BPL Sound_Play_Proc_End
    
    PLA
    JSR Set_Sound_Play_Port    ;设置音乐播放地址
    JSR Sound_Play             ;音乐播放
    RTS
    
Sound_Play_Proc_End
    PLA
    RTS

;==================================================
Sound_Reset_Proc;音乐重置处理
    BIT PPU_Ctrl_Buf
    BPL Music_Ram_Clear_Cnt_Wait_End
    
    JSR Sound_Data_Clear
    
Music_Ram_Clear_Cnt_Wait_End
    
Sound_Reset_Proc_Init_Sound
    LDA Music_Stop_State
    BNE Sound_Reset_Proc_End
    
    JSR Music_Song_Play_Current_Item
Sound_Reset_Proc_End

    .IF Track_Name_Pos
    JSR Show_Cur_Track_Name        ;音乐曲目名显示
    JSR Reset_Track_Name_Scroll
    .ENDIF
    JSR Update_Item_Name_Length
    
    LDA Music_Play_Flag
    AND #MUSIC_FLAG_PCM_EXIST
    BEQ .End
    
    LDA #$00
    STA Bottom_Text_Scroll
    STA NT_Addr
    STA Music_Play_Flag
    
.End
    RTS
    
;==================================================
Reset_Current_Music;重设当前曲目
    ;写入当前总曲目
    JSR Set_Sound_Total
    LDA #$00
    STA Music_Track_Last
    
    JSR Disable_Sprite_Show
    JSR Sound_Reset_Proc
    JSR Enable_Sprite_Show
    
    JSR Music_Show
    
    .IF MUSIC_SHOW_INFO_ENABLE
        JSR Show_Music_Info
    .ENDIF
    
    RTS

;==================================================
Update_Item_Name_Length
    .IF MUSIC_INFO_BANK
    LDA Prg_Bank_A000_Bak
    PHA
    LDA #MUSIC_INFO_BANK & BANK_DATA_MASK
    JSR Switch_Bank_A000_A
    .ENDIF
    
    LDA Music_Item_Cur
    JSR Get_Music_Collection_Name
    LDY #$00
    LDA [Data_Addr_L],Y
    STA Music_Name_Length
    
    .IF MUSIC_INFO_BANK
    PLA
    JSR Switch_Bank_A000_A
    .ENDIF
    
    LDA Music_Name_Length
    CMP #ITEM_NAME_SCROLL_ENGTH + 1
    BCS .Reset_Track_Scroll
    JSR Reset_Item_Name_Scroll_Config
.Reset_Track_Scroll
    JSR Reset_Track_Name_Scroll
.End
    RTS

Reset_Track_Name_Scroll
    LDA #$00
    STA Track_Name_Scroll
    STA Track_Name_NT_Addr
    RTS

;==============================
Time_Reset;播放时间重置
    LDA #$00
    STA Time_S
    STA Time_M
    STA Time_H
    STA Time_Cnt
    RTS

;==============================
Music_Bar_Reset;音乐条重置
    LDY #$20
    LDA #$00
    TAX
Music_Bar_Clear
    STA Sound_Bar_Cur,X
    INX
    DEY
    BPL Music_Bar_Clear
    RTS


;==============================
Reset_Item_Name_Scroll_Config
    .IF TEXT_NAME_SCROLL_ENABLE   
        LDA #ITEM_NAME_SCROLL_ENGTH
        STA Music_Name_Scroll
        LDA #ITEM_NAME_SCROLL_DELAY
        STA Track_Name_Delay
        LDA #00
        STA Scroll_Speed_Delay
    .ELSE
        LDA #$00
        STA Music_Name_Scroll
        STA Music_Name_NT_Addr
    .ENDIF
    RTS