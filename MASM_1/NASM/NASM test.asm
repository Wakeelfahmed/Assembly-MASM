; a program to add three numbers

mov ax,5
xor ax,ax
v1 db 'Enter value 1: ', 0
mov ax, 0x4c00
int 0x21

num1: dw 5

result: dw 0