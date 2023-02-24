data segment
      msg1 db 10,13,"Enter the string:$"
      msg2 db 10,13,"Enter the character to replace:$"
      msg3 db 10,13,"Enter the character to be replaced with:$"
      str1 db 20 DUP("$")
data ends

code segment
      assume cs:code,ds:data
      start:
            mov ax,data
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

            exit1:mov ah,09H
                  lea  dx,str1
                  int 21H
                  lea dx,msg2
                  mov ah,09H
                  int 21H
                  mov ah,01h
                  int 21H
                  mov bl,al

                  lea dx,msg3
                  mov ah,09H
                  int 21H
                  mov ah,01h
                  int 21H
                  mov cl,al
                  mov dl,'$'
                  lea si,str1
                  rep2:cmp [si],dl
                        je exit3
                        cmp [si],bl
                        jne exit4
                        mov [si],cl
                        inc si
                        jmp rep2

                        exit4:inc si
                        jmp rep2

                        exit3:lea dx,str1
                              mov ah,09H
                              int 21H


                  mov ah,4ch
                  int 21H

                  code ends
                  end start