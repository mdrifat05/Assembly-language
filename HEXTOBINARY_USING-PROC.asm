.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    XOR BX, BX
    MOV CL, 4
    MOV AH, 1
    INT 21H
    
    WHILE_:
    CMP AL, 0DH
    JE END_WHILE_ 
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
    JMP WHILE_
    
    END_WHILE_:
    MOV AH, 2
    MOV DL,0AH 
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV CX, 16
    
    TOP:
    ROL BX, 1
    JC ONE
    JNC ZERO
    
    ONE: 
    MOV AH, 2
    MOV DL, '1'
    INT 21H
    JMP END
    
    ZERO: 
    MOV AH, 2
    MOV DL, '0'
    INT 21H
    
    END:
    LOOP TOP 