;FC_Music_Player_Final
;FlameCyclone 20240606
    .INCLUDE "src/FC_Music_Player_Constant.asm"
    .INCLUDE "src/FC_Music_Player_Mapper.asm"
    .INCLUDE "FC_Music_Player_Config.asm"
    .INCLUDE "src/FC_Music_Player_Common.asm"
    .INCLUDE "FC_Music_Player_Music_Bank.asm"
    
;======================================================================
;音乐数据块
    .IF MUSIC_NAME_BANK
        .BANK MUSIC_NAME_BANK & BANK_DATA_MASK
        .IF MUSIC_NAME_ADDR
            .ORG MUSIC_NAME_ADDR
        .ENDIF
        .INCLUDE "FC_Music_Player_Track_Name.asm"
    .ENDIF
  
    .IF (MUSIC_INFO_BANK) & (Track_Name_Pos)
        .BANK MUSIC_INFO_BANK & BANK_DATA_MASK
        .IF MUSIC_INFO_ADDR
            .ORG MUSIC_INFO_ADDR
        .ENDIF
        .INCLUDE "FC_Music_Player_Music_Info.asm"
    .ENDIF
  
    .IF MUSIC_TIME_BANK
        .BANK MUSIC_TIME_BANK & BANK_DATA_MASK
        .IF MUSIC_TIME_ADDR
            .ORG MUSIC_TIME_ADDR
        .ENDIF
        .INCLUDE "FC_Music_Player_Track_Time.asm"
    .ENDIF
  
;CHR图形数据
;======================================================================
    .IF 0 = NES_8KB_CHR_SIZE
    
        .BANK CHR_BKG_DATA_BANK & BANK_DATA_MASK
        .ORG CHR_BKG_DATA_ADDR
        .INCBIN "data/pattern_bkg.chr"
        .BANK CHR_SPRITE_DATA_BANK & BANK_DATA_MASK
        .ORG CHR_SPRITE_DATA_ADDR
        .INCBIN "data/pattern_sp.chr"
    
    .ELSE
    
        .BANK NES_16KB_PRG_SIZE * 2
        .INCBIN "data/pattern_bkg.chr"
        .INCBIN "data/pattern_sp.chr"
    
    .ENDIF
    
;======================================================================
	INCLUDE "FC_Music_Player_Custom_Play.asm"

    .IF EXTENDED_ATTRIBUTES_ENABLE
        .IF EXTENDED_ATTR_DATA_BANK
            .BANK EXTENDED_ATTR_DATA_BANK & BANK_DATA_MASK
            .ORG EXTENDED_ATTR_DATA_ADDR
Palette_Attributes_Ex
            .INCBIN "data/attributes_ex.attr"
        .ENDIF
    .ENDIF

;======================================================================
    .BANK PROGRAM_BANK & BANK_DATA_MASK
    .ORG PROGRAM_ADDR
    
    .IF COVER_ENABLE > 0
        .INCLUDE "FC_Music_Player_Cover.asm"
    .ENDIF
    
    .INCLUDE "src/FC_Music_Player_Text_Proc.asm"
    .INCLUDE "src/FC_Music_Player_Scroll.asm"
    
;--------------------------------------------------
;命名表数据
    .IF EXTENDED_ATTRIBUTES_ENABLE
        .IF 0 == EXTENDED_ATTR_DATA_BANK
Palette_Attributes_Ex
            .INCBIN "data/attributes_ex.attr"
        .ENDIF
    .ENDIF
Palette_Attributes_2000
        .IF SOUND_BAR_SHOW_ENABLE
            .INCBIN "data/attributes_bar.attr"
        .ELSE
            .INCBIN "data/attributes.attr"
        .ENDIF
Palette_Attributes_2400
    .INCBIN "data/attributes_bar_2400.attr"

;--------------------------------------------------
;调色板数据
Palette_Data
    .HEX 0F 37 27 23 0F 33 23 3B 0F 26 16 0F 0F 35 25 21
    .HEX 0F 20 26 25 0F 24 20 0F 0F 24 20 0F 0F 24 20 0F

    .INCLUDE "FC_Music_Player_Music_Profile.asm"
    
;======================================================================
;音乐数据块
    .IF (0 = MUSIC_INFO_BANK) & (0 != Track_Name_Pos)
        .INCLUDE "FC_Music_Player_Music_Info.asm"
    .ENDIF
  
    .IF 0 = MUSIC_NAME_BANK
        .INCLUDE "FC_Music_Player_Track_Name.asm"
    .ENDIF
  
    .IF 0 = MUSIC_TIME_BANK
        .INCLUDE "FC_Music_Player_Track_Time.asm"
    .ENDIF
  
    .INCLUDE "FC_Music_Player_Nmi.asm"
    .INCLUDE "FC_Music_Player_Reset.asm"
    
;==================================================
Init_Ex_Ram;初始化SRAM
    LDX #$00
    LDA #$00
Init_Ex_Ram_Set
    STA Use_Ex_Ram_Begin,X
    INX
    BNE Init_Ex_Ram_Set
    RTS

;==================================================
Init_PPU_Buffer;初始化PPU缓冲
    LDX #$00
    LDA #$00
Init_PPU_Ram_Set
    STA Use_PPU_Ram_Begin,X
    INX
    BNE Init_PPU_Ram_Set
    RTS

;==============================
Wait_Fot_Vblank;延时等待
    LDA PPU_STATUS
    BPL Wait_Fot_Vblank
    RTS
    
;==============================
Wait_For_PPU_Proc;延时等待PPU处理完毕
    JSR Wait_Fot_Vblank
    JSR FC_PPU_Buffer_Process
    RTS
    
;==============================
Wait_For_Time_Delay;延时等待PPU处理完毕
    STA Time_Wait_Cnt
    LDA PPU_Ctrl_Buf
    BPL .End
.Wait
    LDA Time_Wait_Cnt
    BNE .Wait
.End
    RTS
    
;==============================
OAM_Ram_Init;初始化精灵内存
    BIT PPU_STATUS
    BPL OAM_Ram_Init
    LDA #$00
    STA PPU_OAM_ADDR
    
    LDX #$00
OAM_Ram_Init_Write
    LDA #$F8
    
    .IF OAM_DMA_WRITE_ENABLE
    STA OAM_DMA_TEMP_ADDR,X
    .ENDIF
    
    STA PPU_OAM_DATA
    INX
    LDA #$F8
    
    .IF OAM_DMA_WRITE_ENABLE
    STA OAM_DMA_TEMP_ADDR,X
    .ENDIF
    
    STA PPU_OAM_DATA
    INX
    LDA #$00
    
    .IF OAM_DMA_WRITE_ENABLE
    STA OAM_DMA_TEMP_ADDR,X
    .ENDIF
    
    STA PPU_OAM_DATA
    INX
    LDA #$F8
    
    .IF OAM_DMA_WRITE_ENABLE
    STA OAM_DMA_TEMP_ADDR,X
    .ENDIF
    
    STA PPU_OAM_DATA
    INX
    BNE OAM_Ram_Init_Write
    RTS
    
    .INCLUDE "src/FC_Music_Player_Palette.asm"
    .INCLUDE "src/FC_Music_Player_Utils.asm"
    .INCLUDE "src/FC_Music_Player_Auto_Play.asm"
    .INCLUDE "src/FC_Music_Player_PPU.asm"
    .INCLUDE "src/FC_Music_Player_Joystick.asm"
    .INCLUDE "src/FC_Music_Player_Cursor.asm"
    .INCLUDE "src/FC_Music_Player_Sound_Show.asm"
    .INCLUDE "src/FC_Music_Player_Music_Show.asm"
    .INCLUDE "src/FC_Music_Player_Page.asm"
    .INCLUDE "src/FC_Music_Player_Music_Play.asm"
    .INCLUDE "src/FC_Music_Player_Music_Select.asm"

;==================================================
    .BANK RESET_BANK & BANK_DATA_MASK
    .ORG RESET_ADDR
    
;==================================================
    .INCLUDE "src/FC_Music_Player_Banking.asm"
    
;==================================================
Sound_Reset;音乐重设(如果有的话)
    JSR Switch_Music_Bank_8000_DFFF  ;切换到音乐bank
    JSR Music_Play_Addr_Op        ;执行音乐重置
    JSR Switch_Main_Bank   ;切回主程序
    RTS
    
;==================================================
Sound_Init;音乐初始化
    PHA
    JSR Switch_Music_Bank_8000_DFFF  ;切换到音乐bank
    PLA
    
    LDX #$00
    LDY #$00
    JSR Music_Play_Addr_Op        ;执行音乐初始化
    
    .IF 19 = MAPPER_NUMBER
    MACRO_SRAM_ENABLE      ;启用SRAM
    .ENDIF
    
    JSR Switch_Main_Bank   ;切回主程序
    RTS
    
;==================================================
Sound_Play;音乐播放
    JSR Switch_Music_Bank_8000_BFFF  ;切换到音乐bank
    JSR Music_Play_Addr_Op        ;执行音乐播放
    
    .IF 19 = MAPPER_NUMBER
  
    LDA Reg_A_Bak
    PHA
    LDA Reg_X_Bak
    PHA
    LDY #$08
    LDX #$47
.Read
    STX $F800
    LDA $4800
    STA Reg_A_Bak
    STX Reg_X_Bak
    TXA
    LSR A
    LSR A
    LSR A
    TAX
    LDA Reg_A_Bak
    STA Sound_Bar_Cur + $10,X
    
    LDX Reg_X_Bak
    
    TXA
    CLC
    ADC #$08
    TAX
    DEY
    BNE .Read

    PLA
    STA Reg_X_Bak
    PLA
    STA Reg_A_Bak
    MACRO_SRAM_ENABLE      ;启用SRAM
    
    .ENDIF
    
    JSR Switch_Main_Bank   ;切回主程序
    RTS
    
;==================================================
MainLoop;死循环
    JSR PCM_Play_Addr_Op
    JMP MainLoop

;==================================================
    MACRO_IRQ_OPERATE
    
;==================================================
Nmi_Program;Nmi中断处理
    PHA
    TXA
    PHA
    TYA
    PHA
    
    ;读取清除Vblank标志, 防止重复进入
    BIT PPU_STATUS
    
    .IF COVER_ENABLE
    
    LDA Cover_Mode_Time
    BEQ .Begin
    JSR Nmi_For_Cover
    JMP .End
    
    .ENDIF
    
.Begin
    
    ;重置IRQ索引
    LDA #$00
    STA IRQ_Process_Index
    
    ;备份bank号
    LDA Prg_Bank_8000_Bak
    PHA
    LDA Prg_Bank_A000_Bak
    PHA
    
    ;切换主程序bank
    JSR Switch_Main_Bank
    
    INC Nmi_Level
    
    ;Nmi处理
    JSR Nmi_Process
    
    DEC Nmi_Level
    
    ;恢复bank号
    PLA
    STA Prg_Bank_A000_Bak
    PLA
    STA Prg_Bank_8000_Bak
    PHP
    SEI
    LDA Prg_Bank_8000_Bak
    JSR Switch_Bank_8000_A
    LDA Prg_Bank_A000_Bak
    JSR Switch_Bank_A000_A
    PLP
    
.End
    PLA
    TAY
    PLA
    TAX
    PLA
    RTI

;==================================================
Reset_Program;重置中断处理
    SEI
    CLD
    LDA #$00
    STA PPU_CTRL
    STA PPU_MASK
    
    ;切换主程序bank
    JSR Switch_Main_Bank
    
    ;程序处理开始
    JMP Program_Begin

;==================================================
Irq_Program;Irq中断处理
    PHA
    TXA
    PHA
    TYA
    PHA
    
    MACRO_ACK_IRQ
    
    .IF 5 == MAPPER_NUMBER | 24 == MAPPER_NUMBER | 26 == MAPPER_NUMBER
    JMP IRQ_Process_By_Index
    .ELSE
    JSR IRQ_Process_By_Index
    .ENDIF
    
Irq_ProgramEnd
    PLA
    TAY
    PLA
    TAX
    PLA
    RTI

GlobalReturn
    RTS

;==================================================
DMC_Offset_Set
    CLC
    ADC Music_DMC_Offset
    STA $4012
    RTS

;==============================
Vram_Init;初始化图形内存
    .IF 0 = NES_8KB_CHR_SIZE
    LDA #CHR_BKG_DATA_BANK
    JSR Switch_Bank_8000_A
    LDA #LOW(CHR_BKG_DATA_ADDR)
    STA <Data_Addr_L
    LDA #HIGH(CHR_BKG_DATA_ADDR)
    STA <Data_Addr_H
    LDY #$00
    LDX #CHR_BKG_DATA_SIZE
    LDA #HIGH(CHR_BKG_PPU_ADDR)
    STA PPU_ADDRESS
    LDA #LOW(CHR_BKG_PPU_ADDR)
    STA PPU_ADDRESS
    JSR .Write_PPU
    
    LDA #CHR_SPRITE_DATA_BANK
    JSR Switch_Bank_8000_A
    LDA #LOW(CHR_SPRITE_DATA_ADDR)
    STA <Data_Addr_L
    LDA #HIGH(CHR_SPRITE_DATA_ADDR)
    STA <Data_Addr_H
    LDY #$00
    LDX #CHR_SPRITE_DATA_SIZE
    LDA #HIGH(CHR_SPRITE_PPU_ADDR)
    STA PPU_ADDRESS
    LDA #LOW(CHR_SPRITE_PPU_ADDR)
    STA PPU_ADDRESS
    JSR .Write_PPU
    JSR Switch_Main_Bank
    RTS
    
.Write_PPU
    LDA [Data_Addr_L],Y
    STA PPU_DATA
    INY
    BNE .Write_PPU
    INC <Data_Addr_H
    DEX
    BNE .Write_PPU
    RTS
    
  .ELSE
    
    RTS
    
    .ENDIF

    .BANK RESET_BANK & BANK_DATA_MASK
    .INCLUDE "src/FC_Music_Player_Interface.asm"

;==================================================
;NES入口地址
    .ORG $FFFA
    .DW Nmi_Program
    .DW Reset_Program
    .DW Irq_Program

;==================================================
;外部接口
    .ORG $FFE0
    .DW Fast_Item           ;快速节目
    .DW Fast_Music          ;快速曲目
    .DW Item_Max_Index      ;最大节目
    .DW Music_Item_Cur      ;当前节目
    .DW Music_Track_Cur     ;当前曲目
    .DW Music_Stop_State    ;停止
    .DW Music_Auto_Play     ;自动播放