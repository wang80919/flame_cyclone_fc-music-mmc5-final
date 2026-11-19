;封面文本数据

    .IF COVER_ENABLE
    
    .MACRO MACRO_TEXT_ITEM 
\1
        .DW \2
        .DW \3
        .DB \4
    .ENDM

Text_Data_01 .USTR "FC MUSIC Collection 1"
Text_Data_02 .USTR "FlameCyclone 2024.07.14"
Text_Data_03 .USTR "Special thanks"
Text_Data_04 .USTR "GGDJR; Fenmo; Nintendog"
Text_Data_05 .USTR "Menu Guide"

Text_Data_06 .USTR "  \x18/\x19: ALBUM -1/+1"
Text_Data_07 .USTR "  \x1A/\x1B: PAGE  -1/+1"
Text_Data_08 .USTR "  B/A: Song  -1/+1"
Text_Data_09 .USTR "\x08+B/A: SONG -10/+10"
Text_Data_10 .USTR "    \x09: STOP/PLAY"
Text_Data_11 .USTR "Bilibili"
Text_Data_12 .DB $05,$80,$81,$82,$83,$84
Text_Data_13 .DB $05,$90,$91,$92,$93,$94
Text_Data_14 .DB $05,$A0,$A1,$A2,$A3,$A4
Text_Data_15 .DB $05,$B0,$B1,$B2,$B3,$B4
Text_Data_16 .DB $05,$C0,$C1,$C2,$C3,$C4
Text_Data_17 .USTR "ysepan"
Text_Data_18 .DB $05,$85,$86,$87,$88,$89
Text_Data_19 .DB $05,$95,$96,$97,$98,$99
Text_Data_20 .DB $05,$A5,$A6,$A7,$A8,$A9
Text_Data_21 .DB $05,$B5,$B6,$B7,$B8,$B9
Text_Data_22 .DB $05,$C5,$C6,$C7,$C8,$C9
Text_Data_23 .USTR "Press Start"
TEXT_Data_BG_Pal_01 .HEX 10 0F 27 37 20 0F 23 33 0F 0F 21 21 20 0F 25 35 20
TEXT_Data_BG_Pal_02 .HEX 10 0F 27 37 20 0F 23 33 20 0F 21 21 20 0F 25 35 20
Text_Data_24 .USTR "\x08+\x18/\x19: Auto Play On/Off"
;TEXT_Data_SP_Pal_01 .HEX 10 0F 20 2C 25 0F 24 20 0F 0F 24 20 0F 0F 24 20 0F


    MACRO_TEXT_ITEM Text_Data_Info_01,$2062,Text_Data_01,1
    MACRO_TEXT_ITEM Text_Data_Info_02,$2082,Text_Data_02,1
    MACRO_TEXT_ITEM Text_Data_Info_03,$20E2,Text_Data_03,1
    MACRO_TEXT_ITEM Text_Data_Info_04,$2102,Text_Data_04,1
    MACRO_TEXT_ITEM Text_Data_Info_05,$2165,Text_Data_05,1
    MACRO_TEXT_ITEM Text_Data_Info_06,$2185,Text_Data_06,0
    MACRO_TEXT_ITEM Text_Data_Info_07,$21A5,Text_Data_07,0
    MACRO_TEXT_ITEM Text_Data_Info_08,$21C5,Text_Data_08,0
    MACRO_TEXT_ITEM Text_Data_Info_09,$21E5,Text_Data_09,0
    MACRO_TEXT_ITEM Text_Data_Info_10,$2225,Text_Data_10,0
    MACRO_TEXT_ITEM Text_Data_Info_11,$2327,Text_Data_11,0;二维码1
    MACRO_TEXT_ITEM Text_Data_Info_12,$228A,Text_Data_12,0
    MACRO_TEXT_ITEM Text_Data_Info_13,$22AA,Text_Data_13,0
    MACRO_TEXT_ITEM Text_Data_Info_14,$22CA,Text_Data_14,0
    MACRO_TEXT_ITEM Text_Data_Info_15,$22EA,Text_Data_15,0
    MACRO_TEXT_ITEM Text_Data_Info_16,$230A,Text_Data_16,0
    MACRO_TEXT_ITEM Text_Data_Info_17,$2330,Text_Data_17,0;二维码2
    MACRO_TEXT_ITEM Text_Data_Info_18,$2290,Text_Data_18,0
    MACRO_TEXT_ITEM Text_Data_Info_19,$22B0,Text_Data_19,0
    MACRO_TEXT_ITEM Text_Data_Info_20,$22D0,Text_Data_20,0
    MACRO_TEXT_ITEM Text_Data_Info_21,$22F0,Text_Data_21,0
    MACRO_TEXT_ITEM Text_Data_Info_22,$2310,Text_Data_22,0
    MACRO_TEXT_ITEM Text_Data_Info_23,$2362,Text_Data_23,1
    MACRO_TEXT_ITEM Text_Data_Info_BG_01,$3F00,TEXT_Data_BG_Pal_01,0
    MACRO_TEXT_ITEM Text_Data_Info_BG_02,$3F00,TEXT_Data_BG_Pal_02,0
    ;MACRO_TEXT_ITEM Text_Data_Info_SP_01,$3F10,TEXT_Data_SP_Pal_01,0
    MACRO_TEXT_ITEM Text_Data_Info_24,$2205,Text_Data_24,0
    

;--------------------------------------------------
Text_Data_Info_Index;显示地址
    .DW Text_Data_Info_01;标题
    .DW Text_Data_Info_02
    .DW Text_Data_Info_03;特别鸣谢
    .DW Text_Data_Info_04
    .DW Text_Data_Info_05;操作
    .DW Text_Data_Info_06
    .DW Text_Data_Info_07
    .DW Text_Data_Info_08
    .DW Text_Data_Info_09
    .DW Text_Data_Info_10
    .DW Text_Data_Info_11;二维码1文本
    .DW Text_Data_Info_12;二维码1图片
    .DW Text_Data_Info_13
    .DW Text_Data_Info_14
    .DW Text_Data_Info_15
    .DW Text_Data_Info_16
    .DW Text_Data_Info_17;二维码2文本
    .DW Text_Data_Info_18;二维码2图片
    .DW Text_Data_Info_19
    .DW Text_Data_Info_20
    .DW Text_Data_Info_21
    .DW Text_Data_Info_22
    .DW Text_Data_Info_23;底部
    
    .DW Text_Data_Info_BG_01
    .DW Text_Data_Info_BG_02
    .DW Text_Data_Info_24
    ;.DW Text_Data_Info_SP_01
    
Text_Data_Info_Index_End

    .ENDIF