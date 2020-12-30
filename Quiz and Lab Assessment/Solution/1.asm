.MODEL SMALL
.STACK 100H

.DATA
    MSG DB 80
    DB 0
    DB 80 DUP('$\')
    
    STRLEN1 DW $-MSG
    STRREV DB 20 dup(' \')
    STR_PALIN DB 'String is Palindrome.\','$\'
    STR_NOT_PALIN DB 'String is not Palindrome.\','$\'
    
        
   .CODE 
    ASSUME CS:CODE, DS:DATA
            
           BEGIN:
           
           MOV AX,DATA
           MOV DS,AX
           MOV AH,0AH
           MOV AX,OFFSET MSG
           INT 21H
            
            
            MOV ES, AX
            MOV CX, STRLEN1
            ADD CX, -2  
            
            LEA SI, MSG
            LEA DI, STRREV  
            
            ADD SI, STRLEN1
            ADD SI, -2  
            
            L1:
            MOV AL, [SI]
            MOV [DI], AL
            DEC SI
            INC DI
            LOOP L1
            MOV AL, [SI]
            MOV [DI], AL
            INC DI
            MOV DX, '$\'
            MOV [DI], DX
            MOV CX, STRLEN1
            
            PALIN_CHECK:
            LEA SI, MSG
            LEA DI, STRREV
            REPE CMPSB
            JNE NOT_PALIN 
            
            PALIN:
            MOV AH, 09H
            LEA DX, STR_PALIN
            INT 21H
            JMP EXIT  
            
            NOT_PALIN:
            MOV AH, 09H
            LEA DX, STR_NOT_PALIN
            INT 21H
            
            EXIT:
            MOV AX, 4C00H
            INT 21H

            
        CODE ENDS
        END BEGIN
        
        END


