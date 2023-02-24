data segment
    msg1 db 10,13,"Enter the string:$"
    msg2 db 10,13,"occurances:$"
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

        exit1:
        mov cl,00h
        lea si,str1
        mov dl,'$'
       loop1: cmp [si],dl
        je exit2
        mov ah,'a'
        cmp [si],ah
        je exit3
        mov al,'e'
        cmp [si],al
        je exit3
        mov bl,'i'
        cmp [si],bl
        je exit3
        mov bh,'o'
        cmp [si],bh
        je exit3
        mov ch,'u'
        cmp [si],ch
        je exit3
        inc si
        jmp loop1
        exit3:inc cl
        inc si
        jmp loop1

        exit2:
        lea dx,msg2
        mov ah,09H
        int 21H

        mov al,cl
        add al,30h
        cmp al,39h
        jle skip6
        add al,07h
        skip6:
        mov dl,al
        mov ah,02H
        int 21h

        mov ah,4ch
        int 21H

        code ends
        end start

            