data segment 
    str1 db 20 DUP("$")
    str2 db 20 DUP("$")
    msg1 db 10,13,"Enter the first string:$"
    msg2 db 10,13,"Enter the second string:$"
    msg3 db 10,13,"The concatenated string is:$"

data ends
    
code segment

assume cs:code,ds:data
start:mov ax,data
      mov ds,ax

      lea dx,msg1
      mov ah,09H
      int 21H

      lea si,str1
      repeat1:mov ah,01h
      int 21H
      cmp al,13
      je skip1
      mov [si],al
      inc si
      jmp repeat1

     skip1: lea dx,msg2
      mov ah,09H
      int 21H
      
      lea si,str2
      repeat2:mov ah,01h
      int 21H
      cmp al,13
      je skip2
      mov [si],al
      inc si
      jmp repeat2

    skip2:call concat

mov ah,4ch
int 21H


    concat proc near
    lea si,str1
    lea di,str2
    mov al,'$'

    repeat3:cmp al,[si]
    jz skip3
    inc si
    jmp repeat3

    skip3:cmp al,[di]
    jz exit
    mov bl,[di]
    mov [si],bl
    inc si
    inc di
    jmp skip3

    exit:
          lea dx,msg3
          mov ah,09H
          int 21H

          lea dx,str1
          mov ah,09H
          int 21H
          ret
          concat endp

          code ends
          end start