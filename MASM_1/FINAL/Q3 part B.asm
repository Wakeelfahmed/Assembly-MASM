INCLUDE Irvine32.inc
.data
array1 Dword 24,24,12,16
array2 Dword 24,24,12,16
array3 Dword 4 dup(?)
.code
main PROC
mov eax, 0
mov ebx, 0
mov ecx, 4
	l1:
		mov eax, array1[ebx]
		mov edx, array2[ebx]
		cmp eax, edx
		mov array3[ebx], eax
		add ebx, type array1
		call writeint
		call crlf
		;inc ebx
	loop l1
mov ecx, 4
	l2:
			mov eax, array3[ebx]
					call writeint
					call crlf
		add ebx, type array1


	loop l2
	exit	; exit to operating system
main ENDP
END main