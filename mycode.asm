.MODEL SMALL
.STACK 100H
.DATA
MGS DB 'ENTER CHARACTER: $'
M DB 0AH,0DH, 'THANK YOU$'
.CODE 
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, MGS
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BH, AL
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    CMP BH,BL
    
    JL LEVEL1 
    
    JNL LEVEL2
   
    
    LEVEL2:
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
     JMP EXIT
       
    LEVEL1: 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
    
    EXIT:
     MOV AH, 9
    LEA DX, M
    INT 21H
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    
    