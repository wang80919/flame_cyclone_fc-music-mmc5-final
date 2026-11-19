
;==============================
    .IF SOUND_BAR_SHOW_ENABLE
;音乐条显示
Music_Vision
    LDA Nmi_Level
    BNE Music_Vision_End
    LDA Menu_Proc_Flag
    AND #MENU_PROC_BAR | MENU_PROC_PAGE | MENU_PROC_SCROLL
    BNE Music_Vision_End
    LDX PPU_Buf_Pos
    JSR Music_Animation
    STX PPU_Buf_Pos
    LDA Menu_Proc_Flag
    ORA #MENU_PROC_BAR
    STA Menu_Proc_Flag
Music_Vision_End
    RTS
    
;------------------------------
;音乐条显示处理
Music_Animation
    LDA #$00
    STA Sound_Bar_Index
    
    .IF SOUND_BAR_APU_SQ1_ENABLE
        JSR Volume_Set_Cnt
        LDA APU_STATUS
        AND #$01
        BEQ .Update_Sq1
        LDA Sound_Bar_Cur + $1
        ORA Sound_Bar_Cur + $2
        ORA Sound_Bar_Cur + $3
        BEQ .Update_Sq1
        LDA Sound_Bar_Cur + $0
        BEQ .Update_Sq1
        AND #$10
        BNE .Update_Sq1_By_Volume
        LDA #$0F
        JMP .Update_Sq1
        
.Update_Sq1_By_Volume
        LDA Sound_Bar_Cur + $0
.Update_Sq1
        JSR Volume_Convert
    .ENDIF
    
    .IF SOUND_BAR_APU_SQ2_ENABLE
        JSR Volume_Set_Cnt
        LDA APU_STATUS
        AND #$02
        BEQ .Update_Sq2
        LDA Sound_Bar_Cur + $5
        ORA Sound_Bar_Cur + $6
        ORA Sound_Bar_Cur + $7
        BEQ .Update_Sq2
        LDA Sound_Bar_Cur + $4
        BEQ .Update_Sq2
        AND #$10
        BNE .Update_Sq2_By_Volume
        LDA #$0F
        JMP .Update_Sq2
        
.Update_Sq2_By_Volume
        LDA Sound_Bar_Cur + $4
.Update_Sq2
        JSR Volume_Convert
    .ENDIF
    
    .IF SOUND_BAR_APU_TRI_ENABLE
        JSR Volume_Set_Cnt
        LDA APU_STATUS
        AND #$04
        BEQ .Update_Tri
.Update_Data
        LDA Sound_Bar_Cur + $8
        BEQ .Update_Tri
        CMP #$80
        BNE .Update_By_Timer
        
.Update_By_Reload
        LDA Sound_Bar_Cur + $8
        AND #$7F
        LSR A
        LSR A
        LSR A
        JMP .Update_Tri
.Update_By_Timer
        LDA Sound_Bar_Cur + $A
        LSR A
        LSR A
        LSR A
        LSR A
        LSR A
        STA Data_Buf
        LDA Sound_Bar_Cur + $B
        ASL A
        ORA Data_Buf
.Update_Tri
        AND #$0F
        JSR Volume_Convert_Set
    .ENDIF

    .IF SOUND_BAR_APU_NOI_ENABLE
        JSR Volume_Set_Cnt
        LDA APU_STATUS
        AND #$08
        BEQ .Update_Noi
        LDA Sound_Bar_Cur + $E
        ORA Sound_Bar_Cur + $F
        BEQ .Update_Noi
        
        LDA Sound_Bar_Cur + $C
        BEQ .Update_Noi_Check
        AND #$10
        BNE .Update_Noi_By_Volume
        
.Update_Noi_Check
        LDA Sound_Bar_Cur + $F
        BNE .Update_Noi_By_Length
.Update_Noi_By_Length 
        LDA Sound_Bar_Cur + $F
        BMI .Update_Noi_By_Length_Max
        LSR A
        LSR A
        LSR A
        JMP .Update_Noi
.Update_Noi_By_Length_Max
        LDA #$0F
        BNE .Update_Noi
.Update_Noi_By_Volume
        LDA Sound_Bar_Cur + $C
.Update_Noi
        JSR Volume_Convert
    .ENDIF
    
    .IF SOUND_BAR_APU_DMC_ENABLE
        JSR Volume_Set_Cnt
        JSR Sound_Bar_DMC
        JSR Volume_Convert
    .ENDIF
    
    .IF 5 = MAPPER_NUMBER
        .IF SOUND_BAR_MMC5_SQ1_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $10
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_MMC5_SQ2_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $14
            JSR Volume_Convert
        .ENDIF
    .ENDIF
    
    .IF ((24 = MAPPER_NUMBER) | (26 = MAPPER_NUMBER))
        .IF SOUND_BAR_VRC6_SQ1_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $10
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_VRC6_SQ2_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $14
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_VRC6_SAW_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $18
            LSR
            LSR
            JSR Volume_Convert
        .ENDIF
    .ENDIF
    
    .IF 69 = MAPPER_NUMBER
        .IF SOUND_BAR_5B_CH1_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $10
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_5B_CH2_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $14
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_5B_CH3_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $18
            LSR
            LSR
            JSR Volume_Convert
        .ENDIF
    .ENDIF
    
    .IF 19 = MAPPER_NUMBER
        .IF SOUND_BAR_NAMCO_CH1_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $18
            JSR Volume_Convert
        .ENDIF

        .IF SOUND_BAR_NAMCO_CH2_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $19
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_NAMCO_CH3_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $1A
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_NAMCO_CH4_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $1B
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_NAMCO_CH5_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $1C
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_NAMCO_CH6_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $1D
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_NAMCO_CH7_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $1E
            JSR Volume_Convert
        .ENDIF
        
        .IF SOUND_BAR_NAMCO_CH8_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Cur + $1F
            JSR Volume_Convert
        .ENDIF
    .ENDIF
        
    .IF 85 = MAPPER_NUMBER
        .IF SOUND_BAR_VRC7_CH1_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Ex_Cur + $40
            JSR Volume_Convert
            LDA #$00
            JSR Vrc7_Sound_Update
        .ENDIF

        .IF SOUND_BAR_VRC7_CH2_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Ex_Cur + $41
            JSR Volume_Convert
            LDA #$01
            JSR Vrc7_Sound_Update
        .ENDIF
        
        .IF SOUND_BAR_VRC7_CH3_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Ex_Cur + $42
            JSR Volume_Convert
            LDA #$02
            JSR Vrc7_Sound_Update
        .ENDIF
        
        .IF SOUND_BAR_VRC7_CH4_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Ex_Cur + $43
            JSR Volume_Convert
            LDA #$03
            JSR Vrc7_Sound_Update
        .ENDIF
        
        .IF SOUND_BAR_VRC7_CH5_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Ex_Cur + $44
            JSR Volume_Convert
            LDA #$04
            JSR Vrc7_Sound_Update
        .ENDIF
        
        .IF SOUND_BAR_VRC7_CH6_ENABLE
            JSR Volume_Set_Cnt
            LDA Sound_Bar_Ex_Cur + $45
            JSR Volume_Convert
            LDA #$05
            JSR Vrc7_Sound_Update
        .ENDIF
    .ENDIF
    RTS

Sound_Bar_DMC
    LDA APU_STATUS
    AND #$10
    BEQ Sound_Bar_DMC_End
    LDA #$0F
Sound_Bar_DMC_End
    RTS
    
    .IF 85 = MAPPER_NUMBER
;------------------------------
;音乐条处理
Vrc7_Sound_Update
    STX Reg_X_Bak
    BCC .End
    TAX
    LDA Sound_Bar_Ex_Cur + $20,X
    AND #$10
    BNE .Update
    LDA Sound_Bar_Ex_Cur + $40,X
    BEQ .End
    DEC Sound_Bar_Ex_Cur + $40,X
    BPL .End
.Update
    LDA Sound_Bar_Ex_Cur + $30,X
    AND #$0F
    STA Sound_Bar_Ex_Cur + $40,X
    LDA #$0F
    SEC
    SBC Sound_Bar_Ex_Cur + $40,X
    STA Sound_Bar_Ex_Cur + $40,X
.End
    LDX Reg_X_Bak
    RTS
    .ENDIF
    
;------------------------------
;音乐条处理
Volume_Convert
    AND #$0F
Volume_Convert_Set
    TAY
    
    LDA Sound_Bar_Index
    CMP #SOUND_BAR_SWAP_BEGIN
    BCC Volume_Count
    
    LDA Nmi_Time_Count
    AND #$01
    BNE .Odd

.Even
    LDA Sound_Bar_Index
    CMP #SOUND_BAR_SWAP_BEGIN + SOUND_BAR_SWAP_COUNT
    BCC Volume_Count
    BCS Volume_Convert_End_Nothing

.Odd
    LDA Sound_Bar_Index
    CMP #SOUND_BAR_SWAP_BEGIN + SOUND_BAR_SWAP_COUNT
    BCC Volume_Convert_End_Nothing

Volume_Count
    LDA #$08
    STA Sound_Bar_Cnt
Volume_FILL
    DEY
    BEQ Volume_Half
    BMI Volume_Empty
    DEY
Volume_Full
    LDA #$16
    BNE Volume_PPU
Volume_Half
    LDA #$15
    BNE Volume_PPU
Volume_Empty
    LDA #$14
Volume_PPU
    STA PPU_Data_Buf,X
    INX
    DEC Sound_Bar_Cnt
    BNE Volume_FILL
Volume_Convert_End_Update
    INC Sound_Bar_Index
    SEC
    RTS
Volume_Convert_End_Nothing
    INC Sound_Bar_Index
    CLC
    RTS

Volume_Set_Cnt
    LDA Sound_Bar_Index
    CMP #SOUND_BAR_SWAP_BEGIN
    BCC .Write_Addr
    
    LDA Nmi_Time_Count
    AND #$01
    BNE .Odd

.Even
    LDA Sound_Bar_Index
    CMP #SOUND_BAR_SWAP_BEGIN + SOUND_BAR_SWAP_COUNT
    BCC .Write_Addr
    BCS .End_Nothing

.Odd
    LDA Sound_Bar_Index
    CMP #SOUND_BAR_SWAP_BEGIN + SOUND_BAR_SWAP_COUNT
    BCC .End_Nothing

;------------------------------
.Write_Addr
    LDA #PPU_MODE_CNT_LINE
    STA PPU_Data_Buf,X
    INX
    LDA Sound_Bar_Index
    ASL A
    TAY
    INY
    LDA Volume_Bar_PPPU_Addr,Y
    STA PPU_Data_Buf,X
    INX
    DEY
    LDA Volume_Bar_PPPU_Addr,Y
    STA PPU_Data_Buf,X
    INX
    LDA #$08
    STA PPU_Data_Buf,X
    INX
.End_Update
    SEC
    RTS
.End_Nothing
    CLC
    RTS
    
    .MACRO MACRO_SOUND_BAR_POS
        .IF \1
Sound_Bar_Pos_\@ .RS $00
            .DW Sound_Bar_Pos + ($20*Sound_Bar_Pos_\@)
            .RS $01
        .ENDIF
    .ENDM
    
        .RSSET 0
;------------------------------
Volume_Bar_PPPU_Addr
            .IF 0 = ((5 = MAPPER_NUMBER) | ((24 = MAPPER_NUMBER) | (26 = MAPPER_NUMBER)) | (69 = MAPPER_NUMBER) | (19 = MAPPER_NUMBER) | (85 = MAPPER_NUMBER))
                    MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ1_ENABLE
                    MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ2_ENABLE
                    MACRO_SOUND_BAR_POS SOUND_BAR_APU_TRI_ENABLE
                    MACRO_SOUND_BAR_POS SOUND_BAR_APU_NOI_ENABLE
                    MACRO_SOUND_BAR_POS SOUND_BAR_APU_DMC_ENABLE
            .ELSE
        
            .IF 5 = MAPPER_NUMBER
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ2_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_TRI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_NOI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_DMC_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_MMC5_SQ1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_MMC5_SQ2_ENABLE
            .ENDIF

            .IF ((24 = MAPPER_NUMBER) | (26 = MAPPER_NUMBER))
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ2_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_TRI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_NOI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_DMC_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_VRC6_SQ1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_VRC6_SQ2_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_VRC6_SAW_ENABLE
            .ENDIF

            .IF 69 = MAPPER_NUMBER
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ2_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_TRI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_NOI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_DMC_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_5B_CH1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_5B_CH2_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_5B_CH3_ENABLE
            .ENDIF

            .IF 19 = MAPPER_NUMBER
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ2_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_TRI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_NOI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_DMC_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_NAMCO_CH1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_NAMCO_CH2_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_NAMCO_CH3_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_NAMCO_CH4_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_NAMCO_CH5_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_NAMCO_CH6_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_NAMCO_CH7_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_NAMCO_CH8_ENABLE
            .ENDIF

            .IF 85 = MAPPER_NUMBER
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_SQ2_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_TRI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_NOI_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_APU_DMC_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_VRC7_CH1_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_VRC7_CH2_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_VRC7_CH3_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_VRC7_CH4_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_VRC7_CH5_ENABLE
                MACRO_SOUND_BAR_POS SOUND_BAR_VRC7_CH6_ENABLE
            .ENDIF
        .ENDIF
    .ENDIF
    