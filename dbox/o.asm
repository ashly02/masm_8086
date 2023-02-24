data segment
    msg1 db 10,13,"Enter the number:$"
    msg2 db 10,13,"Square :$"
    num1 db ?
data ends

code segment
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax

    lea dx,msg1
    mov ah,09H
    int 21H

    mov ah,01h
    int 21H
    sub al,30h
    mov num1,al

    mul num1
    aam
    add ax,3030H
    mov bx,ax
    lea dx,msg2
    mov ah,09H
    int 21H
    mov dl,bh
    mov ah,02H
    int 21H

    mov dl,bl
    mov ah,02H
    int 21H

    mov ah,4ch
    int 21H

    code ends
    end start