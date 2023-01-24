.MODEL SMALL
.STACK 100H
.DATA
MGS DB "INPUT A NUMBER: $"
MGS1 DB 0AH, 0DH, "EVEN$"
MGS2 DB 0AH, 0DH, "ODD$"
MGS3 DB 0AH, 0DH, "NOT A NUMBER$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, MGS
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    CMP AL, '1'
    JE ODD
    CMP AL, '3'
    JE ODD
    CMP AL, '5'
    JE ODD
    CMP AL, '7'
    JE ODD
    CMP AL, '9'
    JE ODD
    
    CMP AL, '0'
    JE EVEN
    CMP AL, '2'
    JE EVEN
    CMP AL, '4'
    JE EVEN
    CMP AL, '6'
    JE EVEN
    CMP AL, '8'
    JE EVEN 
    
    JNE INVALID
    
    EVEN:
    MOV AH, 9
    LEA DX, MGS1
    INT 21H
    JMP EXIT
    
    ODD:
    MOV AH, 9
    LEA DX, MGS2
    INT 21H
    JMP EXIT
    
    INVALID:
    MOV AH, 9
    LEA DX, MGS3
    INT 21H
    JMP EXIT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    
    MAIN ENDP 
END MAIN
    
