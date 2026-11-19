;==================================================
Program_Begin;主程序
    LDA #$00
    STA PPU_CTRL
    LDA #$00
    STA PPU_STATUS
    STA PPU_MASK
    STA JOY2_FRAME
    
    STA PPU_SCROLL
    STA PPU_SCROLL
    
;==================================================
    LDX #$FF
    TXS
    
    MACRO_MAPPER_INIT
    
    JSR Init_Ex_Ram
    JSR Init_PPU_Buffer
    JSR Mapper_Sound_Clear

    BIT PPU_STATUS
VBlank1
    BIT PPU_STATUS
    BPL VBlank1
VBlank2
    BIT PPU_STATUS
    BMI VBlank2

    LDA #$0F
    STA APU_STATUS
    LDA #$C0
    STA JOY2_FRAME
    
    LDA PPU_STATUS
    LDA #$10
    TAX
Check3
    STA PPU_ADDRESS
    STA PPU_ADDRESS
    EOR #$00
    DEX
    BNE Check3
;==============================
;调色板清空
    LDA PPU_STATUS
    LDA #$3F
    STA PPU_ADDRESS
    LDA #$00
    STA PPU_ADDRESS
    LDA #$0F
    LDY #$20
Palette_Clear
    STA PPU_DATA
    INX
    DEY
    BNE Palette_Clear
    LDA #$00
    STA APU_STATUS
    
;==============================
;RAM初始化
RAM_Clear_All
    LDY #$00
    LDX #$08
    LDA #$00
    STA <$00
    STA <$01
RAM_Clear_All_Start
    STA [$00],Y
    INY
    BNE RAM_Clear_All_Start
    INC <$01
    DEX
    BNE RAM_Clear_All_Start
    
    JSR Vram_Clear
    JSR Vram_Init
    JSR OAM_Ram_Init
    
    LDA #$FF
    STA Fast_Item
    STA Fast_Music
    
    .IF COVER_ENABLE
        JSR Cover_Process
    .ENDIF
   
    JSR Init_Palette_Buffer
    
    JSR Switch_Main_Bank
    
    LDA #$FF
    STA Music_Ram_Clear_Cnt

    LDA #$FF
    STA Use_Zero_Ram_End
    STA Use_Ex_Ram_End
    
    LDA #$00
    STA Music_Update_Flag
    
;==============================
;初始化背景调色板
    JSR Wait_Fot_Vblank
    JSR Init_Palette_Color
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Set_NameTable_Attributes_Ex
    .ENDIF
    JSR Set_NameTable_Attributes

    .IF TRACK_START_ENABLE > 0
Init_Start_Music
    LDX #$00
Init_Start_Music_Write
    TXA
    JSR Get_Collection_Order
    JSR Get_Music_Item_Profile
    LDY #MUSIC_PROFILE_START_INDEX
    LDA [Data_Addr_L],Y
    BEQ Init_Start_Music_Write_Zero
    SEC
    SBC #$01
Init_Start_Music_Write_Zero
    STA Music_Track_Cur,X
    INX
    CPX #ITEM_MAX_SIZE
    BCC Init_Start_Music_Write
    .ENDIF
    
    LDA #AUTO_PLAY_ENABLE
    STA Music_Auto_Play
    
    .IF ITEM_SELECT > 0
        LDA #ITEM_SELECT - 1
    .ELSE
        LDA #ITEM_SELECT
    .ENDIF
    
    STA Music_Item_Cur
    JSR Set_Sound_Total
    JSR Update_Item_Name_Length
    
    JSR Wait_For_PPU_Proc
    
    JSR Show_Static_Text
    JSR Wait_For_PPU_Proc
    
    .IF SOUND_BAR_SHOW_ENABLE
    JSR Sound_Bar_Text_Set
    JSR Wait_For_PPU_Proc
    .ENDIF
    
    .IF Track_Name_Pos
    JSR Show_Cur_Track_Name
    .ENDIF
    
    JSR Wait_For_PPU_Proc
;==================================================

    BIT $FFFF
    ;音乐bank初始化
    JSR Init_Sound_Bank
    
    JSR Music_Show
    JSR Time_Show
    JSR Wait_Fot_Vblank
    
    LDA #TEXT_SCROLL_DELAY_TIME
    STA Scroll_Time_Delay
    
    LDA #$FF
    STA Nmi_Level
    LDA #$88
    STA PPU_Ctrl_Buf
    STA PPU_CTRL
    
    JSR Sound_Reset_Proc
    JSR Show_Page_Text
    
    LDA #$FF
    STA Music_Ram_Clear_Cnt
    LDA #ITEM_MAX_INDEX
    STA Item_Max_Index
    
    LDA #$08
    JSR Wait_For_Time_Delay
    
    .IF EXTENDED_ATTRIBUTES_ENABLE
        JSR Update_Item_Color
    .ENDIF

    JSR Init_Palette_Buffer
    
    LDA #$1E
    STA PPU_Mask_Buf
    
    LDA #$01
    STA Music_Ready_Flag
    
    JSR Music_Song_Play_Current_Item

    .IF MUSIC_SHOW_INFO_ENABLE
        LDA #$00
        STA PPU_Buf_Pos
        JSR Show_Music_Info
    .ENDIF
    
    CLI
    JMP MainLoop
