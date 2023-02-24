data segment
    str1 DB 20 DUP('$')
    str2 DB 20 DUP('$')
    str3 DB 40 DUP('$')
    msg1 DB 10,13, "Enter first string: $"
    msg2 DB 10,13, "Enter second string: $"
    msg3 DB 10,13, "Concatenated string: $"
data ends
code segment
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax

    lea dx,msg1 
    mov ah,09H
    int 21H

    mov si,offset str1
    call input

	mov ah,09H ; msg 2
    lea dx,msg2
    int 21H
    mov si,offset str2
    call input

    mov cl,str1+1
    mov si,offset str1
    next: inc si
    dec cl
    jnz next
    inc si
    inc si
    mov di, offset str2
    inc di
    inc di
    mov cl,str2+1
    next2: mov al,[di]
    mov [si],al
    inc si
    inc di
    dec cl
    jnz next2


    lea dx,msg3
    mov ah,09H
    int 21H
    mov si,offset str1+2
	call output
	
    mov ah,4CH
	int 21H

input proc near
	mov ah,0AH
    mov dx,si
	int 21H
	ret
input endp

output proc near
	mov ah,09H
    mov dx,si
	int 21H
	ret
output endp

code ends 
end start
