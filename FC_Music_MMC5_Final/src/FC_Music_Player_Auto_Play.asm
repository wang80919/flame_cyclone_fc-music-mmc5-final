;==================================================
;自动播放静音处理
Check_Mute_Process
    LDA #$00
    STA Music_Mute_Compare
    LDX #$1F
.Check
    LDA Sound_Bar_Cur,X
    CMP Sound_Bar_Last,X
    BEQ .Continue
    STA Sound_Bar_Last,X
    INC Music_Mute_Compare
    
.Continue
    DEX
    BPL .Check
    LDA Music_Mute_Compare
    BNE .End
    
    LDA Music_Mute_Count
    CMP #60
    BCC .Increase
    LDA #$FF
    STA Music_Mute_Count
    INC Music_Mute_Second
.Increase
    INC Music_Mute_Count
    RTS
.End
    LDA #$00
    STA Music_Mute_Count
    STA Music_Mute_Second
    RTS

;==================================================
;自动播放切换下一个节目时重置播放曲号
Reset_Music_Index
    JSR Clear_Cur_Music_Last_Track_Name
    LDX Music_Item_Cur
    LDA #$00
    STA Music_Track_Cur,X
    INX
    CPX #ITEM_MAX_SIZE
    BCC Reset_Music_Index_Set
    LDX #$00
Reset_Music_Index_Set
    LDA #$00
    STA Music_Track_Cur,X
Reset_Music_Index_End
    RTS

;==================================================
;自动播放静音检查
Auto_Play_Process_Check
    JSR Check_Mute_Process
    LDA Music_Mute_Second
    CMP #AUTO_PLAY_MUTE_S_WAIT_TIME
    BCC Auto_Play_Process_Check_End
    LDA Music_Mute_Count
    CMP #AUTO_PLAY_MUTE_T_WAIT_TIME
    BCC Auto_Play_Process_Check_End
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    CMP Music_Total
    BCC Auto_Play_Process_Next_Song
    
    .IF AUTO_STOP_ITEM_ENABLE
    JSR Music_Song_Stop
  .ELSE
    JSR Reset_Music_Index
    JSR Next_Item
    .ENDIF
    
    RTS
    
Auto_Play_Process_Next_Song
    JSR Music_Song_Next
Auto_Play_Process_Check_End
    RTS


;==================================================
;自动播放按照静音时长处理
Auto_Play_By_Mute_Time
    LDA Time_M
    CMP #AUTO_PLAY_M_WAIT_TIME
    BCC Auto_Play_By_Mute_Time_Check
    LDA Time_S
    CMP #AUTO_PLAY_S_WAIT_TIME
    BCC Auto_Play_By_Mute_Time_Check
    
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    CMP Music_Total
    BCC Auto_Play_By_Mute_Time_Next_Song
    
    .IF AUTO_STOP_ITEM_ENABLE
    JSR Music_Song_Stop
  .ELSE
    JSR Reset_Music_Index
    JSR Next_Item
    .ENDIF
    
    RTS
Auto_Play_By_Mute_Time_Next_Song
    JSR Music_Song_Next
    RTS
Auto_Play_By_Mute_Time_Check
    JSR Auto_Play_Process_Check
Auto_Play_Process_By_Mute_Time_End
    RTS

;==================================================
;自动播放按照曲目时长处理
Auto_Play_By_Song_Time
    LDA Music_Song_Cur_Time
    CMP Music_Song_Total_Time
    BCC Auto_Play_By_Song_Time_End
    
    LDX Music_Item_Cur
    LDA Music_Track_Cur,X
    CMP Music_Total
    BCC Auto_Play_By_Song_Time_Next_Song
    
    .IF AUTO_STOP_ITEM_ENABLE
    JSR Music_Song_Stop
  .ELSE
    JSR Reset_Music_Index
    JSR Next_Item
    .ENDIF
    
    RTS
    
Auto_Play_By_Song_Time_Next_Song
    JSR Music_Song_Next
    RTS
    
Auto_Play_By_Song_Time_End
    RTS

;==================================================
;自动播放处理
Auto_Play_Process
    LDA Music_Auto_Play
    BEQ Auto_Play_Process_End
    LDA Music_Song_Total_Time
    BEQ Auto_Play_Process_By_Mute
Auto_Play_Process_By_Time
    JSR Auto_Play_By_Song_Time
    RTS
Auto_Play_Process_By_Mute
    JSR Auto_Play_By_Mute_Time
Auto_Play_Process_End
    RTS

;==================================================
;自动播放切换
Auto_Play_Switch_Proc
    LDA <Key_Keep
    AND #$10
    BEQ Auto_Play_Switch_Proc_End
Nmi_Auto_Play_Disable
    LDA <Key_Once
    CMP #$40
    BNE Nmi_Auto_Play_Enable
    LDA #$01
    STA Music_Auto_Play
Nmi_Auto_Play_Enable
    LDA <Key_Once
    CMP #$80
    BNE Auto_Play_Switch_Proc_End
    LDA #$00
    STA Music_Auto_Play
Auto_Play_Switch_Proc_End
    RTS
