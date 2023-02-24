data segment
    msg1 db 10,13,"ENTER THE first string:$"
    msg2 db 10,13,"Reversed String:$"
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
                inc cl
                jmp repeat1

                exit1:lea dx,str1
                mov ah,09H
                int 21H

                lea di,str2
                dec si
                repeat2:cmp cl,00h
                        je exit2
                        mov al,[si]
                        mov [di],al
                        inc di
                        dec si
                        dec cl
                        jmp repeat2

                        exit2:
                         lea dx,msg2
                        mov ah,09H
                        int 21H

                        lea dx,str2
                        mov ah,09H
                        int 21H



                mov ah,4ch
                int 21H

                code ends
                end start

