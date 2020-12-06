

.MODEL SMALL
.STACK 100H

.DATA
    
    NUM1 DB ?
    NUM2 DB ?
    RES1 DB ?
    PROMPT_1 DB "Enter Integer 1: $"
    PROMPT_2 DB 0DH, 0AH, "Enter Integer 2: $"
    PROMPT_3 DB 0DH, 0AH, "MUL of 2 Integers: $"
    
.CODE

    MAIN PROC
    MOV AX,DATA
    MOV DS,AX     
    LEA DX,PROMPT_1
    MOV AH,9
    INT 21H     
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL     
    LEA DX,PROMPT_2
    MOV AH,9
    INT 21H     
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM2,AL
    MUL NUM1
    MOV RES1,AL
    AAM    
    ADD AH,30H
    ADD AL,30H
    MOV BX,AX
    LEA DX,PROMPT_3
    MOV AH,9     
    INT 21H
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H
    MOV AH,4CH
    INT 21H
    
    
   MAIN ENDP
  END MAIN

ret




