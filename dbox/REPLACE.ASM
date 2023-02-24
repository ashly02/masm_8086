data segment
str1 db 20 DUP("$")

msg1 db 10,13,"Enter the string:$"
msg2 db 10,13,"Enter the character to be replaced:$"
msg3 db 10,13,"Enter the character to replace:$"
msg4 db 10,13,"New string is:$"
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
       repeat:mov ah,01H
       int 21H
       cmp al,13
       je skip1
       mov [si],al
       inc si
       jmp repeat

       skip1:lea dx,msg2
       mov ah,09H
       int 21H

      
       mov ah,01H
       int 21H
       mov cl,al
       
       lea dx,msg3
       mov ah,09H
       int 21H

 
       mov ah,01H
       int 21H
       mov ch,al

       lea si,str1
       mov dl,'$'
       repeat1:cmp dl,[si]
       jz exit
       cmp cl,[si]
       jz skip2
       inc si
       jmp repeat1
       skip2:mov [si],ch
             inc si
             jmp repeat1
        
        exit:lea dx,msg4
        mov ah,09H
        int 21H

        lea dx,str1
        mov ah,09H
        int 21H

        mov ah,4cH
        int 21H

        code ends
        end start

    
       

