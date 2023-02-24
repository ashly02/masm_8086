data segment
    msg1 db 10,13,"Enter the string:$"
    msg2 db 10,13,"Enter the substring:$"
    msg3 db 10,13,"String found$"
    msg4 db 10,13,"occurance:$"
    str1 db 20 DUP("$")
    str2 db 20 DUP("$")
data ends

code segment 
    assume cs:code,ds:data
    start:mov ax,data
          mov ds,ax

          lea dx,msg1
          mov ah,09H
          int 21H

          lea si,str1
          rep1:mov ah,01h
          int 21H
          cmp al,13
          je exit1
          mov [si],al
          inc si
          jmp rep1
          exit1:lea dx,msg2
                mov ah,09H
                int 21H
          lea di,str2
          rep2:mov ah,01h
          int 21H
          cmp al,13
          je exit2
          mov [di],al
          inc di
          jmp rep2
        
          exit2:
          mov dl,'$'
          lea si,str1
          lea di,str2
          mov cl,00h
          rep3:cmp dl,[si]
               je exit3
               mov al,[di]
               cmp [si],al
               jne exit4 
               inc si 
               inc di
               cmp [di],dl
               jne exit5
               inc cl
              
               lea di,str2
               jmp rep3

               exit4:inc si
               jmp rep3
                exit5:
                    lea di,str2
                    jmp rep3
            
               exit3:lea dx,msg4
                    mov ah,09H
                    int 21H

                    mov al,cl
                    add al,30h
                    cmp al,39h
                    jle skip1
                    add al,07h
                    skip1:
                     
                     mov dl,al
                     mov ah,02h
                     int 21H

               mov ah,4ch 
               int 21h

          code ends
          end start