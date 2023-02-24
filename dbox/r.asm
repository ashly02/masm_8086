data segment
    msg1 db 10,13,"Enter the terms:$";
    msg2 db 10,13,"Enter the terms:$";
    msg3 db 10,13,"sorted array:$"
    n db ?
    len db ?
    temp db ?
data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
	