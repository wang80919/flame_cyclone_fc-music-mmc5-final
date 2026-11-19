    .MACRO MACRO_TRACK_NAME_COUNT
Label_\@
        .DB (\1 - Label_\@)/2
    .ENDM
    
;------------------------------
Contra_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW .Track_25
    .DW .Track_26
    .DW .Track_27
    .DW .Track_28
    .DW .Track_29
    .DW .Track_30
    .DW .Track_31
    .DW .Track_32
    .DW .Track_33
    .DW .Track_34
    .DW .Track_35
    .DW .Track_36
    .DW .Track_37
    .DW .Track_38
    .DW .Track_39
    .DW .Track_40
    .DW .Track_41
    .DW .Track_42
    .DW .Track_43
    .DW .Track_44
.Track_01 .USTR "Jungle & Hangar (Stage 1 & 7)"
.Track_02 .USTR "Bases 1 & 2 (Stage 2 & 4)"
.Track_03 .USTR "Waterfall (Stage 3)"
.Track_04 .USTR "Base Boss"
.Track_05 .USTR "Snowfield (Stage 5)"
.Track_06 .USTR "Energy Zone (Stage 6)"
.Track_07 .USTR "Alien's Lair (Stage 8)"
.Track_08 .USTR "Title"
.Track_09 .USTR "Demo"
.Track_10 .USTR "Victory"
.Track_11 .USTR "All Stages Clear"
.Track_12 .USTR "Game Over"
.Track_13 .USTR "Ending"
.Track_14 .USTR "BOSS OUT"
.Track_15 .USTR "HERI"
.Track_16 .USTR "FOOT"
.Track_17 .USTR "ROCK"
.Track_18 .USTR "TYPE 1"
.Track_19 .USTR "TYPE 2"
.Track_20 .USTR "NOBIRU"
.Track_21 .USTR "SHOTGUN1"
.Track_22 .USTR "SHOTGUN2"
.Track_23 .USTR "DEMO GUN"
.Track_24 .USTR "LASER"
.Track_25 .USTR "PL FIRE"
.Track_26 .USTR "SPREAD"
.Track_27 .USTR "FIRE"
.Track_28 .USTR "HIBIWARE"
.Track_29 .USTR "DAMEGE 1"
.Track_30 .USTR "DAMEGE 2"
.Track_31 .USTR "TEKI OUT"
.Track_32 .USTR "CHAKUCHI"
.Track_33 .USTR "SENSER"
.Track_34 .USTR "KANDEN"
.Track_35 .USTR "HIRAI 1"
.Track_36 .USTR "HIRAI 2"
.Track_37 .USTR "CAR"
.Track_38 .USTR "POWER UP"
.Track_39 .USTR "1UP"
.Track_40 .USTR "BAKUHA 1"
.Track_41 .USTR "BAKUHA 2"
.Track_42 .USTR "BOSS BK"
.Track_43 .USTR "PL OUT"
.Track_44 .USTR "PAUSE"

;------------------------------
Super_Contra_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW .Track_25
    .DW .Track_26
    .DW .Track_27
    .DW .Track_28
    .DW .Track_29
    .DW .Track_30
    .DW .Track_31
    .DW .Track_32
    .DW .Track_33
    .DW .Track_34
    .DW .Track_35
    .DW .Track_36
    .DW .Track_37
    .DW .Track_38
    .DW .Track_39
.Track_01 .USTR "Stage 1: Lightning and Grenades"
.Track_02 .USTR "Stage 2: Military Fortress"
.Track_03 .USTR "Stage 3: Jungle"
.Track_04 .USTR "Stage 4: Mechanic Factory & Stage 7: Xenophobic Organs"
.Track_05 .USTR "Stage 5: Perilous Cliff"
.Track_06 .USTR "Stage 6: Under the Feet"
.Track_07 .USTR "Stage 8: The Falling Wall"
.Track_08 .USTR "Boss 1"
.Track_09 .USTR "Boss 2"
.Track_10 .USTR "Boss Steel Spider"
.Track_11 .USTR "Stage Clear"
.Track_12 .USTR "Stage Clear All"
.Track_13 .USTR "Game Over"
.Track_14 .USTR "Ending: The Return of Heros' Helicopter"
.Track_15 .USTR "SUTA"
.Track_16 .USTR "THUNDER"
.Track_17 .USTR "SHOT"
.Track_18 .USTR "LASER"
.Track_19 .USTR "SPREAD"
.Track_20 .USTR "FIRE"
.Track_21 .USTR "B SHOT"
.Track_22 .USTR "T DAMEGE"
.Track_23 .USTR "HARETSU"
.Track_24 .USTR "T OUT"
.Track_25 .USTR "Z OUT"
.Track_26 .USTR "A OUT"
.Track_27 .USTR "ROLL"
.Track_28 .USTR "APPEAR"
.Track_29 .USTR "POWER"
.Track_30 .USTR "BOKK BK"
.Track_31 .USTR "BAKUHA 1"
.Track_32 .USTR "BAKUHA 2"
.Track_33 .USTR "ARUKU"
.Track_34 .USTR "JIWARE"
.Track_35 .USTR "SILEN"
.Track_36 .USTR "P 1UP"
.Track_37 .USTR "P OUT"
.Track_38 .USTR "B OUT"
.Track_39 .USTR "PAUSE"

;------------------------------
Raf_World_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
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
    .DW .Track_33
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
.Track_01 .USTR "Title"
.Track_02 .USTR "Start"
.Track_03 .USTR "Prologue"
.Track_04 .USTR "Stage 1 & 5"
.Track_05 .USTR "Stage 2"
.Track_06 .USTR "Stage 3"
.Track_07 .USTR "Stage 4"
.Track_08 .USTR "Boss Battle"
.Track_09 .USTR "Ending Theme"
.Track_10 .USTR "Fanfare 1"
.Track_11 .USTR "Fanfare 2"
.Track_12 .USTR "Fanfare 3"
.Track_33 .USTR "Stage Clear"

;------------------------------
Kage_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
.Track_01 .USTR "Opening"
.Track_02 .USTR "Stage Start"
.Track_03 .USTR "BGM 1"
.Track_04 .USTR "BGM 2"
.Track_05 .USTR "BGM 3"
.Track_06 .USTR "BGM 4"
.Track_07 .USTR "BGM 5"
.Track_08 .USTR "Boss Battle"
.Track_09 .USTR "Stage Clear"
.Track_10 .USTR "Game Over"
.Track_11 .USTR "Ending"
.Track_12 .USTR "Final Boss"
 
;------------------------------
Final_Mission_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
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
    .DW .Track_29
    .DW 0
    .DW 0
    .DW 0
    .DW .Track_33
.Track_01 .USTR "BGM 1"
.Track_02 .USTR "BGM 2"
.Track_03 .USTR "BGM 3"
.Track_04 .USTR "BGM 4"
.Track_05 .USTR "BGM 5"
.Track_06 .USTR "BGM 6"
.Track_07 .USTR "BOSS BATTLE"
.Track_08 .USTR "AIRSHIP OF BOOM"
.Track_09 .USTR "GAME OVER"
.Track_10 .USTR "STAGE CLEAR"
.Track_29 .USTR "ELEVATOR"
.Track_33 .USTR "PAUSE"

;------------------------------
Ninja_Gaiden_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW .Track_25
    .DW .Track_26
    .DW .Track_27
    .DW .Track_28
    .DW 0
    .DW .Track_30
    .DW .Track_31
.Track_01 .USTR "THE MOONLIGHT DUEL"
.Track_02 .USTR "DETERMINATION FATHER'S MESSAGE"
.Track_03 .USTR "EYECATCH"
.Track_04 .USTR "THE DRAGON NINJA"
.Track_05 .USTR "AT THE PORTAL OF DEATH"
.Track_06 .USTR "MYSTERIOUS WOMAN"
.Track_07 .USTR "THE DEMON'S INCANTATION"
.Track_08 .USTR "BRAVERY: ON THE CLUTCHES"
.Track_09 .USTR "PURSUING THE NINGHTMARE"
.Track_10 .USTR "LIKE A HOWLING GALE"
.Track_11 .USTR "REMINISCENCE"
.Track_12 .USTR "SURPRISE ATTACK"
.Track_13 .USTR "MELANCHOLY DESTINY"
.Track_14 .USTR "THE CIA"
.Track_15 .USTR "THE AMAZING RYU"
.Track_16 .USTR "THE SANCTUARY OF SHADOWS"
.Track_17 .USTR "CRISIS"
.Track_18 .USTR "THE MENACE OF JAQUIO"
.Track_19 .USTR "THE ORDEAL OF BATTLE"
.Track_20 .USTR "MALTH THE CRIMSON TERROR"
.Track_21 .USTR "THE TRUTH CONCEALED"
.Track_22 .USTR "REQUIEM"
.Track_23 .USTR "AT THE END OF THE BATTLE"
.Track_24 .USTR "IRENE: OVERTURE OF DAWN"
.Track_25 .USTR "CREDITS"
.Track_26 .USTR "GAME OVER"
.Track_27 .USTR "THE TRUTH CONCEALED(REPRISE)"
.Track_28 .USTR "CINEMA DISPLAY 2"
.Track_30 .USTR "A SUDDEN DEVELOPMENT"
.Track_31 .USTR "CINEMA DISPLAY 1"

;------------------------------
Ninja_Gaiden_2_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW .Track_25
    .DW .Track_26
    .DW .Track_27
    .DW .Track_28
    .DW .Track_29
.Track_01 .USTR "CHAOSIUM SWORD"
.Track_02 .USTR "ROBERT THE ARMY"
.Track_03 .USTR "NO END ARAKNESS"
.Track_04 .USTR "IRENE CAPTURED"
.Track_05 .USTR "TO THE RESCUE"
.Track_06 .USTR "THE DARK EMPEROR"
.Track_07 .USTR "SHADOW DIABOLICA"
.Track_08 .USTR "HIDEOUS RELICS"
.Track_09 .USTR "RYU FIGHTS BACK"
.Track_10 .USTR "TOWER LU-ARJIA"
.Track_11 .USTR "CASTLE DEMONIC"
.Track_12 .USTR "INTERLUDE 1"
.Track_13 .USTR "INTERLUDE 2"
.Track_14 .USTR "DEHUMANIZE"
.Track_15 .USTR "ITS TOO LATE..."
.Track_16 .USTR "TWIST OF FATE"
.Track_17 .USTR "THE PARASPRINTER"
.Track_18 .USTR "THUNDERSTORM"
.Track_19 .USTR "OVERDRIVE"
.Track_20 .USTR "WORLD ENSLAVED"
.Track_21 .USTR "FIRE CAVERN"
.Track_22 .USTR "UNLIMITED MOMENT"
.Track_23 .USTR "BATTLEFIELD"
.Track_24 .USTR "LORD OF NIGHT"
.Track_25 .USTR "DEFEATED"
.Track_26 .USTR "ALL GONE"
.Track_27 .USTR "GOING GETS TOUGH"
.Track_28 .USTR "IRENE AND RYU"
.Track_29 .USTR "A LONG WAY TO GO"

;------------------------------
Ninja_Gaiden_3_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW .Track_25
    .DW .Track_26
    .DW .Track_27
    .DW .Track_28
    .DW .Track_29
    .DW .Track_30
.Track_01 .USTR "SPYING"
.Track_02 .USTR "THE CHASE"
.Track_03 .USTR "PROMISES TO KEEP"
.Track_04 .USTR "TWIST OF FATE"
.Track_05 .USTR "ACT 1-1 / 5-1"
.Track_06 .USTR "ACT 2-1 / 7-2"
.Track_07 .USTR "ACT 2-2 / 5-2"
.Track_08 .USTR "ACT 3-1 / 6-2"
.Track_09 .USTR "ACT 3-2 / 6-1"
.Track_10 .USTR "ACT 4-1 / 7-1"
.Track_11 .USTR "ACT 4-2 / 7-3"
.Track_12 .USTR "FINAL BOSS"
.Track_13 .USTR "BATTLEFIELD"
.Track_14 .USTR "CLANCY'S THEME"
.Track_15 .USTR "RETURN OF FOSTER"
.Track_16 .USTR "DOPPELGANGER"
.Track_17 .USTR "NOTHING BUT TALK"
.Track_18 .USTR "BIOHAZARD PLAN"
.Track_19 .USTR "CASTLE ROCK"
.Track_20 .USTR "SURPRISE"
.Track_21 .USTR "TRUTH"
.Track_22 .USTR "INTO SUBSPACE"
.Track_23 .USTR "CLANCY TRANSMUTATED"
.Track_24 .USTR "RETURN OF IRENE"
.Track_25 .USTR "DIMENSIONAL WARSHIP"
.Track_26 .USTR "CLANCY'S REAL FORM"
.Track_27 .USTR "ENDING"
.Track_28 .USTR "CREDITS"
.Track_29 .USTR "DEATH"
.Track_30 .USTR "PAUSE"

;------------------------------
Mighty_Final_Fight_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
.Track_01 .USTR "Round 1"
.Track_02 .USTR "Round 2"
.Track_03 .USTR "Round 3"
.Track_04 .USTR "Round 4"
.Track_05 .USTR "Round 5"
.Track_06 .USTR "Boss"
.Track_07 .USTR "Final Boss"
.Track_08 .USTR "Intro"
.Track_09 .USTR "Ending"
.Track_10 .USTR "Bonus Stage"
.Track_11 .USTR "Continue"
.Track_12 .USTR "Game Over"
.Track_13 .USTR "Title"
.Track_14 .USTR "Select Player"
.Track_15 .USTR "Round Clear"
.Track_16 .USTR "Game Clear"

;------------------------------
_1943_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
.Track_01 .USTR "BGM 1"
.Track_02 .USTR "BGM 2"
.Track_03 .USTR "Sea BGM 1"
.Track_04 .USTR "Sea BGM 2"
.Track_05 .USTR "BGM 3"
.Track_06 .USTR "Mission Clear"
.Track_07 .USTR "Hangar"
.Track_08 .USTR "Mission Fail"
.Track_09 .USTR "Boss 1"
.Track_10 .USTR "Boss 2"
.Track_11 .USTR "Game Over"
.Track_12 .USTR "Danger!"
.Track_13 .USTR "Title"
.Track_14 .USTR "Ending"
.Track_15 .USTR "Boss 3"


;------------------------------
Getsufuu_Maden_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW 0
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
.Track_01 .USTR "Start"
.Track_02 .USTR "Talking"
.Track_03 .USTR "Password"
.Track_04 .USTR "Shrine"
.Track_06 .USTR "Battle"
.Track_07 .USTR "Map"
.Track_08 .USTR "Zako Enemy"
.Track_09 .USTR "Underground Labyrinth"
.Track_10 .USTR "Ation"
.Track_11 .USTR "Boss"
.Track_12 .USTR "Final Boss"
.Track_13 .USTR "Game Over"
.Track_14 .USTR "Ending"
.Track_15 .USTR "Pause"
.Track_16 .USTR "3D BGM"

;------------------------------
Jackal_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW Track_Game_Over
    .DW .Track_12
    .DW .Track_13
.Track_01 .USTR "Intro"
.Track_02 .USTR "Select"
.Track_03 .USTR "Start"
.Track_04 .USTR "BEFORE SIDE"
.Track_05 .USTR "AFTER SIDE"
.Track_06 .USTR "MIDLE SIDE"
.Track_07 .USTR "BOSS BATTLE"
.Track_08 .USTR "BOSS BATTLE"
.Track_09 .USTR "BOSS BATTLE"
.Track_10 .USTR "PCLR"
.Track_12 .USTR "Ending"
.Track_13 .USTR "Pause"

;------------------------------
Rockman_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW Track_Game_Over
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
.Track_01 .USTR "Stage Select"
.Track_02 .USTR "Stage Start"
.Track_03 .USTR "Cut Man"
.Track_04 .USTR "Guts Man"
.Track_05 .USTR "Ice Man"
.Track_06 .USTR "Bomb Man"
.Track_07 .USTR "Fire Man"
.Track_08 .USTR "Elec Man"
.Track_09 .USTR "8 Bosses"
.Track_10 .USTR "Stage Clear"
.Track_12 .USTR "Wily Stage 1-2"
.Track_13 .USTR "Wily Stage 3-4"
.Track_14 .USTR "Wily Bosses"
.Track_15 .USTR "All Clear"
.Track_16 .USTR "Staff Roll"

;------------------------------
Rockman_2_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW Track_Game_Over
    .DW Track_Game_Over
    .DW Track_Game_Over
    .DW Track_Game_Over
    .DW Track_Game_Over
    .DW Track_Game_Over
    .DW Track_Game_Over
    .DW Track_Game_Over
    .DW Track_Game_Over
.Track_01 .USTR "Flash Man"
.Track_02 .USTR "Wood Man"
.Track_03 .USTR "Clash Man"
.Track_04 .USTR "Heat Man"
.Track_05 .USTR "Air Man"
.Track_06 .USTR "Metal Man"
.Track_07 .USTR "Quick Man"
.Track_08 .USTR "Bubble Man"
.Track_09 .USTR "Wily Stage 1-2"
.Track_10 .USTR "Wily Stage 3-4"
.Track_11 .USTR "Stage Start"
.Track_12 .USTR "Boss"
.Track_13 .USTR "Stage Select"
.Track_14 .USTR "Title"
.Track_15 .USTR "Opening"
.Track_16 .USTR "Game Over"
.Track_17 .USTR "Pass Word"
.Track_18 .USTR "Wily Castle"
.Track_19 .USTR "Wily UFO"
.Track_20 .USTR "Return Home"
.Track_21 .USTR "Staff Roll"
.Track_22 .USTR "Stage Clear"
.Track_23 .USTR "All Clear"
.Track_24 .USTR "Get Weapon"


;------------------------------
Rockman_3_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
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
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW .Track_52
    .DW 0
    .DW .Track_54
    .DW .Track_55
    .DW .Track_56
    .DW .Track_57
.Track_01 .USTR "Title"
.Track_02 .USTR "Needle Man"
.Track_03 .USTR "Magnet Man"
.Track_04 .USTR "Shadow Man"
.Track_05 .USTR "Hard Man"
.Track_06 .USTR "Top Man"
.Track_07 .USTR "Snake Man"
.Track_08 .USTR "Spark Man"
.Track_09 .USTR "Shadow Man"
.Track_10 .USTR "Wily Stage 1-2"
.Track_11 .USTR "Wily Stage 3-4"
.Track_12 .USTR "Wily Stage 5-6"
.Track_13 .USTR "8 Bosses"
.Track_14 .USTR "Wily Bosses"
.Track_15 .USTR "Pass Word/Game Over"
.Track_16 .USTR "Staff Roll"
.Track_17 .USTR "Stage Select"
.Track_18 .USTR "Ending"
.Track_52 .USTR "Stage Start"
.Track_54 .USTR "Get Weapon"
.Track_55 .USTR "Wily Castle"
.Track_56 .USTR "All Clear"
.Track_57 .USTR "Stage Clear"

;------------------------------
Rockman_4_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW Track_Game_Over
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
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
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW .Track_59
    .DW .Track_60
    .DW .Track_61
    .DW 0
    .DW 0
    .DW .Track_64
    .DW 0
    .DW 0
    .DW 0
    .DW .Track_68
    .DW 0
    .DW .Track_70
    .DW .Track_71
.Track_01 .USTR "Bright Man"
.Track_02 .USTR "Toad Man"
.Track_03 .USTR "Ring Man"
.Track_04 .USTR "Drill Man"
.Track_05 .USTR "Pharaon Man"
.Track_06 .USTR "Dive Man"
.Track_07 .USTR "Skull Man"
.Track_08 .USTR "Dust Man"
.Track_09 .USTR "Cossack Stage 1-2"
.Track_10 .USTR "Wily Stage 1-2"
.Track_11 .USTR "Intro 1"
.Track_12 .USTR "Ending"
.Track_13 .USTR "Stage Clear"
.Track_14 .USTR "Pass Word"
.Track_16 .USTR "Stage Start"
.Track_17 .USTR "Stage Select"
.Track_18 .USTR "Boss"
.Track_19 .USTR "Title"
.Track_20 .USTR "Staff Roll"
.Track_21 .USTR "Get Weapon"
.Track_22 .USTR "Cossack Stage 3-4"
.Track_23 .USTR "Wily Stage 3-4"
.Track_59 .USTR "Get Item"
.Track_60 .USTR "Wily Castle"
.Track_61 .USTR "Cossack Castle"
.Track_64 .USTR "Blues"
.Track_68 .USTR "Intro 2"
.Track_70 .USTR "Wily Capsule"
.Track_71 .USTR "All Clear"

;------------------------------
Rockman_5_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW Track_Game_Over
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
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
    .DW .Track_48
    .DW .Track_49
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
    .DW .Track_74
    .DW .Track_75
    .DW 0
.Track_01 .USTR "Gravity Man"
.Track_02 .USTR "Stone Man"
.Track_03 .USTR "Wave Man"
.Track_04 .USTR "Star Man"
.Track_05 .USTR "Crystal Man"
.Track_06 .USTR "Gyro Man"
.Track_07 .USTR "Charge Man"
.Track_08 .USTR "Napalm Man"
.Track_09 .USTR "Dark Man Stage"
.Track_10 .USTR "Wily Stage"
.Track_11 .USTR "Boss"
.Track_12 .USTR "Intro"
.Track_13 .USTR "Staff Roll"
.Track_14 .USTR "Stage Select"
.Track_15 .USTR "Stage Start"
.Track_16 .USTR "Dark Man Castle"
.Track_17 .USTR "Wily Castle"
.Track_18 .USTR "Stage Clear"
.Track_20 .USTR "Pass Word"
.Track_21 .USTR "Get Weapon"
.Track_22 .USTR "All Clear"
.Track_23 .USTR "Wily Capsule"
.Track_48 .USTR "Dark Man"
.Track_49 .USTR "Blues"
.Track_74 .USTR "Title"
.Track_75 .USTR "Run"

;------------------------------
Rockman_6_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW Track_Game_Over
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW .Track_25
    .DW .Track_26
    .DW 0
    .DW .Track_28
    .DW .Track_29
    .DW .Track_30
    .DW .Track_31
    .DW .Track_32
    .DW .Track_33
    .DW .Track_34
    .DW .Track_35
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
    .DW .Track_58
.Track_01 .USTR "Wind Man"
.Track_02 .USTR "Blizzard Man"
.Track_03 .USTR "Yamato Man"
.Track_04 .USTR "Flame Man"
.Track_05 .USTR "Plant Man"
.Track_06 .USTR "Centaur Man"
.Track_07 .USTR "Tomahawk Man"
.Track_08 .USTR "Knight Man"
.Track_09 .USTR "Staff Roll Intro"
.Track_10 .USTR "Mr.X Stage"
.Track_11 .USTR "Staff Roll"
.Track_12 .USTR "Wily Stage"
.Track_13 .USTR "Boss"
.Track_14 .USTR "Intro"
.Track_15 .USTR "Capcom Logo"
.Track_16 .USTR "Stage Select"
.Track_17 .USTR "Stage Start"
.Track_18 .USTR "Mr.X Castle"
.Track_19 .USTR "Wily Castle"
.Track_20 .USTR "Stage Clear"
.Track_22 .USTR "Pass Word"
.Track_23 .USTR "Get Weapon"
.Track_24 .USTR "All Clear"
.Track_25 .USTR "Wily"
.Track_26 .USTR "Title"
.Track_28 .USTR "Blizzard"
.Track_29 .USTR "Centaur"
.Track_30 .USTR "Flame"
.Track_31 .USTR "Knight"
.Track_32 .USTR "Plant"
.Track_33 .USTR "Tomahawk"
.Track_34 .USTR "Wind"
.Track_35 .USTR "Yamato"
.Track_58 .USTR "Blues"

;------------------------------
Tournament_Fighters_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW 0
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW 0
    .DW 0
    .DW 0
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW 0
    .DW .Track_21
.Track_01 .USTR "SEWER" 
.Track_02 .USTR "DOWN TOWN"
.Track_03 .USTR "PIRATE SHIP"
.Track_04 .USTR "SEASIDE"
.Track_05 .USTR "SEWER (CRITICAL)"
.Track_06 .USTR "DOWN TOWN (CRITICAL)"
.Track_08 .USTR "SEASIDE (CRITICAL)"
.Track_09 .USTR "Player Select"
.Track_10 .USTR "CONTINUE"
.Track_11 .USTR "Opening 1-2"
.Track_12 .USTR "Bonus"
.Track_16 .USTR "Shredder"
.Track_17 .USTR "DEFEATED"
.Track_18 .USTR "Opening 1"
.Track_19 .USTR "VS"
.Track_21 .USTR "Opening 2"

;------------------------------
Crisis_Force_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW 0
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
.Track_01 .USTR "Title 1"
.Track_03 .USTR "Title 2"
.Track_04 .USTR "Start"
.Track_05 .USTR "Stage 1"
.Track_06 .USTR "Stage 2"
.Track_07 .USTR "Stage 3"
.Track_08 .USTR "Stage 4"
.Track_09 .USTR "Stage 5"
.Track_10 .USTR "Stage 6"
.Track_11 .USTR "Stage 7"
.Track_12 .USTR "Boss 1"
.Track_13 .USTR "Boss 2"
.Track_14 .USTR "Stage Clearing"
.Track_15 .USTR "Ending"
.Track_16 .USTR "Game Over"

;------------------------------
Salamander_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
.Track_01 .USTR "Title"
.Track_02 .USTR "Start"
.Track_03 .USTR "Life Force"
.Track_04 .USTR "Meteorolite"
.Track_05 .USTR "Blazing Phoenix and Dragon"
.Track_06 .USTR "Organic Life Forms"
.Track_07 .USTR "Road to Mystery"
.Track_08 .USTR "Pyramic"
.Track_09 .USTR "Stars and Light"
.Track_10 .USTR "Gradius Boss"
.Track_11 .USTR "Boss"
.Track_12 .USTR "Game Over"
.Track_13 .USTR "Blinking Stars"
.Track_14 .USTR "Pause"

;------------------------------
Rush_n_Attack_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
.Track_01 .USTR "The Drop"
.Track_02 .USTR "Stage 1, 3 & 5"
.Track_03 .USTR "Stage 1, 3 & 5 (Hidden)"
.Track_04 .USTR "Stage 2 & 4"
.Track_05 .USTR "Stage 2 & 4 (Hidden)"
.Track_06 .USTR "Stage 6"
.Track_07 .USTR "Stage 6 (Hidden)"
.Track_08 .USTR "Weapon of Choice"
.Track_09 .USTR "Invincibility"
.Track_10 .USTR "Boss 1"
.Track_11 .USTR "Boss 2"
.Track_12 .USTR "Last Boss 1"
.Track_13 .USTR "Last Boss 2"
.Track_14 .USTR "Intermission 1"
.Track_15 .USTR "Intermission 2"
.Track_16 .USTR "Intermission 3"
.Track_17 .USTR "Intermission 4"
.Track_18 .USTR "Intermission 5"
.Track_19 .USTR "Death"
.Track_20 .USTR "Game Over"
.Track_21 .USTR "Ending"
.Track_22 .USTR "Warning"

;------------------------------
Dragon_Fighter_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
.Track_01 .USTR "Title"
.Track_02 .USTR "The Frozen Battle"
.Track_03 .USTR "Don't Disturb"
.Track_04 .USTR "In to the Depth"
.Track_05 .USTR "Can you Chain Up"
.Track_06 .USTR "Initive of a Ghost"
.Track_07 .USTR "The Dragon Fighter"
.Track_08 .USTR "Boss"
.Track_09 .USTR "Last Boss"
.Track_10 .USTR "Stage Clear"
.Track_11 .USTR "Game Over"
.Track_12 .USTR "Continue"
.Track_13 .USTR "Ending"
.Track_14 .USTR "Staff Appears"

;------------------------------
Gun_Nac_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW 0
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW 0
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW 0
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
.Track_01 .USTR "Intro"
.Track_02 .USTR "Area 1"
.Track_04 .USTR "Area 7"
.Track_05 .USTR "Area 3"
.Track_06 .USTR "Area 4"
.Track_07 .USTR "Area 5"
.Track_08 .USTR "Area 6"
.Track_09 .USTR "Area 2"
.Track_10 .USTR "Area 8"
.Track_11 .USTR "Boss Theme 2"
.Track_12 .USTR "Boss Theme 1"
.Track_13 .USTR "Final Boss"
.Track_15 .USTR "Boss Defeated"
.Track_16 .USTR "Area Clear"
.Track_17 .USTR "Game Over"
.Track_19 .USTR "Ending"
.Track_20 .USTR "Shop"
.Track_21 .USTR "Extra Life"

;------------------------------
Jetman_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
.Track_01 .USTR "Title"
.Track_02 .USTR "Area A"
.Track_03 .USTR "Area B"
.Track_04 .USTR "Area C"
.Track_05 .USTR "Area D"
.Track_06 .USTR "Area E"
.Track_07 .USTR "Last Area"
.Track_08 .USTR "Transformation"
.Track_09 .USTR "Boss"
.Track_10 .USTR "Final Boss"
.Track_11 .USTR "Area Clear"
.Track_12 .USTR "Ending"
.Track_13 .USTR "Game Over"
.Track_14 .USTR "Stage Select"
.Track_15 .USTR "Boss Intro"
.Track_16 .USTR "Win"
.Track_17 .USTR "Lose"
.Track_18 .USTR "Intro to Last Area"

;------------------------------
Double_Dragon_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
.Track_01 .USTR "Title"
.Track_02 .USTR "Mission"
.Track_03 .USTR "Mission 1"
.Track_04 .USTR "Mission 2"
.Track_05 .USTR "Mission 3"
.Track_06 .USTR "Mission 4"
.Track_07 .USTR "Mission 5"
.Track_08 .USTR "Mission 6"
.Track_09 .USTR "Game Over"
.Track_10 .USTR "Victory!"
.Track_11 .USTR "Marion's been Saved!"

;------------------------------
Recca_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
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
    .DW .Track_40
.Track_01 .USTR "Opening"
.Track_02 .USTR "Recca (Title, Area 7)"
.Track_03 .USTR "Jetter (Stage 1, Area 5)"
.Track_04 .USTR "M.O.M"
.Track_05 .USTR "Hyde (Stage 2-6)"
.Track_06 .USTR "Hiener"
.Track_07 .USTR "EML-39 (Stage 3, 4)"
.Track_08 .USTR "Gelgog"
.Track_09 .USTR "Tera (Area 2)"
.Track_10 .USTR "Deepspace (Area 4)"
.Track_11 .USTR "Crisis (Boss)"
.Track_12 .USTR "Bostune (Final Boss)"
.Track_13 .USTR "Death-Troy (Ending)"
.Track_14 .USTR "Game Over"
.Track_15 .USTR "D.A.D (Area 1)"
.Track_16 .USTR "Lovin' You"
.Track_17 .USTR "Dreamin' You"
.Track_40 .USTR "Throbbin' You"

    .BANK (MUSIC_NAME_BANK + 1) & BANK_DATA_MASK
    .ORG MUSIC_NAME_ADDR

;------------------------------
BattleToads_And_DD_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
.Track_01 .USTR "Opening"
.Track_02 .USTR "Title"
.Track_03 .USTR "Select Chracter"
.Track_04 .USTR "Boss 1,3,5-7"
.Track_05 .USTR "Tail of the Ratship (Level 1)"
.Track_06 .USTR "Ratship Rumble (Level 4)"
.Track_07 .USTR "Ropes'N Roper (Level 3)"
.Track_08 .USTR "Blag Alley (Level 2)"
.Track_09 .USTR "Victory"
.Track_10 .USTR "Missile Mayhem (Level 5)"
.Track_11 .USTR ""
.Track_12 .USTR ""
.Track_13 .USTR "Intermission"
.Track_14 .USTR ""
.Track_15 .USTR "Shadow Boss ShowDown (Level 6)"
.Track_16 .USTR "Speeder Bike (Level 2-3)"

;------------------------------
Double_Dragon_2_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW 0
    .DW .Track_20
.Track_01 .USTR "Title"
.Track_02 .USTR "Mission 2"
.Track_03 .USTR "Mission 1"
.Track_04 .USTR "Mission 5"
.Track_05 .USTR "Mission 8"
.Track_06 .USTR "Mission 7"
.Track_07 .USTR "Mission 6"
.Track_08 .USTR "A Tough Fight"
.Track_09 .USTR "The Steam Tank Rolls In"
.Track_10 .USTR "Level Completed"
.Track_11 .USTR "The Ending"
.Track_12 .USTR "Mission 9"
.Track_13 .USTR "Shadow Fight"
.Track_14 .USTR "Onto the Next Area..."
.Track_15 .USTR "Mission 3"
.Track_16 .USTR "Mission 4"
.Track_17 .USTR "The Fight Continues"
.Track_18 .USTR "Game Over"
.Track_20 .USTR "Staff"

;------------------------------
Double_Dragon_3_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
.Track_01 .USTR "Title"
.Track_02 .USTR "U.S.A: Street"
.Track_03 .USTR "U.S.A: Factory"
.Track_04 .USTR "U.S.A: Boss"
.Track_05 .USTR "Japan"
.Track_06 .USTR "Japan: Ubiquitous Danger"
.Track_07 .USTR "China: Great Wall"
.Track_08 .USTR "China: Chin (Kungfu Master)"
.Track_09 .USTR "Roman: Coliseum"
.Track_10 .USTR "Roman: Big Boss"
.Track_11 .USTR "Egypt: Mystical Great Pyramic"
.Track_12 .USTR "Egypt"
.Track_13 .USTR "Egypt: Three Diamonds Chamber"
.Track_14 .USTR "Egypt: Cursed Magic"
.Track_15 .USTR "Japan: Ranzou (Ninja)"
.Track_16 .USTR "Egypt: Mummy Room"
.Track_17 .USTR "U.S.A: The Last Words"
.Track_18 .USTR "World Journey"
.Track_19 .USTR "Ending"
.Track_20 .USTR "Stage Clear"

;------------------------------
Castlevania_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
.Track_01 .USTR "Introduction"
.Track_02 .USTR "Vampire Killer"
.Track_03 .USTR "Stalker"
.Track_04 .USTR "Wicked Child"
.Track_05 .USTR "Out of Time"
.Track_06 .USTR "Heart of Fire"
.Track_07 .USTR "Walking Edge"
.Track_08 .USTR "Nightmare"
.Track_09 .USTR "Poison Mind"
.Track_10 .USTR "Black Night"
.Track_11 .USTR "Voyager"
.Track_12 .USTR "Victory"
.Track_13 .USTR "Game Complete"
.Track_14 .USTR "Death"
.Track_15 .USTR "Game Over"

;------------------------------
Castlevania_2_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
.Track_01 .USTR "Message of Darkness"
.Track_02 .USTR "The Silence of The Daylight"
.Track_03 .USTR "Bloody Tears"
.Track_04 .USTR "Monster Dance"
.Track_05 .USTR "Dwelling of Doom"
.Track_06 .USTR "Within These Castle Walls"
.Track_07 .USTR "Game Over"
.Track_08 .USTR "Last Boss"
.Track_09 .USTR "A Requiem"

;------------------------------
Castlevania_3_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW .Track_25
    .DW .Track_26
    .DW .Track_27
    .DW .Track_28
    .DW .Track_29
.Track_01 .USTR "Beginning"
.Track_02 .USTR "Clockwork"
.Track_03 .USTR "Mad Forest"
.Track_04 .USTR "Anxiety"
.Track_05 .USTR "Rising"
.Track_06 .USTR "Stream"
.Track_07 .USTR "Dead Beat"
.Track_08 .USTR "Nightmare"
.Track_09 .USTR "Aquarius"
.Track_10 .USTR "Demon Seed"
.Track_11 .USTR "Dejavu"
.Track_12 .USTR "Riddle"
.Track_13 .USTR "Pressure"
.Track_14 .USTR "Overture"
.Track_15 .USTR "Boss Fight"
.Track_16 .USTR "Stage Clear"
.Track_17 .USTR "Big Battle 1"
.Track_18 .USTR "Big Battle 2"
.Track_19 .USTR "All Clear"
.Track_20 .USTR "Destiny"
.Track_21 .USTR "Encounter"
.Track_22 .USTR "Prelude"
.Track_23 .USTR "Prayer"
.Track_24 .USTR "Epitaph"
.Track_25 .USTR "Evergreen"
.Track_26 .USTR "Flash Back"
.Track_27 .USTR "Game Over"
.Track_28 .USTR "Death"
.Track_29 .USTR "Pause"

;------------------------------
Akumajou_Special_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
.Track_01 .USTR "Go Go at the Castle"
.Track_02 .USTR "Hop and Step Above the Clouds"
.Track_03 .USTR "Roller Coaster Ride"
.Track_04 .USTR ""
.Track_05 .USTR "Water Cha Cha"
.Track_06 .USTR "Everything Falls Down, Ouch..."
.Track_07 .USTR "Calling Tiffany"
.Track_08 .USTR "Sucharaka Pyramid"
.Track_09 .USTR "Oh No! Watch Out!"
.Track_10 .USTR ""
.Track_11 .USTR "Robot Battle"
.Track_12 .USTR ""
.Track_13 .USTR "Pre-Battle Speech ~ Boss"
.Track_14 .USTR "Boss Defeated"
.Track_15 .USTR "Good Morning, Draccy"
.Track_16 .USTR "Minigame Selection"
.Track_17 .USTR "Minigame"
.Track_18 .USTR "Game Over"
.Track_19 .USTR "Subway Ride"
.Track_20 .USTR "King Tut"
.Track_21 .USTR "Bye Bye, Draccy"
.Track_22 .USTR "Good Morning, Draccy"

;------------------------------
Bomberman_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
.Track_01 .USTR "Title"
.Track_02 .USTR "Start"
.Track_03 .USTR "Main Theme"
.Track_04 .USTR "Find The Door"
.Track_05 .USTR "Invincibility"
.Track_06 .USTR "Bonus"
.Track_07 .USTR "Ending"
.Track_08 .USTR "Just Died"
.Track_09 .USTR "Game Over"
.Track_10 .USTR "Level Complete"
    
;------------------------------
Bomberman_2_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
.Track_01 .USTR "Beginning"
.Track_02 .USTR "Bombing"
.Track_03 .USTR "Title Scrolling"
.Track_04 .USTR "Title Theme"
.Track_05 .USTR "Select Game Mode"
.Track_06 .USTR "Become a prisoner"
.Track_07 .USTR "Start"
.Track_08 .USTR "Main Theme 1"
.Track_09 .USTR "Bonus Stage"
.Track_10 .USTR "Round Complete"
.Track_11 .USTR "Main Theme 2"
.Track_12 .USTR "Main Theme 3"
.Track_13 .USTR "Ending"
.Track_14 .USTR "Credits"
.Track_15 .USTR "Credits"
.Track_16 .USTR "Game Over"
.Track_17 .USTR "Player Wins a Round"
.Track_18 .USTR "Draw"
.Track_19 .USTR "Battle Won"

;------------------------------
Mitsume_ga_Tooru_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
.Track_01 .USTR "Stage 1-1(2-1)"
.Track_02 .USTR "Stage 1-2(5-1)"
.Track_03 .USTR "Stage 2-2(4-2)"
.Track_04 .USTR "Stage 3-1(4-1)"
.Track_05 .USTR "Stage 3-2"
.Track_06 .USTR "Stage 5-2"
.Track_07 .USTR "Stage 5-3"
.Track_08 .USTR "Boss"
.Track_09 .USTR "Introduction"
.Track_10 .USTR "Ending (Epilogue)"
.Track_11 .USTR "Ending (Credits)"
.Track_12 .USTR "Shop"
.Track_13 .USTR "Victory"
.Track_14 .USTR "Game Over"

;------------------------------
Tokkyuu_Shirei_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
.Track_01 .USTR "Area A"
.Track_02 .USTR "Area D"
.Track_03 .USTR "Area B"
.Track_04 .USTR "Final Area"
.Track_05 .USTR "Area C"
.Track_06 .USTR "Areas E & F"
.Track_07 .USTR "Boss Theme"
.Track_08 .USTR "Area Cleared"
.Track_09 .USTR "Game Over"
.Track_10 .USTR "Introduction"
.Track_11 .USTR "Stage Select"
.Track_12 .USTR "Highscore"
.Track_13 .USTR "Ending, Credits"

;------------------------------
Chip_And_Dale_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW 0
    .DW .Track_22
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
    .DW .Track_36
.Track_01 .USTR "Zone 0"
.Track_02 .USTR "Zone B"
.Track_03 .USTR "Zone D"
.Track_04 .USTR "Zone F, H & I"
.Track_05 .USTR "Zone J"
.Track_06 .USTR "Zone A, C & E"
.Track_07 .USTR "Zone G"
.Track_08 .USTR "Title"
.Track_09 .USTR "Ending"
.Track_10 .USTR "Map"
.Track_11 .USTR "Boss"
.Track_12 .USTR "Game Over"
.Track_13 .USTR "Bonus Round"
.Track_14 .USTR "Invincible"
.Track_22 .USTR "Death"
.Track_36 .USTR "Stage Clear"

;------------------------------
Chip_And_Dale_2_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW .Track_25
    .DW .Track_26
    .DW .Track_27
    .DW .Track_28
    .DW .Track_29
    .DW .Track_30
    .DW .Track_31
    .DW .Track_32
.Track_01 .USTR "Title"
.Track_02 .USTR "Opening: News Story"
.Track_03 .USTR "Stage 1: Restaurant"
.Track_04 .USTR "Stage 2: Sewer"
.Track_05 .USTR "Stage 3: Harbor"
.Track_06 .USTR "Stage 6a: Clock Tower"
.Track_07 .USTR "Stage 5: Warehouse"
.Track_08 .USTR "Stage 6b: Western World"
.Track_09 .USTR "Stage 6c: Future World"
.Track_10 .USTR "Stage 7 Intro: Fatcat's Office"
.Track_11 .USTR "Stage 4: Freezer"
.Track_12 .USTR "Stage 7: The Secret Passage"
.Track_13 .USTR "Boss Intro"
.Track_14 .USTR "Stages 5 & 6 Boss"
.Track_15 .USTR ""
.Track_16 .USTR "Bonus Stage"
.Track_17 .USTR "Stage 5 Ending: Sealing the Urn"
.Track_18 .USTR "Boss Confrontation"
.Track_19 .USTR "Stage 1 Ending part 2: Whew!"
.Track_20 .USTR "Stage 5 Intro: The Haunted Warehouse"
.Track_21 .USTR "Stage 6 Intro: Fatcat's Amusement Park"
.Track_22 .USTR "Stage 3 Ending: Trapped by Fatcat!"
.Track_23 .USTR "Stage 1 Ending part 1: Defusing the Bomb"
.Track_24 .USTR "Stage 7 Ending: Pursuing Fatcat"
.Track_25 .USTR "Ending: Escape"
.Track_26 .USTR "The End"
.Track_27 .USTR "Stage Clear"
.Track_28 .USTR "Basketball Minigame"
.Track_29 .USTR "Game Over"
.Track_30 .USTR "Boss"
.Track_31 .USTR "Stage 7 Boss (Fatcat Robot)"
.Track_32 .USTR "Stage Clear: Extra Life"

;------------------------------
Adventure_Island_2_Track_Index
    MACRO_TRACK_NAME_COUNT .Track_01
    .DW .Track_01
    .DW .Track_02
    .DW .Track_03
    .DW .Track_04
    .DW .Track_05
    .DW .Track_06
    .DW .Track_07
    .DW .Track_08
    .DW .Track_09
    .DW .Track_10
    .DW .Track_11
    .DW .Track_12
    .DW .Track_13
    .DW .Track_14
    .DW .Track_15
    .DW .Track_16
    .DW .Track_17
    .DW .Track_18
    .DW .Track_19
    .DW .Track_20
    .DW .Track_21
    .DW .Track_22
    .DW .Track_23
    .DW .Track_24
    .DW .Track_25
    .DW .Track_26
.Track_01 .USTR "Title"
.Track_02 .USTR "Overworld"
.Track_03 .USTR "Wild Plains"
.Track_04 .USTR "Cliffs & Rocks Iceland"
.Track_05 .USTR "Underwater"
.Track_06 .USTR "Ice Caverns 2"
.Track_07 .USTR "Ominous Dungeon"
.Track_08 .USTR "Take to the Clouds!"
.Track_09 .USTR "Scorching Desert"
.Track_10 .USTR "Pteradactyl (Island Skip)"
.Track_11 .USTR "Invincibility & Bonus Stage"
.Track_12 .USTR "Leechin' You"
.Track_13 .USTR "Egg Chosen"
.Track_14 .USTR "Boss Battle"
.Track_15 .USTR "Choose an Egg"
.Track_16 .USTR "You Died"
.Track_17 .USTR "Game Over"
.Track_18 .USTR "Ending part 2"
.Track_19 .USTR "Round Clear"
.Track_20 .USTR "Boss Defeated"
.Track_21 .USTR "Ice Caverns 1"
.Track_22 .USTR ""
.Track_23 .USTR "Ancient Temple"
.Track_24 .USTR "Twilight Woods"
.Track_25 .USTR "Eruptive Volcano (Final Area)"
.Track_26 .USTR "Ending part 1"
