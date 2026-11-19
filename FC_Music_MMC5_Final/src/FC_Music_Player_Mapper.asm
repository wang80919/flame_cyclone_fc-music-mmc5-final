;==================================================
;Mapper号
MAPPER_NUMBER           = 05
;==================================================
;MMC5 (Mapper 5) 寄存器常量
MAPPER_REG_APU_Pulse_1_0        =   $5000
MAPPER_REG_APU_Pulse_1_1        =   $5001
MAPPER_REG_APU_Pulse_1_2        =   $5002
MAPPER_REG_APU_Pulse_1_3        =   $5003
MAPPER_REG_APU_Pulse_2_0        =   $5004
MAPPER_REG_APU_Pulse_2_1        =   $5005
MAPPER_REG_APU_Pulse_2_2        =   $5006
MAPPER_REG_APU_Pulse_2_3        =   $5007

MAPPER_REG_PCM_MODE_IRQ         =   $5010
MAPPER_REG_RAW_PCM              =   $5011
MAPPER_REG_APU_STATUS           =   $5015

MAPPER_REG_PRG_MODE             =   $5100; 0: 32KB 1: 16KB * 2 2: 16KB + 8 * 2 3: 8*4
MAPPER_REG_CHR_MODE             =   $5101; 0: 8KB 1: 4KB * 2 2: 2KB * 4 3: 1KB * 8
MAPPER_REG_PRG_RAM_PROTECT_1    =   $5102;
MAPPER_REG_PRG_RAM_PROTECT_2    =   $5103;
MAPPER_REG_EX_RAM_MODE          =   $5104; 0: Write Only 1: Write Only 2: RW 3:R
                                            ;0: 只写
                                            ;1: 只写, 扩展属性表模式
                                            ;2: 读写
                                            ;3: 只读
MAPPER_REG_EX_RAM_ADDR          =   $5C00
MAPPER_REG_NT_MAPPING           =   $5105;
MAPPER_REG_FILL_MODE_TILE       =   $5106
MAPPER_REG_FILL_MODE_COLOR      =   $5107

MAPPER_REG_PRG_BANK_6000        =   $5113
MAPPER_REG_PRG_BANK_8000        =   $5114
MAPPER_REG_PRG_BANK_A000        =   $5115
MAPPER_REG_PRG_BANK_C000        =   $5116
MAPPER_REG_PRG_BANK_E000        =   $5117

MAPPER_REG_CHR_BANK_0000        =   $5120
MAPPER_REG_CHR_BANK_0400        =   $5121
MAPPER_REG_CHR_BANK_0800        =   $5122
MAPPER_REG_CHR_BANK_0C00        =   $5123
MAPPER_REG_CHR_BANK_1000        =   $5124
MAPPER_REG_CHR_BANK_1400        =   $5125
MAPPER_REG_CHR_BANK_1800        =   $5126
MAPPER_REG_CHR_BANK_1C00        =   $5127

MAPPER_REG_CHR_BANK_0000_1000   =   $5128
MAPPER_REG_CHR_BANK_0400_1400   =   $5129
MAPPER_REG_CHR_BANK_0800_1800   =   $512A
MAPPER_REG_CHR_BANK_0C00_1C00   =   $512B

MAPPER_REG_CHR_BANK_UPPER       =   $5130
MAPPER_REG_V_SPLIT_MODE         =   $5200
MAPPER_REG_V_SPLIT_SCROLL       =   $5201
MAPPER_REG_V_SPLIT_BANK         =   $5202

MAPPER_REG_IRQ_SCANLINE_VALUE   =   $5203
MAPPER_REG_IRQ_STATUS           =   $5204
MAPPER_REG_MULTIPLIER_A         =   $5205
MAPPER_REG_MULTIPLIER_B         =   $5206

;--------------------------------------------------
MMC5A_CL3_SL3_DATA              =   $5207
MMC5A_CL3_SL3_STATUS            =   $5208
MMC5A_IRQ_TIMER_LSB             =   $5209
MMC5A_IRQ_TIMER_MSB             =   $520A

;==================================================
IRQ_SCANLINE_BEGIN              = 31
;==================================================

;==================================================
;宏常量
;==================================================

;==================================================
    .MACRO MACRO_MAPPER_INIT

    ;设置 PRG 切页模式
    LDA #$03
    STA MAPPER_REG_PRG_MODE

    ;设置 CHR 切页模式
    LDA #$03
    STA MAPPER_REG_CHR_MODE

    ;设置屏幕镜像($50: 水平; $44: 垂直)
    LDA #$50
    STA MAPPER_REG_NT_MAPPING

    ;设置 $C000-$DFFF bank
    LDA #PRG_DATA_BANK_C000 & BANK_DATA_MASK
    ORA #$80
    STA MAPPER_REG_PRG_BANK_C000

    ;初始化 CHR bank
    LDA #$00
    STA MAPPER_REG_CHR_BANK_0000
    LDA #$01
    STA MAPPER_REG_CHR_BANK_0400
    LDA #$02
    STA MAPPER_REG_CHR_BANK_0800
    LDA #$03
    STA MAPPER_REG_CHR_BANK_0C00

    LDA #$04
    STA MAPPER_REG_CHR_BANK_1000
    LDA #$05
    STA MAPPER_REG_CHR_BANK_1400
    LDA #$06
    STA MAPPER_REG_CHR_BANK_1800
    LDA #$07
    STA MAPPER_REG_CHR_BANK_1C00

    LDA #$00
    STA MAPPER_REG_CHR_BANK_0000_1000
    LDA #$01
    STA MAPPER_REG_CHR_BANK_0400_1400
    LDA #$02
    STA MAPPER_REG_CHR_BANK_0800_1800
    LDA #$03
    STA MAPPER_REG_CHR_BANK_0C00_1C00

    ;禁用IRQ
    LDA #$00
    STA MAPPER_REG_IRQ_SCANLINE_VALUE
    STA MAPPER_REG_IRQ_STATUS

    ;设置一下6000-7FFF的RAM
    LDA #$00
    STA MAPPER_REG_PRG_BANK_6000

    ;启用 1KB 扩展RAM ($5C00-$5FFF)
    .IF EXTENDED_ATTRIBUTES_ENABLE
    LDA #$01
    .ELSE
    LDA #$02
    .ENDIF
    
    LDA #$02
    STA MAPPER_REG_EX_RAM_MODE

    ;开启 PRG RAM 写入
    LDA #$02
    STA MAPPER_REG_PRG_RAM_PROTECT_1
    LDA #$01
    STA MAPPER_REG_PRG_RAM_PROTECT_2

    LDX #$00
    LDA #$00
Init_Ex_RAM_Set
    STA MAPPER_REG_EX_RAM_ADDR + $0000,X
    STA MAPPER_REG_EX_RAM_ADDR + $0100,X
    STA MAPPER_REG_EX_RAM_ADDR + $0200,X
    STA MAPPER_REG_EX_RAM_ADDR + $0300,X
    INX
    BNE Init_Ex_RAM_Set
 
    .ENDM

;==================================================
    .MACRO MACRO_MAPPER_SOUND_CLEAR
    LDA #$03
    STA $4015

    LDA #$30
    STA $5000
    JSR .Wait
    STA $5004
    JSR .Wait
    LDA #$7F
    STA $5001
    STA $5005
    JMP .End
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
.End


    .ENDM
 
;==================================================
    .MACRO MACRO_MIRRORING_H
    ;设置屏幕镜像($50: 水平; $44: 垂直)
    LDA #$50
    STA MAPPER_REG_NT_MAPPING
    .ENDM

;==================================================
    .MACRO MACRO_MIRRORING_V
    ;设置屏幕镜像($50: 水平; $44: 垂直)
    LDA #$44
    STA MAPPER_REG_NT_MAPPING
    .ENDM

;==================================================
    .MACRO MACRO_SRAM_ENABLE
    LDA #$02
    STA MAPPER_REG_PRG_RAM_PROTECT_1
    LDA #$01
    STA MAPPER_REG_PRG_RAM_PROTECT_2
    LDA #$02
    STA MAPPER_REG_EX_RAM_MODE
    .ENDM
 
;==================================================
    .MACRO MACRO_SWITCH_BANK_8000_A
    ORA #$80
    STA MAPPER_REG_PRG_BANK_8000
    .ENDM

    .MACRO MACRO_SWITCH_BANK_A000_A
    ORA #$80
    STA MAPPER_REG_PRG_BANK_A000
    .ENDM
 
    .MACRO MACRO_SWITCH_BANK_C000_A
    ORA #$80
    STA MAPPER_REG_PRG_BANK_C000
    .ENDM

    .MACRO MACRO_SWITCH_BANK_E000_A
    ORA #$80
    STA MAPPER_REG_PRG_BANK_E000
    .ENDM

;==================================================
    .MACRO MACRO_TRIGGER_FIRST_IRQ
    LDA #IRQ_SCANLINE_BEGIN
    STA MAPPER_REG_IRQ_SCANLINE_VALUE
    LDA #$80
    STA MAPPER_REG_IRQ_STATUS
    CLI
    .ENDM
 
;==================================================
    .MACRO MACRO_SET_IRQ_SCANLINE_VALUE
    STA MAPPER_REG_IRQ_SCANLINE_VALUE
    .ENDM
 
;==================================================
    .MACRO MACRO_ACK_IRQ
    LDA MAPPER_REG_IRQ_STATUS
    .ENDM
 
;==================================================
    .MACRO MACRO_ENABLE_IRQ 
    LDA #$80
    STA MAPPER_REG_IRQ_STATUS
    .ENDM
 
;==================================================
    .MACRO MACRO_DISABLE_IRQ 
    LDA #$00
    STA MAPPER_REG_IRQ_SCANLINE_VALUE
    STA MAPPER_REG_IRQ_STATUS
    .ENDM
 
;==================================================
    .MACRO MACRO_IRQ_OPERATE  

;==================================================
IRQ_Process_0;滚动节目名
    
    LDA IRQ_Scanline_Value
    CLC
    ADC #$08
    STA MAPPER_REG_IRQ_SCANLINE_VALUE
    
    .IF 0 = TEXT_NAME_SCROLL_ENABLE
        LDA Music_Name_NT_Addr
        AND #$01
        ORA PPU_Ctrl_Buf
        STA PPU_CTRL
        LDA Music_Name_Scroll
        STA PPU_SCROLL
        STA PPU_SCROLL
    .ELSE
        LDA Music_Name_NT_Addr
        ORA PPU_Ctrl_Buf
        STA PPU_CTRL
        LDA #$00
        STA PPU_SCROLL
        STA PPU_SCROLL
    .ENDIF
    
    INC IRQ_Process_Index
    JMP Irq_ProgramEnd

;==================================================
IRQ_Process_1;静止
    LDA PPU_Ctrl_Buf
    AND #$01
    ORA PPU_Ctrl_Buf
    STA PPU_CTRL
    
    LDA #120 - 1
    STA MAPPER_REG_IRQ_SCANLINE_VALUE
    INC IRQ_Process_Index
    
    NOP
    LDA #$00
    STA PPU_SCROLL
    STA PPU_SCROLL
    
    JMP Irq_ProgramEnd

;==================================================
IRQ_Process_2;滚动曲目名
    LDA Track_Name_NT_Addr
    AND #$01
    ORA PPU_Ctrl_Buf
    STA PPU_CTRL
    
    LDA #128 - 1
    STA MAPPER_REG_IRQ_SCANLINE_VALUE
    INC IRQ_Process_Index
    
    LDA Track_Name_Scroll
    STA PPU_SCROLL
    STA PPU_SCROLL
    
    ;设置屏幕镜像($50: 水平; $44: 垂直)
    LDA #$44
    STA MAPPER_REG_NT_MAPPING
    ;结束
    ;LDA #$00
    ;STA MAPPER_REG_IRQ_STATUS
    ;STA IRQ_Process_Index
    
    JMP Irq_ProgramEnd

;==================================================
IRQ_Process_3;静止
    NOP
    NOP
    NOP
    NOP
    LDA PPU_Ctrl_Buf
    STA PPU_CTRL
    
    LDA #200 - 1
    STA MAPPER_REG_IRQ_SCANLINE_VALUE
    INC IRQ_Process_Index
    
    LDA #$00
    STA PPU_SCROLL
    STA PPU_SCROLL
    
    ;设置屏幕镜像($50: 水平; $44: 垂直)
    LDA #$50
    STA MAPPER_REG_NT_MAPPING

    JMP Irq_ProgramEnd
    
;==================================================
IRQ_Process_4;滚动底部
    LDA NT_Addr
    AND #$03
    ORA PPU_Ctrl_Buf
    STA PPU_CTRL
    
    LDA #216 - 1
    STA MAPPER_REG_IRQ_SCANLINE_VALUE
    INC IRQ_Process_Index
    
    LDA Bottom_Text_Scroll
    ;LDA #$00
    STA PPU_SCROLL
    STA PPU_SCROLL
    
    LDA Music_Play_Flag
    AND #MUSIC_FLAG_PCM_EXIST
    BEQ .End
    
    ;设置屏幕镜像($50: 水平; $44: 垂直)
    LDA #$44
    STA MAPPER_REG_NT_MAPPING

.End
    JMP Irq_ProgramEnd

;==================================================
IRQ_Process_5;滚动底部
    LDA NT_Addr
    AND #$03
    ORA PPU_Ctrl_Buf
    STA PPU_CTRL
    
    ;结束
    LDA #$00
    STA MAPPER_REG_IRQ_STATUS
    STA IRQ_Process_Index
    
    LDA #$00
    SEC
    SBC Bottom_Text_Scroll
    STA PPU_SCROLL
    STA PPU_SCROLL
    
    JMP Irq_ProgramEnd

;==================================================
IRQ_Process_Addr
    .DW IRQ_Process_0
    .DW IRQ_Process_1
    .DW IRQ_Process_2
    .DW IRQ_Process_3
    .DW IRQ_Process_4
    .DW IRQ_Process_5

;==================================================
;IRQ处理
IRQ_Process_By_Index
    LDA IRQ_Process_Index
    ASL
    TAX
    LDA IRQ_Process_Addr + 0,X
    STA IRQ_Addr_L
    LDA IRQ_Process_Addr + 1,X
    STA IRQ_Addr_H
    JMP [IRQ_Addr_L]
    
    .ENDM
