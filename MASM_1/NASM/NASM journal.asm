[org 0x0100]			; a directive that takes memory place for machine code

Mov ax, bx				; value that is in base register is moved to accumulator register
Mov bx, ax				; value that is in accumulator register is moved to base register
Mov ax, any hardcore value	; any value moved to accumulator register
Mov bx, any hardcore value	; any value moved to base register
Mov cx, dx				; value that is in data register is moved to counter register
Mov dx, cx				; value that is in counter register is moved to data register
Mov cx, any hardcore value	; any value moved to counter register
Mov dx, any hardcore value	; any value moved to data register

mov ax, 0x4c00			; self-terminate
int 0x21				; system interupt call