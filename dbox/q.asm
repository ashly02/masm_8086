data segment 
    msg1 db 10,13,"Enter the number of terms:$"
    msg2 db 10,13,"Enter the terms:$"
    msg3 db 10,13,"sum:$"
    len db ?
    temp db ?
    arr db 20 DUP(?)
data ends

code segment
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09H
    int 21h

    call input
    mov len,al
    mov temp,al
    lea si,arr
    loop1:lea dx,msg2
    mov ah,09H
    int 21h
    
    call input
    mov [si],al
    inc si
    dec len
    cmp len,00h
    jne loop1

    mov al,00h
    lea si,arr
    loop2:
    add al,[si]
    daa
    inc si
    dec temp
    cmp temp,00h
    jne loop2

    lea dx,msg3
    mov ah,09H
    int 21H

    mov bl,al
    and al,0f0h
    mov cl,04h
    ror al,cl
    add al,30h
    cmp al,39h
    jle skip5
    add al,07h
    skip5:mov dl,al
    mov ah,02H
    int 21H
    mov al,bl
    and al,0fh
    add al,30h
    cmp al,39h
    jle skip6
    add al,07h
    skip6:mov dl,al
    mov ah,02H
    int 21H


    mov ah,4ch
    int 21H


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

    code ends 
    end start



