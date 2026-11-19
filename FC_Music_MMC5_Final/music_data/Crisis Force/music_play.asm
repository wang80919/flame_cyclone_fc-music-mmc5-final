    LDA $0020
    CMP #$67
    BEQ .Play_Normal
    CMP #$69
    BEQ .Play_Normal
    CMP #$73
    BCC .Play_Sound
.Play_Normal
    JMP $8163

.Play_Sound
    JSR $8163
    JSR $8163
    JSR $8163
    JMP $8163
