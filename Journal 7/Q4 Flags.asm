include	irvine32.inc
.data
.code
main PROC
	mov eax, 11111111111111111111111111111111b
	add eax, 1		;sets sign flag  
	call dumpregs
	mov ecx, 100
	mov eax, 0

exit
main endp
end main