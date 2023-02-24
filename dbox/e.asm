data segment
    msg1 db 10,13,"Enter the first string:$"
    msg2 db 10,13,"Enter the second string:$"
    msg3 db 10,13,"Strings are equal$"
    msg4 db 10,13,"strings are not equal$"
    msg5 db 10,13,"String 1 is greater$"
    msg6 db 10,13,"String 2 is greater$"
    str1 db 20 DUP("$")
    str2 db 20 DUP("$")
data ends

code segment
    assume cs:code,ds:data
    start:
          mov ax,data
          mov ds,ax

          lea dx,msg1
          mov ah,09H
          int 21H

          mov cl,00h
          lea si,str1
          repeat1:mov ah,01h
          int 21H
          cmp al,13
          je exit1
          mov [si],al
          inc si
          add cl,01h
          jmp repeat1

          exit1:lea dx,msg2
          mov ah,09H
          int 21H

          mov bl,00h
          lea di,str2
          repeat2:mov ah,01h
          int 21H
          cmp al,13
          je exit2
          mov [di],al
          inc di
          add bl,01h
          jmp repeat2

          exit2:
               lea si,str1
               lea di,str2
               cmp cl,bl
                jne exit3
               mov ah,'$'
              repeat3:cmp [si],al
              je exit6
              mov al,[si]
                mov dl,[di]
                cmp al,dl
                jne exit3
                inc si
                inc di
                jmp repeat3
                exit6:lea dx,msg3
                mov ah,09H
                int 21H
                jmp exit7
                
                exit3:
                
                lea dx,msg4
                mov ah,09H
                int 21H
                cmp cl,bl
                jc exit8
                lea dx,msg5
                mov ah,09H
                int 21H
                jmp exit7
                exit8:
                mov ah,09H
                lea dx,msg6
                int 21H

                exit7:
                      mov ah,4ch
                      int 21H
                      code ends
                      end start