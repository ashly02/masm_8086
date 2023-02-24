data segment
    msg1 db 10,13,"Enter the first number:$"
    msg2 db 10,13,"Enter the second number:$"
    msg3 db 10,13,"Product:$"
    num1 db ?
    num2 db ?
    pdt db ?
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
    lea dx,msg2
    mov ah,09H
    int 21H

    mov ah,01h
    int 21H
    sub al,30h
    mov num2,al
    mov al,num1
    mul num2
    aam
    add ax,3030h
    mov bx,ax

    lea dx,msg3
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



