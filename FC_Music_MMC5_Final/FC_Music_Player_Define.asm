;====================================================================================================
;静态文本数据

    .MACRO MACRO_STATIC_TEXT_ITEM 
\1
        .DW \2
        .DW \3
        .DB \4
    .ENDM

Static_Text_Data_01 .USTR "FC Music Collection 1"
Static_Text_Data_02 .USTR "Made By FlameCyclone"
Static_Text_Data_03 .USTR "2024.05.31 - 2024.07.14"

    MACRO_STATIC_TEXT_ITEM Static_Text_Data_Info_01,$204D,Static_Text_Data_01,1
    MACRO_STATIC_TEXT_ITEM Static_Text_Data_Info_02,$232B,Static_Text_Data_02,1
    MACRO_STATIC_TEXT_ITEM Static_Text_Data_Info_03,$236B,Static_Text_Data_03,1

Static_Text_Data_Info_Index
    .DW Static_Text_Data_Info_01
    .DW Static_Text_Data_Info_02
    .DW Static_Text_Data_Info_03
Static_Text_Data_Info_Index_End
