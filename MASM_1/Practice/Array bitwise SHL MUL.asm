include Irvine32.inc
.data
	ar1 DWORD 1, 2, 3
		DWORD 4,5,6
		DWORD 7,8,9
	ar2 DWORD 1,2,3
		DWORD 4,5,6
		DWORD 7,8,25
	ar3 DWORD 3 dup(3 dup(?))
	multipland DWORD ?
	multiplier DWORD ?
	result byte 0
.code
shift_mul proc
	mov cl, 32 ;8
	mov ebx, multipland
	mov edx, multiplier
	;mov bl, multipland
	;mov dl, multiplier
	checkbit:
		shr dl, 1
		jnc skip
		add result, bl
	skip:
		shl ebx,1
		;shl bl,1
		dec cl
		jnz checkbit
	ret
shift_mul endp

main PROC
	mov ecx,3
	mov ebx, offset ar1
	mov edi, offset ar2
	mov edx, offset ar3
	mov esi, 0
	mov eax, 0
	l1:
		push ecx
		mov ecx, 3
		l2:
			mov al, [ebx+esi]
			mov multipland,al
		
			mov al, [edi+esi]
			mov multiplier, al
		
			pushad
			call shift_mul
			popad

			mov al,result
			mov [edx+esi], al
			mov result, 0
		
			add esi, 1
		
		loop l2
		add ebx, esi
		add edi, esi
		add edx, esi
		mov esi, 0
		pop ecx
	loop l1

; Print 3rd Array
mov ebx,offset ar3
mov esi,0
mov ecx,3

l3:
	push ecx
	mov ecx,3

	l4:
		mov al,[ebx+esi]
		add esi,1
		call writeint
		mov al,' '
		call writechar

		loop l4

	call crlf
	pop ecx
	add ebx,esi
	mov esi,0

	loop l3

exit
main endp
end main