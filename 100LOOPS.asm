
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL
.STACK 100H
.DATA
M1 DB 'ENTER A CHARACTER: $'


.CODE 
MAIN PROC
MOV AX, @DATA; ACCESS IN THE DATA SEGMENT.
MOV DS, AX

MOV AH, 9
LEA DX, M1
INT 21H

MOV AH, 1; TAKING INPUT HERE. IT WILL TO AL
INT 21H
MOV BL, AL

;FOR LINEBREAK
MOV AH, 2
MOV DL, 0AH
INT 21H
MOV DL, 0DH
INT 21H
;......
 
MOV DL, BL 
MOV AH, 2
INT 21H 


MOV CX, 100D
L:
INT 21H 
LOOP L


MOV AH, 4CH
INT 21H  
  
MAIN ENDP 
;OTHER PROCEDURE WRITE HERE
END MAIN
;PROGRAM END HERE



