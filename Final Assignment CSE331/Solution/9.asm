
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER ANY SENTENCE: $'   
MSG2 DB 0DH,0AH,'THE NUMBER OF VOWELS IN THIS STATEMENT: $'
STR DB 50 DUP('$')

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV SI,OFFSET STR
    
INPUT:
    MOV AH,1
    INT 21H
    CMP AL,13
    JE L1
    MOV [SI],AL
    INC SI
    JMP INPUT 
    
L1:XOR CL,CL 
   LEA DI,STR
   XOR AL,AL 
L2: MOV AL,[DI]
    CMP AL,'$'
    JZ PRINT_VOWEL_COUNT
    CMP AL,'A'
    JZ VOWEL_COUNT
    CMP AL,'E'
    JZ VOWEL_COUNT
    CMP AL,'I'
    JZ VOWEL_COUNT
    CMP AL,'O'
    JZ VOWEL_COUNT
    CMP AL,'U'
    JZ VOWEL_COUNT
    CMP AL,'a' 
    JZ VOWEL_COUNT
    CMP AL,'e' 
    JZ VOWEL_COUNT
    CMP AL,'i'
    JZ VOWEL_COUNT
    CMP AL,'o'
    JZ VOWEL_COUNT
    CMP AL,'u'    
    JZ VOWEL_COUNT
    INC DI
    JMP L2
    
VOWEL_COUNT: INC CL
             INC DL
             JMP L2 
             
PRINT_VOWEL_COUNT: 
     LEA DX, MSG2 
     MOV AH,9
     INT 21H
     
     MOV DL,CL
     ADD DL,30H
     MOV AH,2
     INT 21H
     
EXIT: MOV AH,4CH
      INT 21H
      
      MAIN ENDP 

END MAIN
             
             
  
  
  
  
  
  
  
  
  



