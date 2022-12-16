include	irvine32.inc
.data
Enter_Numbers BYTE "Enter 10 numbers", 0
Enter_Number BYTE "Enter number: ", 0
array SDWORD 10 DUP (?)
.code
main PROC
	mov edx, offset Enter_Numbers
	call writeString
	mov ecx, 10
	mov ebx, 0
	mov edx, offset Enter_Number
	call crlf
	l1:
		call writeString
		call ReadInt
		mov array[ebx], eax
		add ebx, type array
	loop l1

	mov ebx, 0
	mov ecx, 10
	l2:
		mov eax, array[ebx]
		call WriteInt
		mov al, 9	;tab
		call writechar
		add ebx, type array
	loop l2
exit
main endp
end main