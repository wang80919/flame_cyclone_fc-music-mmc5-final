;==================================================
Show_Cursor;显示箭头光标
    LDA PPU_Mask_Buf
    AND #%00010000
    EOR #%00010000
    ORA Time_Wait_Cnt
    BNE Show_Cursor_End
    
    LDA Music_Item_Cur
    SEC
    SBC Page_Cur_Index
    ASL A
    TAX
    LDA Item_Pos_Data + 0,X
    AND #$E0
    STA Data_Addr_L
    LDA Item_Pos_Data + 1,X
    AND #$03
    STA Data_Addr_H
    
    LSR Data_Addr_H
    ROR Data_Addr_L
    
    LSR Data_Addr_H
    ROR Data_Addr_L
    
    LDA Data_Addr_L
    SEC
    SBC #$01
    
    ;精灵Y坐标
    .IF OAM_DMA_WRITE_ENABLE
    STA OAM_DMA_TEMP_ADDR + $00
  .ELSE
    STA PPU_OAM_DATA
    .ENDIF
    
    LDA Music_Stop_State
    BEQ .Write_Cursor_Auto
    
.Write_Cursor_Normal
    LDA #PLAY_STOP_ID
    CLC
    ADC Music_Auto_Play
    BNE .Write_Cursor_Tile
.Write_Cursor_Auto
    LDA #PLAY_TILE_ID
    CLC
    ADC Music_Auto_Play
.Write_Cursor_Tile
    
    ;精灵Tile
    .IF OAM_DMA_WRITE_ENABLE
    STA OAM_DMA_TEMP_ADDR + $01
  .ELSE
    STA PPU_OAM_DATA
    .ENDIF
    
    LDA #$00
    ;LDA #$20
    
    ;精灵属性
    .IF OAM_DMA_WRITE_ENABLE
    STA OAM_DMA_TEMP_ADDR + $02
  .ELSE
    STA PPU_OAM_DATA
    .ENDIF
    
    ;居中显示
    .IF ITEM_CENTER_SHOW
    LDA #$20 - 3
    SEC
    SBC Music_Name_Length
    LSR A
    STA Data_Buf
    ASL A
    ASL A
    ASL A
    SEC
    SBC #10
  .ELSE
    LDA Music_Item_Cur
    SEC
    SBC Page_Cur_Index
    ASL A
    TAX
    LDA Item_Pos_Data,X
    AND #$1F
    ASL A
    ASL A
    ASL A
    SEC
    SBC #10
    .ENDIF
    
    ;精灵X坐标
    .IF OAM_DMA_WRITE_ENABLE
    STA OAM_DMA_TEMP_ADDR + $03
  .ELSE
    STA PPU_OAM_DATA
    .ENDIF
    
Show_Cursor_End
    RTS
