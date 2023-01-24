.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    XOR BX, BX
    MOV AH, 1
    INT 21H
    
    WHILE_:
    CMP AL, 0DH
    JE END_WHILE_
   
    AND AL, 0FH
    SHL BX, 1
    OR BL, AL
    INT 21H
    
    JMP WHILE_
    
    END_WHILE_:
    MOV AH, 2
    MOV DL,0AH 
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV CX, 4
    ;MOV AH, 2
    
    TOP:
    MOV DL, BH
    SHR DL, 4
    SHL BX, 4
    
    CMP DL, 10
    JL DIGIT
    JGE CHARACTER
    
    DIGIT:
    ADD DL, 48
    INT 21H 
    JMP END
    
    CHARACTER:
    ADD DL, 55
    ;MOV AH, 2
    INT 21H
   
    END:
    LOOP TOP
    
    MAIN ENDP
END MAIN