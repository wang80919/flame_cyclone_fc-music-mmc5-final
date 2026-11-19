;==============================
Update_Palette_Data;更新调色板数据

    .IF UPDATE_PALETTE_ENABLE
    LDA PPU_Mask_Buf
    AND #%00010000
    BEQ Update_Palette_Data_End
    
Update_Sprite_Palette_Data_Set
    LDX Palette_Index
    LDA Update_Sprite_Palette_Data,X
    STA Sprite_Palette_Update_Addr

Update_Bkg_Palette_Data

Update_Palette_Data_Check
    LDA Palette_Wait_Cnt
    BPL Update_Palette_Data_Check_Over
    LDA #PALETTE_UPDATE_INTERVAL
    STA Palette_Wait_Cnt

Update_Palette_Data_Check_Over
    DEC Palette_Wait_Cnt
    BNE Update_Palette_Data_End
    
    ;JSR Disable_Bar_Time_Draw
    
    LDA #PALETTE_UPDATE_INTERVAL
    STA Palette_Wait_Cnt
    
Update_Bkg_Palette_Data_Set
    LDA Palette_Index
    AND #$03
    CMP #$02
    BNE Update_Sprite_Palette_Index
    LDA Music_Stop_State
    BNE Update_Sprite_Palette_Index
    INC Bkg_Palette_Update_Addr
    
    LDA Bkg_Palette_Update_Addr
    CMP #PALETTE_UPDATE_MAX
    BCC Update_Sprite_Palette_Index
    LDA #PALETTE_UPDATE_MIN
    STA Bkg_Palette_Update_Addr

Update_Sprite_Palette_Index
    INC Palette_Index
Update_Palette_Index_Check
    LDA Palette_Index
    CMP #16
    BCC Update_Palette_Data_End
    LDA #$00
    STA Palette_Index
Update_Palette_Data_End
    .ENDIF
    RTS
    
    .IF UPDATE_PALETTE_ENABLE
Update_Sprite_Palette_Data
        .DB $21
        .DB $21
        .DB $11
        .DB $01
        .DB $01
        .DB $11
        .DB $21
        .DB $21
        .DB $11
        .DB $01
        .DB $11
        .DB $21
        .DB $21
        .DB $11
        .DB $01
        .DB $11
    .ENDIF
