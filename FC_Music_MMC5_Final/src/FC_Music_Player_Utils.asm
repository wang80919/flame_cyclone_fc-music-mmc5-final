;==============================
HEX_To_Dec;十六进制转十进制
    STA HEX_Data
    PHA
    TXA
    PHA
    LDX #$00
    LDA #$00
HEX_Cln
    STA DEC_H,X
    INX
    CPX #$03
    BCC HEX_Cln
    LDA HEX_Data
;------------------------------
HEX_100
    CMP #100
    BCC HEX_10
    SEC
    SBC #100
    INC DEC_H
    BNE HEX_100
;------------------------------
HEX_10
    CMP #10
    BCC HEX_1
    SEC
    SBC #10
    INC DEC_T
    BNE HEX_10
;------------------------------
HEX_1
    STA DEC_L
    PLA
    TAX
    PLA
    RTS

;==============================
;转换十进制到PPU缓冲
Convert_Dec_To_PPU_100
    LDA DEC_H
    ORA #'0'
    STA PPU_Data_Buf,X
    INX
Convert_Dec_To_PPU_10
    LDA DEC_T
    ORA #'0'
    STA PPU_Data_Buf,X
    INX
Convert_Dec_To_PPU_1
    LDA DEC_L
    ORA #'0'
    STA PPU_Data_Buf,X
    INX
    RTS

;==================================================
;Nmi计时
Time_Wait_Proc
    LDA Time_Wait_Cnt
    BEQ Time_Wait_Proc_End
    DEC Time_Wait_Cnt
Time_Wait_Proc_End
    RTS

;==============================
;音乐端口清除
Sound_Data_Clear
    LDA #SOUND_RAM_CLEAR_COUNT - 1
    STA Music_Ram_Clear_Cnt
Sound_Data_Clear_Wait
    LDA Music_Ram_Clear_Cnt
    BPL Sound_Data_Clear_Wait
    RTS

;==============================
;音乐端口清除
Sound_Port_Clear
    LDA #$0B
    STA $4015
    LDA #$00
    STA $4008
    
    LDA #$0F
    STA $4015
    JSR .Wait
    LDA #$00
    STA $4010
    STA $4011
    STA $4012
    STA $4013

    LDA #$30
    STA $4000
    JSR .Wait
    STA $4004
    JSR .Wait
    STA $400C
    JSR .Wait
    LDA #$7F
    STA $4001
    JSR .Wait
    STA $4005
    
    LDA #$00
    STA $4002
    STA $4003
    STA $4006
    STA $4007
    STA $400A
    STA $400B
    STA $400E
    STA $400F
    RTS
.Wait
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    RTS

;==================================================
Disable_Sprite_Show
    LDA PPU_Mask_Buf
    AND #%00010000 ^ $FF
    STA PPU_Mask_Buf
    RTS

;==================================================
Enable_Sprite_Show
    LDA PPU_Mask_Buf
    ORA #%00010000
    STA PPU_Mask_Buf
    RTS

;==================================================
Disable_Bar_Time_Draw;禁用音乐条刷新
    LDA Menu_Proc_Flag
    ORA #MENU_PROC_BAR | MENU_PROC_TIME
    STA Menu_Proc_Flag
    RTS

;==============================
Time_Count;计时
    LDA Music_Stop_State
    ORA Time_Wait_Cnt
    BNE Time_Count_End
    INC Time_Cnt
    LDA Time_Cnt
    CMP #60
    BCC Time_Count_End
    LDA #00
    STA Time_Cnt
    INC Time_S
    INC Music_Song_Cur_Time
Time_S_Cnt
    LDA Time_S
    CMP #60
    BCC Time_Count_End
    LDA #00
    STA Time_S
    INC Time_M

Time_M_Cnt
    LDA Time_M
    CMP #60
    BCC Time_Count_End
    LDA #00
    STA Time_M
    INC Time_H

Time_H_Cnt
    LDA Time_H
    CMP #24
    BCC Time_Count_End
    LDA #00
    STA Time_H
    
Time_Count_End
    RTS

;==============================
Vram_Clear;初始化图形内存
    LDA #$20
    STA PPU_ADDRESS
    LDA #$00
    STA PPU_ADDRESS
    LDA #$00
    LDY #$00
    LDX #$10
.Write
    STA PPU_DATA
    INY
    BNE .Write
    DEX
    BNE .Write
    RTS
    