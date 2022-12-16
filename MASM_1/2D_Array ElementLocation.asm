INCLUDE irvine32.inc
.data
tableW DWORD 2, 100, 2,   1, 100, 1,   1, 100, 1,   1, 100, 0,   0, 100, 10
;twice sum of 1 index element of all rows
ColSize WORD 3
RowSize WORD 5
ElementLocation DWORD 0
.code
main proc
mov eax,11111111111111111111111111111111b
call dumpregs
inc eax
call dumpregs
	mov ebx, 0
	mov esi, offset tableW
	;mov edx, 0
	movzx ecx, RowSize
	L1: 
		push ecx
		movzx ecx, ColSize
		mov edx, 0
		L2:
			cmp edx, ElementLocation
			jnz L3
			;mov eax, TYPE tableW
			;mul ElementLocation
			;add ebx, [esi + eax]
			add ebx, [esi + TYPE tableW]
			;call DumpRegs
			L3:
			inc edx
		loop L2
		mov eax, type tableW
		mul ColSize
		add esi, eax
		pop ecx
	loop L1
	call DumpRegs
	call crlf	
	call crlf
	mov eax, ebx
	call Writeint
exit
main endp
end main