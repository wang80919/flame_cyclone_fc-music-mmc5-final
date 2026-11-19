
;==================================================
Nmi_Process

    ;启动IRQ
    LDA Page_Cur_Item_Index
    CLC
    ADC #$04
    ASL
    ASL
    ASL
    SEC
    SBC #$01
    STA IRQ_Scanline_Value
    MACRO_SET_IRQ_SCANLINE_VALUE
    MACRO_ENABLE_IRQ
    CLI
    
    MACRO_MIRRORING_H
    
.Begin

    ;关闭屏幕控制
    LDA #$00
    STA PPU_CTRL

    LDA #$00
    STA PPU_OAM_ADDR
    
    .IF OAM_DMA_WRITE_ENABLE
    LDA #OAM_DMA_TEMP_ADDR / $0100
    STA OAM_DMA
    .ENDIF

    JSR PCM_Playing_Proc
    BCS Nmi_Normal_Process_End
    
.PPU_Process

    ;处理PPU图像
    JSR PPU_Pre_Proc
    
    ;启用NMI中断
    LDA PPU_Ctrl_Buf
    STA PPU_CTRL
    
    ;处理光标箭头
    JSR Show_Cursor
    
    JSR Update_Name_Scroll
    JSR Update_Track_Name_Scroll
    JSR Update_Bottom_Scroll

    ;处理RAM清理
    JSR Sound_Ram_Clear_Proc
    BCS Nmi_Normal_Process_End
    
    ;快速换曲
    JSR Music_Fast_Select_Proc
    BCS Nmi_Normal_Process_End
    
    ;处理手柄输入
    JSR Joystick_Proc
    
    ;Nmi计时
    JSR Time_Wait_Proc
    
    ;自动播放切换
    JSR Auto_Play_Switch_Proc
    
    ;切换音乐(手柄触发)
    JSR Music_Change_Proc
    
    ;更新调色板
    JSR Update_Palette_Data

    ;播放声音
    JSR Music_Play_Proc
    
    ;显示时间(缓冲)
    JSR Time_Show
    
    ;音乐显示(缓冲)
    .IF SOUND_BAR_SHOW_ENABLE
        JSR Music_Vision
    .ENDIF
    
Nmi_Normal_Process_End
    INC Nmi_Time_Count
    RTS

;==================================================
;音乐快速选择
Music_Fast_Select_Proc
    LDA Music_Ready_Flag
    BEQ .End
    
    LDA Music_Update_Flag
    BNE .End
    JSR Music_Fast_Select_Item
    JSR Music_Fast_Select_Music
.End
    RTS
    
;==================================================
;音乐播放处理
Music_Play_Proc
    LDA Music_Ready_Flag
    BEQ .End
    
    LDA Menu_Proc_Flag
    AND #MENU_PROC_PAGE
    BNE .End
    LDA Music_Stop_State
    BNE .End
    JSR Sound_Play_Proc
    
    ;播放计时
    JSR Time_Count
    
    ;自动播放
    LDA Music_Play_Flag
    AND #MUSIC_FLAG_PCM_RUNNING
    BNE .End
    JSR Auto_Play_Process
    
.End
    RTS

;==================================================
;音乐选择
Music_Change_Proc
    LDA Nmi_Level
    BNE Music_Change_Proc_End
    LDA PPU_Mask_Buf
    BEQ Music_Change_Proc_End
    
    LDA Menu_Proc_Flag
    AND #MENU_PROC_PAGE
    BNE Music_Change_Proc_End
    
    LDA Time_Wait_Cnt
    BNE Music_Change_Proc_End
    JSR Change_Select_Item
Music_Change_Proc_End
    RTS
