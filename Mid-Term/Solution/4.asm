.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC 
    MOV BX,4
    MOV CX,3
    
   L1:
    PUSH CX
    MOV AH,2
    
   L2:
    INT 21H
    LOOP L2   
   
   
   MOV CX,BX        
   MOV DL,'*' 
  
  L3:
   INT 21H
   LOOP L3
   
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV DL,13
   INT 21H
   
   INC BX
   INC BX
  
   
   POP CX
   
   LOOP L1      
                           
   MOV AH,4CH
   INT 21H
   
   MAIN ENDP
END MAIN       
