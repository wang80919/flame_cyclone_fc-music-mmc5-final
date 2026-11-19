	TAX
	LDA .Data,X
    PHA
    JSR $8139
    PLA
    STA $20
	JMP $8001
.Data
    .HEX 73 ;开头
    .HEX 67 ;手指头放大招
    .HEX 69 ;爆炸 & 开头2
    .HEX 71 ;Start
    .HEX 7B 8B 83 87 7F 8F 93 ;关卡
    .HEX 97 9B ;BOSS1 BOSS2
    .HEX A3 ;Title 2
    .HEX AB ;Ending
    .HEX A7 ;Game Over
    .HEX 02 03 04 07 09 0B 0D 11 13 15 17 19 1B 1D 1F 21
    .HEX 23 25 27 29 2B 2D 2F 31 33 35 37 39 3B 3D 3F 41
    .HEX 43 45 47 49 4B 4D 51 53 55 57 59 5B 5D 5F 61 64
    .HEX 65 6B 70
    .HEX 72 ;暂停
    .HEX 77 ;Title 1
    