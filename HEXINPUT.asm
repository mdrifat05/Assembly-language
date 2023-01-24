.MODEL SMALL
.STACK 100H
.DATA
MSG1 DW "PLEASE ENTER A HEX NUMBER: $"


MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H    
    
    XOR BX, BX
    MOV CL, 4
    
    MOV AH, 1
    INT 21H
    
    WHILE:
    CMP AL, 0DH
    JE END_WHILE
    CMP AL, 39H
    JG LETTER
    AND AL, 0FH
    JMP SHIFT
    
    LETTER:
    SUB AL, 37H
    
    SHIFT:
    SHL BX, CL
    OR BL, AL
    INT 21H
    JMP WHILE
    
    END_WHILE:
    
    MOV AH,2
    MOV DX, 0AH
    INT 21H
    MOV DX, 0DH
    INT 21H
    
    XOR CX, CX
    MOV CX, 4
    MOV AH, 2
    
    FOR:
    MOV DL, BH
    SHR DL, 4
    SHL BX, 4
    
    CMP DL, 10
    JGE LETTER2
    
    ADD DL, 48
    INT 21H
    
    JMP END_FOR:
    
    LETTER2:
    ADD DL, 55
    INT 21H
    
    END_FOR:
    LOOP FOR
 
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN