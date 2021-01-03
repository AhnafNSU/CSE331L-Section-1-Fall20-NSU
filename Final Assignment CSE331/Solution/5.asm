
.MODEL SMALL 
.STACK 100H
.DATA
MSG1 DB 'Enter from 0-9: $'
MSG2 DB 0DH, 0AH, 'The number is odd$'
MSG3 DB 0DH, 0AH, 'The number is even$'

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     LEA DX,MSG1
     MOV AH,9
     INT 21H
     
INPUT:
     MOV AH,1
     INT 21H
     
EVEN_ODD_CHECK:
     TEST AL,01H
     JZ EVEN
     
ODD: 
     LEA DX,MSG2
     MOV AH, 9
     INT 21H
     JMP EXIT
EVEN: 
     LEA DX,MSG3
     MOV AH,9
     INT 21H 
EXIT:
     MOV AH,4CH
     INT 21H 
     
MAIN ENDP
END MAIN 





