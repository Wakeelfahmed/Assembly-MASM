include	irvine32.inc
.data
Enter_Numbers BYTE "Enter 10 numbers", 0
Enter_Number BYTE "Enter number: ", 0
Display_array BYTE 10,"Values in array are: ", 0
array SDWORD 10 DUP (?)
SUM BYTE 10,"Sum of all integers is: ", 0

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
	mov edx, offset Display_array
	call writeString
	mov edx, 0	;SUM
	l2:
		mov eax, array[ebx]
		add edx, eax
		call WriteInt
		mov al, 9	;tab
		call writechar
		add ebx, type array
	loop l2
	xchg edx, ebx
	mov edx, offset SUM
	call WriteString
	mov  eax, ebx
	call WriteInt
exit
main endp
end main
