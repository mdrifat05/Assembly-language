
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV CX, 26
MOV DL, 65
MOV AH, 2

TOP:
INT 21H
INC DL
LOOP TOP






