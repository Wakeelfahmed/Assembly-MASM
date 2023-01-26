include irvine32.inc
.data
	Arr1 DWORD 3,2,1
	cols = ($ - Arr1) / TYPE Arr1
		DWORD 6,5,4
		DWORD 9,8,7
	rows = 3
	Arr2 DWORD 23,52,61
		DWORD 623,5,234
		DWORD 89,823,76
	Arr3 DWORD 9 DUP(0)
	multipland DWORD ?
	multiplier DWORD ?
	result DWORD 0
.code
shift_mul proc
	mov result, 0
	mov cl,32
	mov ebx, multipland
	mov edx, multiplier
	checkbit:
		shr edx, 1
		jnc skip
		add result, ebx
	skip:
		shl ebx, 1
		dec cl
		jnz checkbit
	ret
shift_mul endp

main proc
	mov eax, 0
	mov ebx, 0
	mov esi, OFFSET Arr1
	mov edi, OFFSET Arr2
	mov edx, OFFSET Arr3
	mov ecx, 0
	mov ch, rows
outer:
	mov cl, cols
	mov ebx, 0
	inner:
		mov eax, [esi + ebx]
		mov multipland, eax
		mov eax, [edi + ebx]
		mov multiplier, eax

		pushad
		call shift_mul
		popad
		mov eax, result
		mov [edx + ebx],eax
		
		add ebx, TYPE Arr1
		dec cl
		jnz inner

	add esi, TYPE Arr1 * rows
	add edi, TYPE Arr2 * rows
	add edx, TYPE Arr3 * rows
	dec ch
	jnz outer
	
	call crlf
	;Printing Resultant Array
	mov ebx, 0
	mov edi, OFFSET Arr3
	mov ecx, 0
	mov ch, rows
outer1:
	mov cl, cols
	mov ebx, 0

	inner1:
		mov eax, [edi + ebx]
		call writedec
		
		mov al, 9
		call writechar

		add ebx, TYPE Arr3
		dec cl
		jnz inner1
	call crlf
	add edi,ebx
	dec ch
	jnz outer1
exit
main endp
end main