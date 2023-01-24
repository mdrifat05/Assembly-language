.MODEL SMALL
.STACK 100H
.DATA
MGS DB 0AH,0DH, "Input Binary Number: $" 
.CODE
MAIN PROC 
    RETURN:
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, MGS
    INT 21H
    XOR BX, BX             
    
    MOV AH, 1
    INT 21H
     
    INPUT: 
    CMP AL, 0DH 
    JE END_WHILE
    
   
    CMP AL, '0'
    JE WHILE
    CMP AL, '1'
    JE WHILE
    JNE RETURN
    
    WHILE:
    AND AL,0FH
    SHL BX,1
    OR BL,AL
    INT 21H
    JMP INPUT 
    
          
    END_WHILE: 
    MOV CX, 16
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    ;XOR BX, BX
    
    ;MOV BX, AX
    
    
    TOP: 
    ROL BX, 1
    JC ONE
    JNC ZERO 
    
    ONE:
    MOV AH, 2
    MOV DL, '1'
    INT 21H
    JMP PRINT
    
    ZERO:
    MOV AH, 2
    MOV DL, '0'
    INT 21H
    PRINT:
    JCXZ EXIT
    LOOP TOP
     
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN