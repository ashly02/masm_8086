data segment
    msg1 db 10,13,"Enter the first number:$"
    msg2 db 10,13,"Enter the second number:$"
    msg3 db 10,13,"quotient::$"
    msg4 db 10,13,"Remainder:$"
   
    a db ?
    b db ?
    q db ?
    r db ?
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
        mov ax,0000h
        mov ah,00h
        mov al,a
        mov bl,b
        div bl
        aad
        mov q,al
        mov r,ah

        lea dx,msg3
        mov ah,09H
        int 21H
        lea si,q
        call output
        lea dx,msg4
        mov ah,09H
        int 21H
        lea si,r
        call output

     
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