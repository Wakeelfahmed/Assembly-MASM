INCLUDE Irvine32.inc
.data
messa BYTE "sgdsdfa",0
.code
main PROC
	push offset messa 
	push 4
	push 6
	call MYPROC
exit
main ENDP
MYPROC PROC
	push ebp
	mov ebp, esp
	mov edx, [ebp + 16]
	call writestring
	call crlf	
	mov eax, [ebp + 12]
	call writestring
	call crlf
	mov eax, [ebp + 8]
	call writestring
	call crlf
	pop ebp
	ret 12
MYPROC endp
END main