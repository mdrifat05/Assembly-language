.MODEL SMALL
.STACK 100H
.DATA
CHAR DB 'ENTER UPPER LETTER CHARACTER $'
SHOW DB 0AH, 0DH, 'HERE IS THE LOWER CASE CHARACTER: $'
INPUT DB ?

.CODE 
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV AH, 9
    LEA DX, CHAR
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, 20H
    
    MOV INPUT, AL
    
    MOV AH, 9
    LEA DX, SHOW
    INT 21H
    
    MOV AH, 2
    MOV DL, INPUT
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    