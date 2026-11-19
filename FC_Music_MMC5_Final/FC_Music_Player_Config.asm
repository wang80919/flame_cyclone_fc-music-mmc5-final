;文件头
NES_16KB_PRG_SIZE           = 64
NES_8KB_CHR_SIZE            = 1
BANK_DATA_MASK              = NES_16KB_PRG_SIZE * 2 - 1     ;bank号掩码
RESET_BANK                  = NES_16KB_PRG_SIZE * 2 - 1
;======================================================================
PRG_DATA_BANK_C000          = NES_16KB_PRG_SIZE * 2 - 2
PRG_DATA_BANK_E000          = NES_16KB_PRG_SIZE * 2 - 1
;======================================================================
    .INESPRG NES_16KB_PRG_SIZE                              ;16KB PRG 数量
    .INESCHR NES_8KB_CHR_SIZE                                ;8KB CHR 数量
    .INESMAP MAPPER_NUMBER                                       ;mapper号
    .INESMIR 0                                     ;命名表镜像 0水平 1垂直
    ;.INESSUBMAP 0
    ;.INESPRGRAM 7
    ;.INESPRGNVRAM 0
    ;.INESCHRRAM 7
    ;.INESCHRNVRAM 0
    ;.INESBAT 1
    ;.INESTIM 0
;======================================================================
BIT_TRACK_CHANGE             = $FFF8                    ;曲目变更测试

;======================================================================
ITEM_MAX_SIZE               = 50                     ;最大节目数
ITEM_MAX_INDEX              = ITEM_MAX_SIZE - 1    ;最大节目索引
ITEM_LINE_SPACING           = 1                  ;节目文本行间距
PAGE_SIZE                   = 10                     ;每页节目数
ITEM_SELECT                 = 01                   ;初始播放节目
ITEM_CENTER_SHOW            = 0                    ;居中显示节目
TRACK_NAME_CENTER           = 1                    ;居中显示歌曲名
TRACK_START_ENABLE          = 1                    ;初始化起始曲目            
;======================================================================
ITEM_NAME_SCROLL_TIME       = 1
TRACK_NAME_SCROLL_TIME      = 1
;======================================================================
COVER_ENABLE                = 0                               ;启用封面
TEXT_NAME_SCROLL_ENABLE     = 1                         ;启用节目名滚动
MUSIC_SHOW_INFO_ENABLE      = 1                             ;显示音乐信息
MUSIC_SHOW_INFO_CENTER      = 1                       ;音乐信息居中显示
SOUND_BAR_SHOW_ENABLE       = 1                             ;显示音乐条
UPDATE_PALETTE_ENABLE       = 0                             ;更新调色板
EXTENDED_ATTRIBUTES_ENABLE  = 1                         ;启用扩展属性表
;----------------------------------------------------------------------
EXTENDED_ATTR_DATA_BANK     = $73                       ;扩展属性表bank
EXTENDED_ATTR_DATA_ADDR     = $B000                     ;扩展属性表地址
;======================================================================
AUTO_PLAY_MUTE_S_WAIT_TIME  = 01    ;自动播放静音等待时间
AUTO_PLAY_MUTE_T_WAIT_TIME  = 30    ;自动播放静音等待时间
AUTO_PLAY_M_WAIT_TIME       = 01    ;自动播放非静音等待分钟时间
AUTO_PLAY_S_WAIT_TIME       = 30    ;自动播放非静音等待秒数时间
AUTO_PLAY_TIME              = AUTO_PLAY_M_WAIT_TIME * 60 + AUTO_PLAY_S_WAIT_TIME
AUTO_PLAY_ENABLE            = 1     ;自动播放下一曲
AUTO_STOP_ITEM_ENABLE       = 0     ;自动停止当前节目(当前节目播放完毕后)
;======================================================================
ITEM_SHOW_POS               = $2083         ;节目名位置
ITEM_NAME_SCROLL_ENGTH      = 32 - ((ITEM_SHOW_POS & 0x1F) + 3)    ;节目名触发滚动长度限制
;ITEM_NAME_SCROLL_ENGTH      = 16    ;节目名触发滚动长度限制
TRACK_NAME_SCROLL_LENGTH    = 30    ;曲目名触发滚动长度限制
ITEM_NAME_SCROLL_DELAY      = 40    ;节目名滚动触发延时
ITEM_NAME_SCROLL_SPEED      = 20    ;节目名滚动速度延时
TEXT_SCROLL_DELAY_TIME      = $80    ;文本滚动延迟
SWITCH_BANK_X_ENABLE        = 1                     ;启用X切页
SWITCH_BANK_Y_ENABLE        = 1                     ;启用Y切页
;======================================================================
    .IF ITEM_MAX_SIZE % PAGE_SIZE  ;不能整除
PAGE_TOTAL_SIZE     = ITEM_MAX_SIZE/PAGE_SIZE + 1   ;页码总数
    .ELSE
PAGE_TOTAL_SIZE     = ITEM_MAX_SIZE/PAGE_SIZE       ;页码总数
    .ENDIF

PAGE_MAX_INDEX      = (PAGE_TOTAL_SIZE - 1) * PAGE_SIZE;最大页索引
;======================================================================
SOUND_BAR_APU_SQ1_ENABLE    = 1
SOUND_BAR_APU_SQ2_ENABLE    = 1
SOUND_BAR_APU_TRI_ENABLE    = 1
SOUND_BAR_APU_NOI_ENABLE    = 1
SOUND_BAR_APU_DMC_ENABLE    = 1

SOUND_BAR_MMC5_SQ1_ENABLE   = 0
SOUND_BAR_MMC5_SQ2_ENABLE   = 0

SOUND_BAR_NAMCO_CH1_ENABLE  = 1
SOUND_BAR_NAMCO_CH2_ENABLE  = 1
SOUND_BAR_NAMCO_CH3_ENABLE  = 1
SOUND_BAR_NAMCO_CH4_ENABLE  = 1

SOUND_BAR_VRC6_SQ1_ENABLE   = 1
SOUND_BAR_VRC6_SQ2_ENABLE   = 1
SOUND_BAR_VRC6_SAW_ENABLE   = 1

SOUND_BAR_5B_CH1_ENABLE     = 1
SOUND_BAR_5B_CH2_ENABLE     = 1
SOUND_BAR_5B_CH3_ENABLE     = 1

SOUND_BAR_VRC7_CH1_ENABLE   = 1
SOUND_BAR_VRC7_CH2_ENABLE   = 1
SOUND_BAR_VRC7_CH3_ENABLE   = 1
SOUND_BAR_VRC7_CH4_ENABLE   = 1
SOUND_BAR_VRC7_CH5_ENABLE   = 1
SOUND_BAR_VRC7_CH6_ENABLE   = 1

SOUND_BAR_SWAP_BEGIN        = 5         ;分2帧写入起始音量条
SOUND_BAR_SWAP_COUNT        = 3         ;分2帧时单次写入音量条数量
;======================================================================
IRQ_SCROLL_WAIT_TIME        = 5                             ;IRQ滚动等待
;======================================================================

OAM_DMA_WRITE_ENABLE        = 0                        ;启用DMA写入精灵
OAM_DMA_TEMP_ADDR           = $6200                    ;DMA精灵缓冲地址

;-------------------------------------------------
CHR_BKG_DATA_BANK           = PRG_DATA_BANK_E000
CHR_BKG_DATA_ADDR           = $A800
CHR_BKG_PPU_ADDR            = $0000
CHR_BKG_DATA_SIZE           = $08

CHR_SPRITE_DATA_BANK        = PRG_DATA_BANK_E000
CHR_SPRITE_DATA_ADDR        = $A800
CHR_SPRITE_PPU_ADDR         = $1000
CHR_SPRITE_DATA_SIZE        = $08
;======================================================================
PROGRAM_BANK                = PRG_DATA_BANK_7E
PROGRAM_ADDR                = $8000
;-------------------------------------------------
;音乐数据信息
MUSIC_NAME_BANK             =   PRG_DATA_BANK_7C
MUSIC_NAME_ADDR             =   $A000
MUSIC_INFO_BANK             =   PRG_DATA_BANK_7D
MUSIC_INFO_ADDR             =   0
MUSIC_TIME_BANK             =   PRG_DATA_BANK_7D
MUSIC_TIME_ADDR             =   0
;-------------------------------------------------
RESET_ADDR                  = $F800
;==================================================
    .IF 5 == MAPPER_NUMBER
Track_Name_Pos      = $21E6 ;曲目文本位置
Sound_Track_Pos     = $2226 ;声道文本位置
    .ELSE
Track_Name_Pos      = $2226 ;曲目文本位置
Sound_Track_Pos     = $2262 ;声道文本位置
    .ENDIF
Sound_Bar_Pos       = Sound_Track_Pos + $04 ;音乐条位置

    .IF SOUND_BAR_SHOW_ENABLE
 
Play_Index_Pos      = Sound_Bar_Pos + $09 ;当前曲目位置
Play_Time_Pos       = Play_Index_Pos + $40 ;播放时间位置
Play_State_Pos      = Play_Time_Pos + $40 ;播放状态位置

    .ELSE
 
Play_Index_Pos      = $226C ;当前曲目位置
Play_Time_Pos       = Play_Index_Pos + $40 ;播放时间位置
Play_State_Pos      = Play_Time_Pos + $40 ;播放状态位置

    .ENDIF
 
;==================================================
Scroll_X = $00
Scroll_Y = $00
;==================================================
PALETTE_UPDATE_MAX      = $2D
PALETTE_UPDATE_MIN      = $21
PALETTE_UPDATE_INTERVAL = 20
;==================================================
Use_Zero_Ram_Begin      = $60
Use_PPU_Ram_Begin       = $6100
Use_Ex_Ram_Begin        = $6000
Use_Ex_Audio_Ram_Addr   = Use_Ex_Ram_Begin + $80
 
;==================================================
Sound_Ram_Addr_0       = $0000
Sound_Ram_Addr_0_Size  = Use_Zero_Ram_Begin
Sound_Ram_Addr_2       = $0100
Sound_Ram_Addr_2_Size  = $C0
Sound_Ram_Addr_3       = $0300
Sound_Ram_Addr_4       = $0400
Sound_Ram_Addr_5       = $0500
Sound_Ram_Addr_6       = $0600
Sound_Ram_Addr_7       = $0700
Sound_Ram_Addr_8       = $0700
Sound_Ram_Addr_9       = $0700
SOUND_RAM_CLEAR_COUNT  = 02