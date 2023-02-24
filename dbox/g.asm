data segment
  msg1 db 10,13,"Enter the first number:$"
  msg2 db 10,13,"Enter the second number:$"
  msg3 db 10,13,"Sum is:$"
  a db ?
  b db ?
  sum db ?
  carry db 00h
data ends

code segment  
  assume cs:code,ds:data
  start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09H
        int 21H

        call input
        mov a,al
        lea dx,msg2
        mov ah,09H
        int 21H

        call input
        mov b,al
        mov al,a
        add al,b
        daa
        jnc skip5
        inc carry
        skip5: 
        mov sum,al
        lea dx,msg3
        mov ah,09H
        int 21H

        mov al,carry
        add al,30h
        cmp al,39h
        jle skip6
        add al,07h
        skip6:
        mov dl,al
        mov ah,02h
        int 21H

        lea si,sum
        call output
        mov ah,4ch
        int 21H




        input proc near

        mov ah,01h
        int 21H
        sub al,30h
        cmp al,09h
        jle skip1
        sub al,07h
        skip1:mov cl,04h
              rol al,cl
              mov ch,al

              mov ah,01h
              int 21H
              sub al,30h
              cmp al,09H
              jle skip2
              sub al,07h
              skip2:add al,ch
              ret
              input endp

              output proc near
              mov al,[si]
              and al,0f0h
              mov cl,04h
              ror al,cl
              add al,30h
              cmp al,39h
              jle skip3
              add al,07h
              skip3:mov dl,al
              mov ah,02h
              int 21h
               
               mov al,[si]
               and al,0fh
               add al,30h
               cmp al,39h
               jle skip4
               add al,07h
               skip4:
               mov dl,al
               mov ah,02h
               int 21H
               ret 
               output endp

               code ends
               end start
