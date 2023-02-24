data segment
    msg1 db 10,13,"Enter the first string:$"
    msg2 db 10,13,"Enter the substring:$"
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

    exit2:mov dl,'$'
          lea si,str1
          lea di,str2
          
