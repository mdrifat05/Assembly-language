.MODEL SMALL
.STACK 100H
.DATA

INPUT DB 'ENTER A NUMBER: $'
POS DB 0AH, 0DH, 'POSITIVE$'
NEGA DB 0AH, 0DH, 'NEGATIVE$' 
Z DB 0AH, 0DH, 'ZERO$'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        LEA DX, INPUT
        INT 21H
        
        MOV AH, 1
        INT 21H
    
        
        CMP AL, 30H
        
        JG LEVEL1
        JL LEVEL2
        JE ZERO
        
        LEVEL1:
        
        MOV AH, 9
        LEA DX, POS
        INT 21H
        JMP EXIT
                    
           
        LEVEL2:
        MOV AH, 9
        LEA DX, NEGA
        INT 21H
        JMP EXIT 
        
        ZERO:
        LEA DX, Z 
        MOV AH, 9
        INT 21H
        JMP EXIT
        
        EXIT:
        MOV AH, 4CH
        INT 21H
        
        MAIN ENDP
    END MAIN