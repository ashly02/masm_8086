data segment
    msg1 db 10,13,"Enter the first string:$"
    msg2 db 10,13,"Enter the second string:$"
    msg3 db 10,13,"Concatenated string:$"
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

        lea si,str1
        rep1:mov ah,01h
             int 21H
             cmp al,13
             je exit1
             mov [si],al
             inc si
             jmp rep1

             exit1:
             lea dx,msg2 
             mov ah,09H
             int 21H

             lea di,str2
             rep2:
             mov ah,01h
             int 21H
             cmp al,13
             je exit2
             mov [di],al
             inc di
             jmp rep2

             exit2:
              mov dl,'$'
              lea di,str2

              repeat3:cmp [di],dl
                      je exit3
                      mov al,[di]
                      mov [si],al
                      inc si
                      inc di
                      jmp repeat3
                      

                      exit3:lea dx,msg3
                            mov ah,09H
                            int 21H

                            lea dx,str1
                            mov ah,09H
                            int 21H

                            mov ah,4ch
                            int 21H

                            code ends 
                            end start






