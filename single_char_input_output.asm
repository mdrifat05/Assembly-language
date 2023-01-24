.MODEL SMALL
.STACK 100H
.DATA 
MGS DB 'HELLO WORLD$'
MGS1 DB 'A'
INPUT DB 0AH, 0DH, 'ENTER YOUR INPUT $'
SHOW DB 0AH, 0DH, 'YOUR INPUT IS $'
CHAR DB ?

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    ;STRING PRINT
    MOV AH, 9
    LEA DX, MGS
    INT 21H 
    
    ;LINE BREAK
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    ;
    
    ;CHARCTER PRINT
    MOV AH, 2
    MOV DL, MGS1
    INT 21H
    
    MOV AH, 9
    LEA DX, INPUT
    INT 21H
    
    ;TAKING INPUT
    MOV AH, 1 
    INT 21H  
    MOV CHAR, AL
    
    MOV AH, 9
    LEA DX, SHOW
    INT 21H
    
    MOV DL, CHAR
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
