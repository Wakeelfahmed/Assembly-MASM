include Irvine32.inc
.data
Numbers_to_enter_mess BYTE "How many numbers to enter (not more than 50)? "
Sum_mess BYTE "Sum is: "
Array DWORD	  50 Dup(?)
SUM DWORD ?
.code
main PROC
	mov esi, 0
	mov ebx, 0
	mov edx, offset Numbers_to_enter_mess
	call writestring
	call Readint
	mov ecx, eax
	mov edx, ecx

	l1:
		call Readint
		mov Array[ebx] , eax
		mov eax,0
		mov eax, Array[ebx]
		inc ebx
		call Writeint
		call crlf
	loop l1
	mov ecx, edx
	;push ecx
	push OFFSET Array
;	mov eax, ecx
	;push eax
	call array_SUM
	mov edx, offset SUM_mess
	call writestring
	call Writeint

exit
main endp

array_SUM PROC
	;push ebp
	mov ebp, esp
	mov esi, 0
	;mov ecx, [ebp + 4]	;getting ecx
	mov esi, [ebp + 4]	;getting array
	mov eax, 0
	mov ebx, 0
	l1:
		mov eax, [esi + ebx]
		inc ebx
		;add esi, type Array
		;inc edx
		call Writeint
		call crlf
	loop l1
	mov edx, offset SUM_mess
	call writestring
	call Writeint
		call crlf
	pop ebp
	ret 4	
	;ret
array_SUM endp
end main