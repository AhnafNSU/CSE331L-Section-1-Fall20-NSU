

.MODEL SMALL
.STACK 100H

.DATA
    PROMPT1 DB "Numbers are: $"
    
.CODE

    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        LEA DX, PROMPT1
        MOV AH, 9
        INT 21H
        
        MOV CX, 10
        MOV AH, 2
        MOV DL, 48
        
        @LOOP:
            INT 21H
            INC DL
            DEC CX
            
        JNZ @LOOP
                  
            MOV AH, 4CH
            INT 21H
            
            
       MAIN ENDP
    
    END MAIN




