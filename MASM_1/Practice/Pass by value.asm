INCLUDE Irvine32.inc
.data
.code
main PROC
	push 2
	push 4
	push 6
	call MYPROC
exit
main ENDP
MYPROC PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp + 16]
	call writeint
	call crlf	
	mov eax, [ebp + 12]
	call writeint
	call crlf
	mov eax, [ebp + 8]
	call writeint
	call crlf
	pop ebp
	ret 12
MYPROC endp
END main