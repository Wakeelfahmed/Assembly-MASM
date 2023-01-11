include	irvine32.inc
.data	
Enter_Number BYTE "Enter number: ",0
Addition BYTE "Addition is :", 0
Subtration BYTE 10, "Subtration is :", 0
num1 DWORD ?
num2 DWORD ?
.code
main proc
	mov edx, offset Enter_Number
	call writestring
	call ReadInt
	mov num1, eax
	call writestring
	call ReadInt
	mov num2, eax
	mov edx, offset Addition
	call writestring
	mov ebx, num1
	add eax, ebx
	call WriteInt
	mov edx, offset Subtration
	call writestring
	mov eax, num1
	mov ebx, num2
	sub eax, ebx
	call WriteInt
exit
main endp
end main