;==================================================
Music_Collection_Order;专辑顺序
    .DB 01 ;Contra                                                  魂斗罗
    .DB 02 ;Super Contra                                            超级魂斗罗
    .DB 03 ;Raf World                                               RAF世界
    .DB 04 ;Kage                                                    赤影战士
    .DB 05 ;Final Mission                                           最终任务
    .DB 06 ;Ninja Gaiden                                            忍者龙剑传
    .DB 07 ;Ninja Gaiden 2 - The Dark Sword of Chaos                忍者龙剑传2: 暗黑的邪神剑
    .DB 08 ;Ninja Gaiden 3 - The Ancient Ship of Doom               忍者龙剑传3: 黄泉的方舟
    .DB 35 ;Bomberman                                               轰炸人 
    .DB 36 ;Bomberman 2                                             轰炸人2
    .DB 13 ;Rockman                                                 洛克人
    .DB 14 ;Rockman 2 - Dr. Wily no Nazo                            洛克人2: 威利博士之谜
    .DB 15 ;Rockman 3 - Dr. Wily no Saigo!                          洛克人3: 威利博士的末日!?
    .DB 16 ;Rockman 4 - Aratanaru Yabou!!                           洛克人4: 新的野心!!
    .DB 17 ;Rockman 5 - Blues no Wana!                              洛克人5: 布鲁斯的陷阱!?
    .DB 18 ;Rockman 6 - Shijou Saidai no Tatakai!!                  洛克人6: 史上最大的战斗!!
    .DB 31 ;Castlevania                                             恶魔城
    .DB 32 ;Castlevania 2 - Simon's Quest                           恶魔城2: 西蒙的冒险
    .DB 33 ;Castlevania 3 - Dracula's Curse                         恶魔城3: 德拉库拉的诅咒
    .DB 34 ;Akumajou Special - Boku Dracula Kun                     恶魔城外传: 德拉克拉君
    .DB 24 ;Double Dragon                                           双截龙
    .DB 25 ;Double Dragon 2 - The Revenge                           双截龙2: 复仇
    .DB 26 ;Double Dragon 3 - The Rosetta Stone                     双截龙3: 罗塞塔之石
    .DB 41 ;Battletoads                                             忍者蛙   
    .DB 29 ;Battletoads & Double Dragon - The Ultimate Team         忍者蛙与双截龙: 终极团队
    .DB 37 ;Destiny of an Emperor                                   吞食天地
    .DB 38 ;Destiny of an Emperor 2                                 吞食天地2
    .DB 43 ;Chip 'n Dale Rescue Rangers                             松鼠大作战
    .DB 44 ;Chip 'n Dale Rescue Rangers 2                           松鼠大作战2
    .DB 19 ;Teenage Mutant Ninja Turtles - Tournament Fighters      忍者神龟: 激龟快打
    .DB 46 ;Island                                                  冒险岛
    .DB 47 ;Island 2                                                冒险岛2
    .DB 48 ;Island 3                                                冒险岛3
    .DB 49 ;Island 4                                                冒险岛4
    .DB 12 ;Jackal                                                  赤色要塞
    .DB 22 ;Rush'n Attack                                           绿色兵团
    .DB 21 ;Salamander                                              沙罗曼蛇
    .DB 09 ;Mighty Final Fight                                      快打旋风
    .DB 11 ;Getsufuu Maden                                          月风魔传
    .DB 10 ;1943 - The Battle of Midway                             1943: 中途岛海战
    .DB 27 ;Gun-Nac                                                 加纳战机
    .DB 28 ;Summer Carnival '92 - Recca                             夏日嘉年华92: 烈火
    .DB 20 ;Crisis Force                                            帝国战机
    .DB 23 ;Dragon Fighter                                          龙战士
    .DB 30 ;Choujin Sentai - Jetman                                 鸟人战队: 喷射人
    .DB 42 ;Gun.Smoke                                               荒野大镖客
    .DB 45 ;Mitsume ga Tooru                                        三目童子
    .DB 39 ;Tokkyuu Shirei                                          特救指令
    .DB 40 ;Metal Max                                               重装机兵
    .DB 50 ;Battle City                                             坦克大战
;==================================================
;音乐配置
    .MACRO  MACRO_MUSIC_CONFIG
        .DB BANK(\1)  ;8000
        
        .IF 6 = \?2
            .DB BANK( \2 )  ;A000
        .ELSE
            .DB BANK( \1 ) + \2  ;A000
        .ENDIF
        
        .IF 6 = \?3
            .DB BANK( \3 )  ;C000
        .ELSE
            .DB BANK( \1 ) + \3  ;C000
        .ENDIF
        
        .DB RESET_BANK
        .DW \4  ;init
        .DW \5  ;play
        .DB \6  ;start
        .DB \7  ;total
        .DW \8  ;name
        
        .IF 6 = \?9
            .DB (\9 - $C000)/$40
        .ELSE
            .DB 0
        .ENDIF
    .ENDM

;--------------------------------------------------
;Contra
Music_Profile_01 MACRO_MUSIC_CONFIG Contra_8000, 1, 1, $BFF0, $80D5, 001,044, Music_Collection_Name_01, 00
;--------------------------------------------------
;Super Contra
Music_Profile_02 MACRO_MUSIC_CONFIG Super_Contra_8000, 1, Super_Contra_C000, $DFF0, $813C, 001,039, Music_Collection_Name_02, $00
;--------------------------------------------------
;RAF World
Music_Profile_03 MACRO_MUSIC_CONFIG Raf_World_8000, 1, Raf_World_C000, $BFC8, $8000, 001,038, Music_Collection_Name_03, Raf_World_C000
;--------------------------------------------------
;Kage
Music_Profile_04 MACRO_MUSIC_CONFIG Kage_8000, 1, Kage_C000, $9FC0, $A000, 001,049, Music_Collection_Name_04, Kage_C000
;--------------------------------------------------
;Final Mission
Music_Profile_05 MACRO_MUSIC_CONFIG Final_Mission_8000, 1, Final_Mission_C000, Final_Mission_Init, $8001, 001,033, Music_Collection_Name_05, Final_Mission_C000
;--------------------------------------------------
;Ninja Gaiden
Music_Profile_06 MACRO_MUSIC_CONFIG Ninja_Gaiden_8000, 1, Ninja_Gaiden_C000, Ninja_Gaiden_Init, $8000, 015,062, Music_Collection_Name_06, Ninja_Gaiden_C000
;--------------------------------------------------
;Ninja Gaiden 2
Music_Profile_07 MACRO_MUSIC_CONFIG Ninja_Gaiden_2_8000, 1, 1, $BF00, $BFD0, 022,078, Music_Collection_Name_07, $00
;--------------------------------------------------
;Ninja Gaiden 3
Music_Profile_08 MACRO_MUSIC_CONFIG Ninja_Gaiden_3_8000, 1, Ninja_Gaiden_3_C000, $9F60, $8000, 010,087, Music_Collection_Name_08, Ninja_Gaiden_3_C000
;--------------------------------------------------
;Mighty Final Fight
Music_Profile_09 MACRO_MUSIC_CONFIG Mighty_Final_Fight_8000, 1, 0, $8003, $8000, 001,054, Music_Collection_Name_09, 0
;--------------------------------------------------
;1943
Music_Profile_10 MACRO_MUSIC_CONFIG _1943_8000, 1, 0, $8003, $8000, 001,045, Music_Collection_Name_10, 0
;--------------------------------------------------
;Getsufuu_Maden
Music_Profile_11 MACRO_MUSIC_CONFIG Getsufuu_Maden_8000, 1, 0, $BFE0, $815F, 007,067, Music_Collection_Name_11, 0
;--------------------------------------------------
;Jackal
Music_Profile_12 MACRO_MUSIC_CONFIG Jackal_8000, 1, 1, $B4F0, $8008, 001,037, Music_Collection_Name_12, 0
;--------------------------------------------------
;Rockman
Music_Profile_13 MACRO_MUSIC_CONFIG Rockman_9000, 1, 0, $9003, $9000, 001,050, Music_Collection_Name_13, 0
;--------------------------------------------------
;Rockman 2
Music_Profile_14 MACRO_MUSIC_CONFIG Rockman_2_8000, 1, 0, $8003, $8000, 014,067, Music_Collection_Name_14, 0
;--------------------------------------------------
;Rockman 3
Music_Profile_15 MACRO_MUSIC_CONFIG Rockman_3_8000, 1, 0, $8003, $8000, 001,057, Music_Collection_Name_15, 0
;--------------------------------------------------
;Rockman 4
Music_Profile_16 MACRO_MUSIC_CONFIG Rockman_4_8000, 1, 0, $8003, $8000, 019,071, Music_Collection_Name_16, 0
;--------------------------------------------------
;Rockman 5
Music_Profile_17 MACRO_MUSIC_CONFIG Rockman_5_8000, 1, 0, $8003, $8000, 074,076, Music_Collection_Name_17, 0
;--------------------------------------------------
;Rockman 6
Music_Profile_18 MACRO_MUSIC_CONFIG Rockman_6_8000, 1, 0, $8003, $8000, 026,102, Music_Collection_Name_18, 0
;--------------------------------------------------
;Tournament Fighters
Music_Profile_19 MACRO_MUSIC_CONFIG Tournament_Fighters_8000, 1, Tournament_Fighters_C000, Tournament_Fighters_Init, $8001, 004,088, Music_Collection_Name_19, Tournament_Fighters_C000
;--------------------------------------------------
;Crisis Force
Music_Profile_20 MACRO_MUSIC_CONFIG Crisis_Force_8000, 1, Crisis_Force_C000, Crisis_Force_Init, Crisis_Force_Play, 001,068, Music_Collection_Name_20, Crisis_Force_C000
;--------------------------------------------------
;Salamander
Music_Profile_21 MACRO_MUSIC_CONFIG Salamander_8000, 1, 0, $BFF0, $8000, 003,034, Music_Collection_Name_21, 0
;--------------------------------------------------
;Rush'n Attack
Music_Profile_22 MACRO_MUSIC_CONFIG Rush_n_Attack_8000, 1, 0, $BF00, $82A1, 002,063, Music_Collection_Name_22, 0
;--------------------------------------------------
;Dragon Fighter
Music_Profile_23 MACRO_MUSIC_CONFIG Dragon_Fighter_8000, 1, 0, Dragon_Fighter_Init, $8010, 001,050, Music_Collection_Name_23, 0
;--------------------------------------------------
;Double Dragon
Music_Profile_24 MACRO_MUSIC_CONFIG Double_Dragon_8000, 1, 0, $BFE0, $8003, 001,043, Music_Collection_Name_24, 0
;--------------------------------------------------
;Double Dragon 2
Music_Profile_25 MACRO_MUSIC_CONFIG Double_Dragon_2_8000, 1, 0, $8003, $8196, 001,083, Music_Collection_Name_25, 0
;--------------------------------------------------
;Double Dragon 3
Music_Profile_26 MACRO_MUSIC_CONFIG Double_Dragon_3_8000, 1, 0, $BFE0, $8003, 001,077, Music_Collection_Name_26, 0
;--------------------------------------------------
;Gun-Nac
Music_Profile_27 MACRO_MUSIC_CONFIG Gun_Nac_8000, 1, 2, $9FF0, $8009, 001,062, Music_Collection_Name_27, 0
;--------------------------------------------------
;Summer Carnival '92
Music_Profile_28 MACRO_MUSIC_CONFIG Summer_Carnival_8000, 1, Summer_Carnival_C000, $D2C0, $CB25, 002,040, Music_Collection_Name_28, 0
;--------------------------------------------------
;Battletoads Double Dragon
Music_Profile_29 MACRO_MUSIC_CONFIG Battletoads_And_DD_8000, 1, 2, Battletoads_And_DD_Init, Battletoads_And_DD_Play, 002,034, Music_Collection_Name_29, 0
;Music_Profile_29 MACRO_MUSIC_CONFIG Battletoads_And_DD_8000, 1, Battletoads_And_DD_C000, $8000, $D050, 002,034, Music_Collection_Name_29, 0
;--------------------------------------------------
;Choujin Sentai - Jetman
Music_Profile_30 MACRO_MUSIC_CONFIG Jetman_8000, 1, 0, $BF00, $BF20, 001,018, Music_Collection_Name_30, 0
;--------------------------------------------------
;Castlevania
Music_Profile_31 MACRO_MUSIC_CONFIG Castlevania_8000, 1, 0, $BFF0, $838A, 001,041, Music_Collection_Name_31, 0
;--------------------------------------------------
;Castlevania 2
Music_Profile_32 MACRO_MUSIC_CONFIG Castlevania_2_8000, 1, 1, $BFF0, $967D, 001,040, Music_Collection_Name_32, 0
;--------------------------------------------------
;Castlevania 3
Music_Profile_33 MACRO_MUSIC_CONFIG Castlevania_3_8000, 1, Castlevania_3_C000, $E000, $E24E, 001,093, Music_Collection_Name_33, 0
;--------------------------------------------------
;Akumajou Special
Music_Profile_34 MACRO_MUSIC_CONFIG Akumajou_Special_8000, 1, Akumajou_Special_C000, $CFC0, $8034, 001,112, Music_Collection_Name_34, 0
;--------------------------------------------------
;Bomberman
Music_Profile_35 MACRO_MUSIC_CONFIG Bomberman_8000, 0, 0, $8FC0, $8FF0, 001,016, Music_Collection_Name_35, 0
;--------------------------------------------------
;Bomberman 2
Music_Profile_36 MACRO_MUSIC_CONFIG Bomberman_2_8000, 1, 4, $DFF0, $80A7, 001,027, Music_Collection_Name_36, 0
;--------------------------------------------------
;Destiny of an Emperor
Music_Profile_37 MACRO_MUSIC_CONFIG Destiny_of_an_Emperor_8000, 1, 0, $BF00, $8000, 001,051, Music_Collection_Name_37, 0
;--------------------------------------------------
;Destiny of an Emperor 2
Music_Profile_38 MACRO_MUSIC_CONFIG Destiny_of_an_Emperor_2_8000, 1, 0, $8003, $8000, 001,062, Music_Collection_Name_38, 0
;--------------------------------------------------
;Tokkyuu Shirei
Music_Profile_39 MACRO_MUSIC_CONFIG Tokkyuu_Shirei_8000, 1, 0, $BF00, $8000, 001,075, Music_Collection_Name_39, 0
;--------------------------------------------------
;Metal Max
Music_Profile_40 MACRO_MUSIC_CONFIG Metal_Max_8000, Metal_Max_A000, Metal_Max_C000, $BFF0, $BFE0, 001,096, Music_Collection_Name_40, Metal_Max_C000
;--------------------------------------------------
;Battletoads
Music_Profile_41 MACRO_MUSIC_CONFIG Battletoads_8000, 1, 2, Battletoads_Init, Battletoads_Play, 001,032, Music_Collection_Name_41, 0
;Gun.Smoke
Music_Profile_42 MACRO_MUSIC_CONFIG Gun_Smoke_8000, 1, 0, $8003, $8000, 001,043, Music_Collection_Name_42, 0
;Chip 'n Dale Rescue Rangers
Music_Profile_43 MACRO_MUSIC_CONFIG Chip_n_Dale_8000, 1, 0, $8003, $8000, 001,42, Music_Collection_Name_43, 0
;Chip 'n Dale Rescue Rangers 2
Music_Profile_44 MACRO_MUSIC_CONFIG Chip_n_Dale_2_8000, 1, 0, $BFE0, $8000, 001,116, Music_Collection_Name_44, 0
;Mitsume ga Tooru
Music_Profile_45 MACRO_MUSIC_CONFIG Mitsume_ga_Tooru_8000, 1, 0, $B730, $8000, 001,053, Music_Collection_Name_45, 0
;Adventure Island
Music_Profile_46 MACRO_MUSIC_CONFIG Island_1_C000, 0, Island_1_C000, Island_Init, Island_Play, 001,033, Music_Collection_Name_46, 0
;Adventure Island 2
Music_Profile_47 MACRO_MUSIC_CONFIG Island_2_8000, 1, 0, Island_2_Init, Island_2_Play, 001,050, Music_Collection_Name_47, 0
;Adventure Island 3
Music_Profile_48 MACRO_MUSIC_CONFIG Island_3_8000, 1, 0, Island_3_Init, Island_3_Play, 001,051, Music_Collection_Name_48, 0
;Adventure Island 4
Music_Profile_49 MACRO_MUSIC_CONFIG Island_4_8000, 1, 0, Island_4_Init, Island_4_Play, 001,076, Music_Collection_Name_49, 0
;Adventure Island 4
Music_Profile_50 MACRO_MUSIC_CONFIG Bomberman_8000, 1, 0, Battle_City_Music_Init, Battle_City_Music_Play, 001,021, Music_Collection_Name_50, 0
;==================================================
Music_Profile;音乐配置
    .DW Music_Profile_01
    .DW Music_Profile_02
    .DW Music_Profile_03
    .DW Music_Profile_04
    .DW Music_Profile_05
    .DW Music_Profile_06
    .DW Music_Profile_07
    .DW Music_Profile_08
    .DW Music_Profile_09
    .DW Music_Profile_10
    .DW Music_Profile_11
    .DW Music_Profile_12
    .DW Music_Profile_13
    .DW Music_Profile_14
    .DW Music_Profile_15
    .DW Music_Profile_16
    .DW Music_Profile_17
    .DW Music_Profile_18
    .DW Music_Profile_19
    .DW Music_Profile_20
    .DW Music_Profile_21
    .DW Music_Profile_22
    .DW Music_Profile_23
    .DW Music_Profile_24
    .DW Music_Profile_25
    .DW Music_Profile_26
    .DW Music_Profile_27
    .DW Music_Profile_28
    .DW Music_Profile_29
    .DW Music_Profile_30
    .DW Music_Profile_31
    .DW Music_Profile_32
    .DW Music_Profile_33
    .DW Music_Profile_34
    .DW Music_Profile_35
    .DW Music_Profile_36
    .DW Music_Profile_37
    .DW Music_Profile_38
    .DW Music_Profile_39
    .DW Music_Profile_40
    .DW Music_Profile_41
    .DW Music_Profile_42
    .DW Music_Profile_43
    .DW Music_Profile_44
    .DW Music_Profile_45
    .DW Music_Profile_46
    .DW Music_Profile_47
    .DW Music_Profile_48
    .DW Music_Profile_49
    .DW Music_Profile_50
    
;==================================================
Music_Loop_Profile
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW Battletoads_And_DD_Loop
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW Battletoads_Loop
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    
;==================================================
Track_Name_Addr_Port            ;曲目名地址间接索引
    .DW Contra_Track_Index
    .DW Super_Contra_Track_Index
    .DW Raf_World_Track_Index
    .DW Kage_Track_Index
    .DW Final_Mission_Track_Index
    .DW Ninja_Gaiden_Track_Index
    .DW Ninja_Gaiden_2_Track_Index
    .DW Ninja_Gaiden_3_Track_Index
    .DW Mighty_Final_Fight_Index
    .DW _1943_Track_Index
    .DW Getsufuu_Maden_Index
    .DW Jackal_Track_Index
    .DW Rockman_Track_Index
    .DW Rockman_2_Track_Index
    .DW Rockman_3_Track_Index
    .DW Rockman_4_Track_Index
    .DW Rockman_5_Track_Index
    .DW Rockman_6_Track_Index
    .DW Tournament_Fighters_Track_Index
    .DW Crisis_Force_Index
    .DW Salamander_Track_Index
    .DW Rush_n_Attack_Track_Index
    .DW Dragon_Fighter_Track_Index
    .DW Double_Dragon_Track_Index
    .DW Double_Dragon_2_Track_Index
    .DW Double_Dragon_3_Track_Index
    .DW Gun_Nac_Track_Index
    .DW Recca_Track_Index
    .DW BattleToads_And_DD_Track_Index
    .DW Jetman_Track_Index
    .DW Castlevania_Track_Index
    .DW Castlevania_2_Track_Index
    .DW Castlevania_3_Track_Index
    .DW Akumajou_Special_Track_Index
    .DW Bomberman_Track_Index
    .DW Bomberman_2_Track_Index
    .DW 0
    .DW 0
    .DW Tokkyuu_Shirei_Track_Index
    .DW 0
    .DW 0
    .DW 0
    .DW Chip_And_Dale_Track_Index
    .DW Chip_And_Dale_2_Track_Index
    .DW Mitsume_ga_Tooru_Track_Index
    .DW 0
    .DW Adventure_Island_2_Track_Index
    .DW 0
    .DW 0
    .DW 0
 
    .IF MUSIC_NAME_BANK
;==================================================
;音乐专辑曲目名所在Bank
Music_Name_Bank_Index
    .DB BANK(Contra_Track_Index)
    .DB BANK(Super_Contra_Track_Index)
    .DB BANK(Raf_World_Track_Index)
    .DB BANK(Kage_Track_Index)
    .DB BANK(Final_Mission_Track_Index)
    .DB BANK(Ninja_Gaiden_Track_Index)
    .DB BANK(Ninja_Gaiden_2_Track_Index)
    .DB BANK(Ninja_Gaiden_3_Track_Index)
    .DB BANK(Mighty_Final_Fight_Index)
    .DB BANK(_1943_Track_Index)
    .DB BANK(Getsufuu_Maden_Index)
    .DB BANK(Jackal_Track_Index)
    .DB BANK(Rockman_Track_Index)
    .DB BANK(Rockman_2_Track_Index)
    .DB BANK(Rockman_3_Track_Index)
    .DB BANK(Rockman_4_Track_Index)
    .DB BANK(Rockman_5_Track_Index)
    .DB BANK(Rockman_6_Track_Index)
    .DB BANK(Tournament_Fighters_Track_Index)
    .DB BANK(Crisis_Force_Index)
    .DB BANK(Salamander_Track_Index)
    .DB BANK(Rush_n_Attack_Track_Index)
    .DB BANK(Dragon_Fighter_Track_Index)
    .DB BANK(Double_Dragon_Track_Index)
    .DB BANK(Double_Dragon_2_Track_Index)
    .DB BANK(Double_Dragon_3_Track_Index)
    .DB BANK(Gun_Nac_Track_Index)
    .DB BANK(Recca_Track_Index)
    .DB BANK(BattleToads_And_DD_Track_Index)
    .DB BANK(Jetman_Track_Index)
    .DB BANK(Castlevania_Track_Index)
    .DB BANK(Castlevania_2_Track_Index)
    .DB BANK(Castlevania_3_Track_Index)
    .DB BANK(Akumajou_Special_Track_Index)
    .DB BANK(Bomberman_Track_Index)
    .DB BANK(Bomberman_2_Track_Index)
    .DB 0
    .DB 0
    .DB BANK(Tokkyuu_Shirei_Track_Index)
    .DB 0
    .DB 0
    .DB 0
    .DB BANK(Chip_And_Dale_Track_Index)
    .DB BANK(Chip_And_Dale_2_Track_Index)
    .DB BANK(Mitsume_ga_Tooru_Track_Index)
    .DB 0
    .DB BANK(Adventure_Island_2_Track_Index)
    .DB 0
    .DB 0
    .DB 0
    .ENDIF

Track_Unknown .USTR "Unknown"
Track_Effect .USTR "Sound Effect"
Track_Game_Over .USTR "Game Over"
