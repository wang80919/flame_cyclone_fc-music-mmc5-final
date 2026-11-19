;==================================================
    .RSSET Use_PPU_Ram_Begin
PPU_Data_Buf            .RS $C0
PPU_Palette_Buf         .RS $20
;==================================================
Bkg_Palette_Update_Addr     = PPU_Palette_Buf + $0D
Sprite_Palette_Update_Addr  = PPU_Palette_Buf + $11
;==================================================
PPU_Ctrl_Buf            .RS 1       ;PPU控制寄存器缓冲
PPU_Mask_Buf            .RS 1       ;PPU掩码寄存器缓冲
PPU_Buf_Pos             .RS 1       ;当前PPU缓冲位置
Sound_Bar_Cnt           .RS 1
Sound_Bar_Index         .RS 1
IRQ_Process_Index       .RS 1
IRQ_Scanline_Value      .RS 1
IRQ_Addr_L              .RS 1
IRQ_Addr_H              .RS 1
Reg_A_Bak               .RS 1
Reg_X_Bak               .RS 1
Reg_Y_Bak               .RS 1
Reg_Addr_Bak            .RS 1
Reg_Data_Bak            .RS 1

;==================================================
    .RSSET Use_Zero_Ram_Begin
;==================================================
Data_Addr_L             .RS 1
Data_Addr_H             .RS 1
Data_Index_L            .RS 1
Data_Index_H            .RS 1

FC_Data_Index_L         = Data_Index_L
FC_Data_Index_H         = Data_Index_H
FC_Data_Addr_L          = Data_Addr_L
FC_Data_Addr_H          = Data_Index_H
FC_Data_Count_L         .RS 1
FC_Data_Count_H         .RS 1
;==================================================
Use_Zero_Ram_End        .RS 1

Sound_Ram_Addr_1       = Use_Zero_Ram_End + 1
Sound_Ram_Addr_1_Size  = $100 - (Use_Zero_Ram_End + 1)

;==================================================
;当前帧文本写入禁用标志, 防止缓冲过大导致画面跳动
MENU_PROC_BAR           = %00000001     ;音乐条
MENU_PROC_TIME          = %00000010     ;播放时间
MENU_PROC_ITEM          = %00000100     ;节目名
MENU_PROC_PALETTE       = %00001000     ;调色板
MENU_PROC_PAGE          = %10000000     ;翻页
MENU_PROC_SCROLL        = %01000000     ;文本滚动中
;==================================================
MUSIC_FLAG_PCM_RUNNING  = %00000001     ;循环运行中运行中
MUSIC_FLAG_PCM_EXIST    = %00000010     ;存在PCM
MUSIC_FLAG_CLEAR_TEXT   = %00000100     ;清除文本任务
MUSIC_FLAG_FINISH       = %10000000     ;
;==================================================
    .RSSET Use_Ex_Ram_Begin
;==================================================
Key_Keep                .RS 1
Key_Once                .RS 1
Key_Kemp                .RS 1
Key_Temp                .RS 1
Key_Getv                .RS 1
;==================================================
Fast_Item               .RS 1
Fast_Music              .RS 1
Item_Max_Index          .RS 1
Nmi_Level               .RS 1       ;NMI递归层级
Music_Play_Flag         .RS 1       ;播放标志
Music_Ready_Flag        .RS 1       ;
Cover_Mode_Time         .RS 1       ;封面模式延时

Scroll_Time_Delay       .RS 1       ;滚动延迟
Scroll_Speed_Delay      .RS 1       ;滚动速度
NT_Addr                 .RS 1
Data_Index              .RS 1
Data_Cnt                .RS 1
Data_Buf                .RS 1
FC_PPU_Buf_Addr         = PPU_Data_Buf
FC_PPU_Buf_Count        = PPU_Buf_Pos

FC_Data_Count           .RS 1
FC_Data_Length          .RS 1
FC_Data_Index           .RS 1
FC_Data_Buf             .RS 1
FC_Data_Result          .RS 1

Text_Bank               .RS 1       ;文本bank
Text_Info_Count         .RS 1       ;文本信息数量
Text_Info_Index_L       .RS 1       ;文本信息索引低位
Text_Info_Index_H       .RS 1       ;文本信息索引高位

Music_Play_Addr_Op      .RS 1
Music_Play_Addr_L       .RS 1
Music_Play_Addr_H       .RS 1

PCM_Play_Addr_Op        .RS 1
PCM_Play_Addr_L         .RS 1
PCM_Play_Addr_H         .RS 1

Nmi_Time_Count          .RS 1
Time_Wait_Cnt           .RS 1
Palette_Wait_Cnt        .RS 1
Palette_Index           .RS 1
Scroll_H                .RS 1
Scroll_V                .RS 1
;--------------------------------------------------
Page_Cur                .RS 1
Page_Cur_Index          .RS 1
Page_Cur_Cnt            .RS 1
Page_Last               .RS 1
Page_Last_Index         .RS 1
Page_Last_Cnt           .RS 1
Page_Cur_Item_Index     .RS 1
Item_Text_PPU_Addr_L    .RS 1
Item_Text_PPU_Addr_H    .RS 1
Item_Text_Data_Count    .RS 1
;==================================================
Menu_Proc_Flag          .RS 1
Music_Update_Flag       .RS 1
Page_Update_Flag        .RS 1
HEX_Data                .RS 1
DEC_H                   .RS 1
DEC_T                   .RS 1
DEC_L                   .RS 1
;==================================================
Time_S                  .RS 1
Time_M                  .RS 1
Time_H                  .RS 1
Time_Cnt                .RS 1
;==================================================
Music_Item_Cur          .RS 1   ;当前音乐集
Music_Item_Last         .RS 1   ;上次音乐集
Music_Total             .RS 1   ;当前音乐集曲目总数
Music_Song_Cur_Time     .RS 1
Music_Song_Total_Time   .RS 1
Music_Stop_State        .RS 1   ;播放停止状态
Music_Track_Last        .RS 1   ;上次播放音乐集

Bottom_Text_Scroll      .RS 1
Music_Name_Scroll       .RS 1
Track_Name_Delay        .RS 1
Music_Name_NT_Addr      .RS 1
Track_Name_Scroll       .RS 1
Track_Name_NT_Addr      .RS 1

Music_Name_Length       .RS 1   ;音乐集名字长度
Track_Name_Length       .RS 1   ;曲目名长度
;--------------------------------------------------
Music_Auto_Play         .RS 1   ;自动播放
Music_Mute_Count        .RS 1   ;静音计数
Music_Mute_Second       .RS 1   ;静音计时
Music_Mute_Compare      .RS 1
;==================================================
Music_Ram_Clear_Cnt     .RS 1
Prg_Bank_8000           .RS 1
Prg_Bank_A000           .RS 1
Prg_Bank_C000           .RS 1
Prg_Bank_E000           .RS 1
Prg_Bank_8000_Bak       .RS 1
Prg_Bank_A000_Bak       .RS 1
Prg_Bank_C000_Bak       .RS 1
Prg_Bank_E000_Bak       .RS 1
;==================================================
Music_Track_Cur         .RS ITEM_MAX_SIZE  ;当前曲目
Music_DMC_Offset        .RS 1
;==================================================
    .IF 0 = ((19 = MAPPER_NUMBER) | (85 = MAPPER_NUMBER) | (69 = MAPPER_NUMBER))
Sound_Bar_Cur           .RS $20
Sound_Bar_Last          .RS $20
    .ENDIF
    
Use_Ex_Ram_End          .RS 1

;==================================================
    .IF 19 = MAPPER_NUMBER
 .RSSET $0300
Sound_Bar_Cur           .RS $20
Sound_Bar_Last          .RS $20
    .ENDIF

    .IF 85 = MAPPER_NUMBER
    .RSSET $0300
Sound_Bar_Cur           .RS $20
Sound_Bar_Last          .RS $20
Sound_Bar_Ex_Cur        .RS $40
Sound_Bar_Ex_Last       .RS $40
    .ENDIF
    
    .IF 69 = MAPPER_NUMBER
    .RSSET $0300
Sound_Bar_Cur           .RS $20
Sound_Bar_Last          .RS $20
Sound_Bar_Ex_Cur        .RS $40
Sound_Bar_Ex_Last       .RS $40
    .ENDIF
    
;小写字符转大写字符宏
    .MACRO CONVERT_TO_UPPERCASE
    ;当字符 >= 'a' 并且 <= 'z' 时转换为大写 
    ;CMP #'a'
    ;BCC .Convert_End
    ;CMP #'z'
    ;BEQ .Convert_Char
    ;BCS .Convert_End
    ;转大写, 翻转 D5 位即可
.Convert_Char
    ;EOR #$20
.Convert_End
    .ENDM
