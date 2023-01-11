include	irvine32.inc
.data
Enter_Num BYTE "Enter Number: ", 0
char_found_mes BYTE "a char", 0
digit_found_mes BYTE "a digit", 0
Not_mes BYTE "Not ", 0
num1 dword ?
.code
main PROC
	mov eax, 0
	mov edx, offset Enter_Num
	call writeString
	call Readchar
	call Dumpregs
	;all IsAlpha1
	call crlf
	;call writechar
exit
main endp
IsDigit1 PROC
	call WriteInt
;	cmp 
	call writeString
	ret
isDigit1 endp

IsAlpha1 PROC			; convert stack char arg to uppercase
	call writechar
	mov edx, offset char_found_mes
	call writeString	
	push ebp
	mov	ebp,esp
	
	mov	al, [esp+8]	; AL = character
	cmp	al,'a'		; less than 'a'?
	jb skip			; yes: do nothing
	cmp	al,'z'		; greater than 'z'?
	ja skip			; yes: do nothing
	mov edx, offset char_found_mes
	call writeString	
skip:	pop	ebp
	mov edx, offset Not_mes
	call writeString	
	mov edx, offset char_found_mes
	call writeString	
	ret	4			; clean up the stack
IsAlpha1 ENDP
end main