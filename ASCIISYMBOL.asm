.MODEL SMALL
.STACK 100H
.DATA
.CODE 
MAIN PROC
    MOV DL, 0
    MOV CX, 256
    MOV AH, 2
    
    
    L:
    INT 21H
    INC DL
    DEC CX
    LOOP L
    
MAIN ENDP
END MAIN
    
