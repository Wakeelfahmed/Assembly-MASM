include	irvine32.inc
.data
tableW DWORD 1, 2, 3,   1, 1, 3,   1, 1, 3,   1, 1, 3,   1, 1, 3
ColSize word 3
rowsize word 5
.code
main PROC
	mov esi, offset tableW
	movzx ecx, RowSize
	mov eax, 0
	L1:
	add esi, Type tableW	;does not work on WORD array type
	add esi, Type tableW
	add eax, [esi]
	add esi, Type tableW
	loop L1
	call Dumpregs
	call writeInt
exit
main endp
end main