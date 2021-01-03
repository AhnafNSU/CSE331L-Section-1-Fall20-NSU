.MODEL SMALL
 .STACK 100H

 .DATA
    MSG DB 'The Lower Case Letters from z to a are: $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                 
     MOV DS, AX

     LEA DX, MSG               
     MOV AH, 9
     INT 21H

     MOV CX, 26                   

     MOV AH, 2                      
     MOV DL, 122                  

     @LOOP:                       
       INT 21H                    

       DEC DL                     
       DEC CX                     

     JNZ @LOOP                    

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN