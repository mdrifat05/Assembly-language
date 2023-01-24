MOV CX, 4D
MOV AH, 2
M:
MOV DL, 'A'
INT 21H
MOV DL, '*'
INT 21H
LOOP M



