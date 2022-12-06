include	Irvine32.inc
.code
main proc
	mov ebx, 5
	mov ecx, 5
	mov eax, 0
	mov edx, 0
	call DumpRegs
	call AddTwo
	call DumpRegs
exit
main endp
AddTwo PROC	USES ebx ecx
	add ebx, ecx
	ret	
AddTwo endp
end main