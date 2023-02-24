data segment
    msg1 db 10,13,"Enter the number:$"
    msg2 db 10,13,"odd$"
    msg3 db 10,13,"even$"
    num db ?
    rem db ?
data ends

code segment
    assume cs:code,ds:data
    start:
          mov ax,data
          mov ds,ax

          lea dx,msg1
          mov ah,09h 
          int 21H

          call input
          mov bl,00h
          mov cl,02h
         
         rep8: cmp al,cl
         jle skip
         sub al,cl
          inc bl
          jmp rep8
         skip:
              cmp al,01h 
              je skip7
              lea dx,msg3
              mov ah,09h
              int 21H
              jmp exit
              skip7:
              lea dx,msg2
              mov ah,09h
              int 21H
              
exit:    
mov ah,4ch 
int 21h
          

        input proc near
        mov ah,01h
        int 21H
        sub al,30h
        cmp al,09H
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
        int 21H
        mov al,[si]
        and al,0fh
        add al,30h
        cmp al,39h
        jle skip4
        add al,07h
        skip4:mov dl,al
        mov ah,02h
        int 21H
        ret
        output endp

        code ends
        end start