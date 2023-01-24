
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.MODEL SMALL
.STACK 100H
.DATA
N DB 'NAME: RIFAT$'
ID DB 0DH, 0AH,'ID: 20-41847-1$'
LOCATION DB 'DHAKA BANGLADESH$'


.CODE 
MAIN PROC
MOV AX, @DATA; ACCESS IN THE DATA SEGMENT.
MOV DS, AX

MOV AH, 9
LEA DX, N
INT 21H

;FOR LINEBREAK
;MOV AH, 2
;MOV DL, 0AH
;INT 21H
;MOV DL, 0DH
;INT 21H
;......
 
MOV AH, 9
LEA DX, ID
INT 21H  

;FOR LINEBREAK
MOV AH, 2
MOV DL, 0AH
INT 21H
MOV DL, 0DH
INT 21H
;.......

MOV AH, 9 
LEA DX, LOCATION
INT 21H  

;FOR LINEBREAK
MOV AH, 2
MOV DL, 0AH
INT 21H
MOV DL, 0DH
INT 21H
;.......  

MOV AH, 4CH
INT 21H  
  
MAIN ENDP 
;OTHER PROCEDURE WRITE HERE
END MAIN
;PROGRAM END HERE



