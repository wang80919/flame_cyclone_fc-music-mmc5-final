    .MACRO MUSIC_INCBIN_BANK
Bank_\@ .RS 0                           ;分配当前Bank号索引
        .BANK Bank_\@ & BANK_DATA_MASK  ;指定当前Bank号
        .IF \1
            .ORG \1                     ;指定数据地址
        .ENDIF
\2
		.INCBIN \3                      ;插入数据
        .RS \4                          ;bank号增加
    .ENDM
    
    .MACRO MUSIC_INCBIN_DATA
        .IF \1
            .ORG \1                     ;指定数据地址
        .ENDIF
\2
		.INCBIN \3                      ;插入数据
    .ENDM
    
    .RSSET $00  ;重置Bank号计数

	.IF SOUND_BAR_SHOW_ENABLE
    ;                  地址     标签名                      数据路径                                            8KB数据大小
    MUSIC_INCBIN_BANK   0,      Jetman_8000,                "music_data/Jetman/8000_BFFF_bar.bin",              4;32KB
    MUSIC_INCBIN_BANK   0,      Super_Contra_8000,          "music_data/Super Contra/8000_BFFF_bar.bin",        3;24KB
    MUSIC_INCBIN_BANK   0,      Ninja_Gaiden_2_8000,        "music_data/Ninja Gaiden 2/8000_BFFF_bar.bin",      3;24KB
    MUSIC_INCBIN_BANK   0,      Ninja_Gaiden_3_8000,        "music_data/Ninja Gaiden 3/8000_BFFF_bar.bin",      3;24KB
    MUSIC_INCBIN_BANK   0,      Rockman_4_8000,             "music_data/Rockman 4/8000_BFFF_bar.bin",           3;24KB
    MUSIC_INCBIN_BANK   0,      Rockman_5_8000,             "music_data/Rockman 5/8000_BFFF_bar.bin",           3;24KB
    MUSIC_INCBIN_BANK   0,      Rockman_6_8000,             "music_data/Rockman 6/8000_BFFF_bar.bin",           3;24KB
    MUSIC_INCBIN_BANK   0,      Contra_8000,                "music_data/Contra/8000_BFFF_bar.bin",              2;16KB
    MUSIC_INCBIN_BANK   0,      Raf_World_8000,             "music_data/Raf World/8000_BFFF_Bar.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Kage_8000,                  "music_data/Kage/8000_BFFF_Bar.bin",                2;16KB
    MUSIC_INCBIN_BANK   0,      Final_Mission_8000,         "music_data/Final Mission/8000_BFFF_bar.bin",       2;16KB
    MUSIC_INCBIN_BANK   0,      Ninja_Gaiden_8000,          "music_data/Ninja Gaiden/8000_BFFF_bar.bin",        2;16KB
    MUSIC_INCBIN_BANK   0,      Mighty_Final_Fight_8000,    "music_data/Mighty Final Fight/8000_BFFF_bar.bin",  2;16KB
    MUSIC_INCBIN_BANK   0,      Getsufuu_Maden_8000,        "music_data/Getsufuu Maden/8000_BFFF_bar.bin",      2;16KB
    MUSIC_INCBIN_BANK   0,      Rockman_2_8000,             "music_data/Rockman 2/8000_BFFF_bar.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Crisis_Force_8000,          "music_data/Crisis Force/8000_BFFF_bar.bin",        2;16KB
    MUSIC_INCBIN_BANK   0,      Salamander_8000,            "music_data/Salamander/8000_BFFF_bar.bin",          2;16KB
    MUSIC_INCBIN_BANK   0,      Rush_n_Attack_8000,         "music_data/Rush'n Attack/8000_BFFF_bar.bin",       2;16KB
    MUSIC_INCBIN_BANK   0,      Tournament_Fighters_8000,   "music_data/Tournament Fighters/8000_BFFF_bar.bin", 2;16KB
    MUSIC_INCBIN_BANK   0,      Dragon_Fighter_8000,        "music_data/Dragon Fighter/8000_BFFF_bar.bin",      2;16KB
    MUSIC_INCBIN_BANK   0,      Chip_n_Dale_8000,           "music_data/Chip 'n Dale Rescue Rangers/8000_BFFF_bar.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Chip_n_Dale_2_8000,         "music_data/Chip 'n Dale Rescue Rangers 2/8000_BFFF_bar.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Gun_Nac_8000,               "music_data/Gun-Nac/8000_BFFF_bar.bin",             3;24KB
    MUSIC_INCBIN_BANK   0,      Super_Contra_C000,          "music_data/Super Contra/C000.bin",                 1;8KB
    MUSIC_INCBIN_BANK   $C000,  Ninja_Gaiden_3_C000,        "music_data/Ninja Gaiden 3/C000.bin",               2;4KB
    MUSIC_INCBIN_DATA   $9000,  Rockman_9000,               "music_data/Rockman/9000_BFFF_bar.bin",             ;12KB
    MUSIC_INCBIN_BANK   0,      Destiny_of_an_Emperor_8000,  "music_data/Destiny of an Emperor/8000_BFFF_bar.bin",      2;16KB
    MUSIC_INCBIN_BANK   0,      Destiny_of_an_Emperor_2_8000,"music_data/Destiny of an Emperor 2/8000_BFFF_bar.bin",    3;24KB
    MUSIC_INCBIN_BANK   0,      Tokkyuu_Shirei_8000,        "music_data/Tokkyuu Shirei/8000_BFFF_bar.bin",      2;16KB
    MUSIC_INCBIN_BANK   0,      Mitsume_ga_Tooru_8000,      "music_data/Mitsume ga Tooru/8000_BFFF_bar.bin",    2;16KB
    
    MUSIC_INCBIN_BANK   0,      Island_1_C000,              "music_data/Adventure Island/Island_1_C000_DFFF_bar.bin",    1;8KB
    MUSIC_INCBIN_BANK   0,      Island_2_8000,              "music_data/Adventure Island/Island_2_8000_BFFF_bar.bin",    2;16KB
    MUSIC_INCBIN_BANK   0,      Island_3_8000,              "music_data/Adventure Island/Island_3_8000_BFFF_bar.bin",    2;16KB
    MUSIC_INCBIN_BANK   0,      Island_4_8000,              "music_data/Adventure Island/Island_4_8000_BFFF_bar.bin",    2;16KB
    
    MUSIC_INCBIN_BANK   0,      Metal_Max_8000,             "music_data/Metal Max/8000_9FFF.bin",               3;24KB
    MUSIC_INCBIN_BANK   0,      Metal_Max_A000,             "music_data/Metal Max/A000_BFFF_bar.bin",           1;8KB
    
    MUSIC_INCBIN_BANK   0,      Castlevania_8000,           "music_data/Castlevania/8000_BFFF_bar.bin",         2;16KB
    MUSIC_INCBIN_BANK   0,      Castlevania_2_8000,         "music_data/Castlevania 2/8000_BFFF_bar.bin",       2;16KB
    MUSIC_INCBIN_BANK   0,      Battletoads_8000,           "music_data/Battletoads/8000_DFFF_bar.bin",         3;24KB
    
    MUSIC_INCBIN_BANK   0,      Castlevania_3_8000,         "music_data/Castlevania 3/8000_BFFF_bar.bin",       6;48KB
    MUSIC_INCBIN_BANK   0,      Castlevania_3_C000,         "music_data/Castlevania 3/C000.bin",                1;8KB
    
    MUSIC_INCBIN_BANK   0,      Akumajou_Special_8000,      "music_data/Akumajou Special/8000_BFFF_bar.bin",    2;16KB
    MUSIC_INCBIN_BANK   0,      Double_Dragon_8000,         "music_data/Double Dragon/8000_BFFF.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Double_Dragon_2_8000,       "music_data/Double Dragon 2/8000_BFFF.bin",         2;16KB
    MUSIC_INCBIN_BANK   0,      Double_Dragon_3_8000,       "music_data/Double Dragon 3/8000_BFFF.bin",         2;16KB
    MUSIC_INCBIN_BANK   0,      Summer_Carnival_8000,       "music_data/Summer Carnival '92/8000_BFFF.bin",     2;16KB
    MUSIC_INCBIN_BANK   0,      Battletoads_And_DD_8000,    "music_data/Battletoads & Double Dragon/8000_DFFF_bar.bin",    3;24KB
    
    ;MUSIC_INCBIN_BANK   0,      Battletoads_And_DD_8000,    "music_data/Battletoads & Double Dragon/8000_BFFF_bar.bin",    2;16KB
    ;剩余3840字节
    ;MUSIC_INCBIN_BANK   0,      Battletoads_And_DD_C000,    "music_data/Battletoads & Double Dragon/C000.bin",  1;4.25KB
    
    
    MUSIC_INCBIN_BANK   0,      Rockman_3_8000,             "music_data/Rockman 3/8000_BFFF_bar.bin",           3;20KB
    MUSIC_INCBIN_DATA   $D000,  Metal_Max_C000,             "music_data/Metal Max/C000.bin",                    1;4KB
    
    MUSIC_INCBIN_BANK   0,      Jackal_8000,                "music_data/Jackal/8000_BFFF_bar.bin",              2;14KB
    MUSIC_INCBIN_DATA   $D800,  Ninja_Gaiden_C000,          "music_data/Ninja Gaiden/C000.bin"                  ;1.0KB
    MUSIC_INCBIN_DATA   0,      Final_Mission_C000,         "music_data/Final Mission/C000.bin"                 ;1.0KB
    
    MUSIC_INCBIN_BANK   0,      Bomberman_2_8000,           "music_data/Bomberman 2/8000_DFFF_bar.bin",         5;40KB
    
    ;剩余4096字节
    MUSIC_INCBIN_BANK   0,      Gun_Smoke_8000,             "music_data/Gun.Smoke/8000_AFFF_bar.bin",           2;12KB
    
    ;剩余1024字节
    MUSIC_INCBIN_BANK   0,      _1943_8000,                 "music_data/1943/8000_BFFF_bar.bin",                2;10KB
    MUSIC_INCBIN_DATA   $C000 + (2 * $400),  Raf_World_C000,"music_data/Raf World/C000.bin",                    1;5KB
    
    ;剩余4096字节
    MUSIC_INCBIN_BANK   0,      Bomberman_8000,             "music_data/Bomberman/8000_8FFF_bar.bin",           1;4KB
    .ORG $9000
    .INCLUDE "music_data/Battle City/Battle City (J) [!]_Music.asm"
    
    ;剩余3328字节
    MUSIC_INCBIN_BANK   0,      Summer_Carnival_C000,       "music_data/Summer Carnival '92/C000_bar.bin",      1;4.75KB
    
    ;剩余2048字节
    MUSIC_INCBIN_BANK   $C000,  Tournament_Fighters_C000,   "music_data/Tournament Fighters/C000.bin",          1;4.0KB, 放在C000, 程序会读取C00-CFFF
    
    ;剩余3072字节
    MUSIC_INCBIN_BANK   $C000,  Crisis_Force_C000,          "music_data/Crisis Force/C000.bin",                 1;1.5KB, 放在C000, 程序会读取C00-CFFF
    MUSIC_INCBIN_DATA   $0000,  Kage_C000,                  "music_data/Kage/C000.bin"                          ;3.5KB
    
    MUSIC_INCBIN_BANK   0,      Akumajou_Special_C000,      "music_data/Akumajou Special/C000.bin",             1;4KB, 放在C000, 程序会读取C00-CFFF
    
	.ELSE
    ;                  地址     标签名                      数据路径                                            8KB数据大小
    MUSIC_INCBIN_BANK   0,      Jetman_8000,                "music_data/Jetman/8000_BFFF.bin",              4;32KB
    MUSIC_INCBIN_BANK   0,      Super_Contra_8000,          "music_data/Super Contra/8000_BFFF.bin",        3;24KB
    MUSIC_INCBIN_BANK   0,      Ninja_Gaiden_2_8000,        "music_data/Ninja Gaiden 2/8000_BFFF.bin",      3;24KB
    MUSIC_INCBIN_BANK   0,      Ninja_Gaiden_3_8000,        "music_data/Ninja Gaiden 3/8000_BFFF.bin",      3;24KB
    MUSIC_INCBIN_BANK   0,      Rockman_4_8000,             "music_data/Rockman 4/8000_BFFF.bin",           3;24KB
    MUSIC_INCBIN_BANK   0,      Rockman_5_8000,             "music_data/Rockman 5/8000_BFFF.bin",           3;24KB
    MUSIC_INCBIN_BANK   0,      Rockman_6_8000,             "music_data/Rockman 6/8000_BFFF.bin",           3;24KB
    MUSIC_INCBIN_BANK   0,      Contra_8000,                "music_data/Contra/8000_BFFF.bin",              2;16KB
    MUSIC_INCBIN_BANK   0,      Raf_World_8000,             "music_data/Raf World/8000_BFFF.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Kage_8000,                  "music_data/Kage/8000_BFFF.bin",                2;16KB
    MUSIC_INCBIN_BANK   0,      Final_Mission_8000,         "music_data/Final Mission/8000_BFFF.bin",       2;16KB
    MUSIC_INCBIN_BANK   0,      Ninja_Gaiden_8000,          "music_data/Ninja Gaiden/8000_BFFF.bin",        2;16KB
    MUSIC_INCBIN_BANK   0,      Mighty_Final_Fight_8000,    "music_data/Mighty Final Fight/8000_BFFF.bin",  2;16KB
    MUSIC_INCBIN_BANK   0,      Getsufuu_Maden_8000,        "music_data/Getsufuu Maden/8000_BFFF.bin",      2;16KB
    MUSIC_INCBIN_BANK   0,      Rockman_2_8000,             "music_data/Rockman 2/8000_BFFF.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Crisis_Force_8000,          "music_data/Crisis Force/8000_BFFF.bin",        2;16KB
    MUSIC_INCBIN_BANK   0,      Salamander_8000,            "music_data/Salamander/8000_BFFF.bin",          2;16KB
    MUSIC_INCBIN_BANK   0,      Rush_n_Attack_8000,         "music_data/Rush'n Attack/8000_BFFF.bin",       2;16KB
    MUSIC_INCBIN_BANK   0,      Tournament_Fighters_8000,   "music_data/Tournament Fighters/8000_BFFF.bin", 2;16KB
    MUSIC_INCBIN_BANK   0,      Dragon_Fighter_8000,        "music_data/Dragon Fighter/8000_BFFF.bin",      2;16KB
    MUSIC_INCBIN_BANK   0,      Chip_n_Dale_8000,           "music_data/Chip 'n Dale Rescue Rangers/8000_BFFF.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Chip_n_Dale_2_8000,         "music_data/Chip 'n Dale Rescue Rangers 2/8000_BFFF.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Gun_Nac_8000,               "music_data/Gun-Nac/8000_BFFF.bin",             3;24KB
    MUSIC_INCBIN_BANK   0,      Super_Contra_C000,          "music_data/Super Contra/C000.bin",                 1;8KB
    MUSIC_INCBIN_BANK   $C000,  Ninja_Gaiden_3_C000,        "music_data/Ninja Gaiden 3/C000.bin",               2;4KB
    MUSIC_INCBIN_DATA   $9000,  Rockman_9000,               "music_data/Rockman/9000_BFFF.bin",             ;12KB
    MUSIC_INCBIN_BANK   0,      Destiny_of_an_Emperor_8000,  "music_data/Destiny of an Emperor/8000_BFFF.bin",      2;16KB
    MUSIC_INCBIN_BANK   0,      Destiny_of_an_Emperor_2_8000,"music_data/Destiny of an Emperor 2/8000_BFFF.bin",    3;24KB
    MUSIC_INCBIN_BANK   0,      Tokkyuu_Shirei_8000,        "music_data/Tokkyuu Shirei/8000_BFFF.bin",      2;16KB
    MUSIC_INCBIN_BANK   0,      Mitsume_ga_Tooru_8000,      "music_data/Mitsume ga Tooru/8000_BFFF.bin",    2;16KB
    
    MUSIC_INCBIN_BANK   0,      Island_1_C000,              "music_data/Adventure Island/Island_1_C000_DFFF.bin",    1;8KB
    MUSIC_INCBIN_BANK   0,      Island_2_8000,              "music_data/Adventure Island/Island_2_8000_BFFF.bin",    2;16KB
    MUSIC_INCBIN_BANK   0,      Island_3_8000,              "music_data/Adventure Island/Island_3_8000_BFFF.bin",    2;16KB
    MUSIC_INCBIN_BANK   0,      Island_4_8000,              "music_data/Adventure Island/Island_4_8000_BFFF.bin",    2;16KB
    
    MUSIC_INCBIN_BANK   0,      Metal_Max_8000,             "music_data/Metal Max/8000_9FFF.bin",               3;24KB
    MUSIC_INCBIN_BANK   0,      Metal_Max_A000,             "music_data/Metal Max/A000_BFFF.bin",           1;8KB
    
    MUSIC_INCBIN_BANK   0,      Castlevania_8000,           "music_data/Castlevania/8000_BFFF.bin",         2;16KB
    MUSIC_INCBIN_BANK   0,      Castlevania_2_8000,         "music_data/Castlevania 2/8000_BFFF.bin",       2;16KB
    MUSIC_INCBIN_BANK   0,      Battletoads_8000,           "music_data/Battletoads/8000_BFFF.bin",         2;16KB
    MUSIC_INCBIN_BANK   0,      Battletoads_C000,           "music_data/Battletoads/C000_DFFF.bin",             1;8KB
    
    MUSIC_INCBIN_BANK   0,      Castlevania_3_8000,         "music_data/Castlevania 3/8000_BFFF.bin",       6;48KB
    MUSIC_INCBIN_BANK   0,      Castlevania_3_C000,         "music_data/Castlevania 3/C000.bin",                1;8KB
    
    MUSIC_INCBIN_BANK   0,      Akumajou_Special_8000,      "music_data/Akumajou Special/8000_BFFF.bin",    2;16KB
    MUSIC_INCBIN_BANK   0,      Double_Dragon_8000,         "music_data/Double Dragon/8000_BFFF.bin",           2;16KB
    MUSIC_INCBIN_BANK   0,      Double_Dragon_2_8000,       "music_data/Double Dragon 2/8000_BFFF.bin",         2;16KB
    MUSIC_INCBIN_BANK   0,      Double_Dragon_3_8000,       "music_data/Double Dragon 3/8000_BFFF.bin",         2;16KB
    MUSIC_INCBIN_BANK   0,      Summer_Carnival_8000,       "music_data/Summer Carnival '92/8000_BFFF.bin",     2;16KB
    ;MUSIC_INCBIN_BANK   0,      Battletoads_And_DD_8000,    "music_data/Battletoads & Double Dragon/8000_DFFF.bin",    3;24KB
    MUSIC_INCBIN_BANK   0,      Battletoads_And_DD_8000,    "music_data/Battletoads & Double Dragon/8000_BFFF.bin",    2;16KB
    
    MUSIC_INCBIN_BANK   0,      Rockman_3_8000,             "music_data/Rockman 3/8000_BFFF.bin",           3;20KB
    MUSIC_INCBIN_DATA   $D000,  Metal_Max_C000,             "music_data/Metal Max/C000.bin",                    1;4KB
    
    MUSIC_INCBIN_BANK   0,      Jackal_8000,                "music_data/Jackal/8000_BFFF.bin",              2;14KB
    MUSIC_INCBIN_DATA   $D800,  Ninja_Gaiden_C000,          "music_data/Ninja Gaiden/C000.bin"                  ;1.0KB
    MUSIC_INCBIN_DATA   0,      Final_Mission_C000,         "music_data/Final Mission/C000.bin"                 ;1.0KB
    
    MUSIC_INCBIN_BANK   0,      Bomberman_2_8000,           "music_data/Bomberman 2/8000_DFFF.bin",         5;40KB
    
    ;剩余4096字节
    MUSIC_INCBIN_BANK   0,      Gun_Smoke_8000,             "music_data/Gun.Smoke/8000_AFFF.bin",           2;12KB
    
    ;剩余1024字节
    MUSIC_INCBIN_BANK   0,      _1943_8000,                 "music_data/1943/8000_BFFF.bin",                2;10KB
    MUSIC_INCBIN_DATA   $C000 + (2 * $400),  Raf_World_C000,"music_data/Raf World/C000.bin",                    1;5KB
    
    ;剩余4096字节
    MUSIC_INCBIN_BANK   0,      Bomberman_8000,             "music_data/Bomberman/8000_8FFF.bin",           1;4KB
    .ORG $9000
    .INCLUDE "music_data/Battle City/Battle City (J) [!]_Music.asm"
    
    ;剩余3840字节
    MUSIC_INCBIN_BANK   0,      Battletoads_And_DD_C000,    "music_data/Battletoads & Double Dragon/C000.bin",  1;4.25KB
    
    ;剩余3328字节
    MUSIC_INCBIN_BANK   0,      Summer_Carnival_C000,       "music_data/Summer Carnival '92/C000.bin",      1;4.75KB
    
    ;剩余2048字节
    MUSIC_INCBIN_BANK   $C000,  Tournament_Fighters_C000,   "music_data/Tournament Fighters/C000.bin",          1;4.0KB, 放在C000, 程序会读取C00-CFFF
    
    ;剩余3072字节
    MUSIC_INCBIN_BANK   $C000,  Crisis_Force_C000,          "music_data/Crisis Force/C000.bin",                 1;1.5KB, 放在C000, 程序会读取C00-CFFF
    MUSIC_INCBIN_DATA   $0000,  Kage_C000,                  "music_data/Kage/C000.bin"                          ;3.5KB
    
    MUSIC_INCBIN_BANK   0,      Akumajou_Special_C000,      "music_data/Akumajou Special/C000.bin",             1;4KB, 放在C000, 程序会读取C00-CFFF
    
	.ENDIF

    .BANK PRG_DATA_BANK_E000 & BANK_DATA_MASK
    .INCBIN "music_data/Castlevania 3/E000.bin"
    
;==================================================
	