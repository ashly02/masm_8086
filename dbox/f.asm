data segment
    msg1 db 10,13,"Enter the first string:$"
    msg2 db 10,13,"String is a pallindrome$"
    msg3 db 10,13,"String is not a pallindrome$"
    msg4 db 10,13,"Reversed string:$"
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
    mov cl,00h
    repeat1:mov ah,01h
    int 21H
    cmp al,13
    je exit1
    mov [si],al
    inc si
    add cl,01h
    jmp repeat1

    exit1:
    lea di,str2
    inc cl
    repeat2:dec si
           sub cl,01h
            cmp cl,00h
            je exit2
            mov al,[si]
            mov [di],al
            
            inc di
            jmp repeat2
exit2:
            lea dx,msg4
            mov ah,09H
            int 21H

            lea dx,str2
            mov ah,09H
            int 21H

            lea si,str1
            lea di,str2
            mov dl,'$'
           repeat3:cmp dl,[si]
           je exit4
           mov al,[di]
            cmp [si],al
            jne exit3
            inc si 
            inc di
            jmp repeat3
            exit3:lea dx,msg3
            mov ah,09H
            int 21H
            jmp exit5
exit4:      lea dx,msg2
            mov ah,09H
            int 21H
            exit5:
            mov ah,4ch
            int 21H

            code ends
            end start


            


