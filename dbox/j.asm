data segment
    msg1 db 10,13,"Enter the number of terms:$"
    msg2 db 10,13,"the fibonacci series:$"
    msg3 db 10,13,"$"
    n db ?
    carry db 00h
    a db 00H
    b db 01h
    sum db 00H
    fib db 20 DUP("$")
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
      sub al,01h
      mov n,al
      lea dx,msg2
      mov ah,09H
      int 21H
      lea dx,msg3
      mov ah,09H
      int 21H

      lea si,a
      call output


      lea dx,msg3
      mov ah,09H
      int 21H

    rep1:  
     mov bl,b
     mov a,bl
     mov cl,sum
     mov b,cl

      mov al,a
      add al,b
      daa
      jnc skip6
      inc carry
      skip6:

      mov sum,al
      mov al,carry
      add al,30h
      cmp al,39h
      jle skip7
      add al,07h
      skip7:
      mov dl,al
      mov ah,02H
      int 21h
      lea si,sum

      call output
      dec n
     lea dx,msg3
      mov ah,09H
      int 21H
      jnz rep1
      
      mov ah,4ch 
      int 21H



      input proc near
      mov ah,01h
      int 21H
      sub al,30H
      cmp al,09h
      jle skip1
      sub al,07h
      skip1:
      mov cl,04h
      rol al,cl
      mov ch,al

      mov ah,01h
      int 21H
      sub al,30H
      cmp al,09h
      jle skip2
      sub al,07h
      skip2:
      add al,ch
      ret 
      input endp
      
      output proc near
      mov al,[si]
      and al,0f0h
      mov cl,04h
      ror al,cl
      add al,30H
      cmp al,39h
      jle skip3
      add al,07h
      skip3:mov dl,al
      mov ah,02h
      int 21H
      
      mov al,[si]
      and al,0fh
      add al,30H
      cmp al,39h
      jle skip4
      add al,07h
      skip4:
      mov dl,al
      mov ah,02H
      int 21H
      ret
      output endp

      code ends
      end start