Include irvine32.inc
.data	
array SDWORD 100, 3122,430,41,51
prompt BYTE  "Sum of above value(s) is :"
.code
main proc
	mov ecx, lengthof array
	mov esi, 0
	mov ebx, 0
	l1:
	mov eax, array[esi]
	call writeInt	
	mov al, 32
	call writechar
	call writechar
	add ebx, array[esi]
	add esi, type array
	loop l1
	call crlf
	mov edx, offset prompt
	call writestring
	mov eax, ebx	
call writeInt	
call crlf
exit
main endp
end main
