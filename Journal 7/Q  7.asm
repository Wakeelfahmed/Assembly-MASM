include	irvine32.inc
.data	
Enter_Number BYTE "Enter number: ",0
Comparison_Not BYTE "Both numbers are NOT equal !", 0
Comparison_Equal BYTE "Both numbers are equal !", 0
num1 DWORD ?
num2 DWORD ?
.code
main proc
	mov edx, offset Enter_Number
	call writeString
	call Readint
	mov num1, eax
	call writeString
	call Readint
	mov num2, eax
	mov ebx, num1
	cmp ebx, eax
	JE equal
	mov edx, offset Comparison_Not
	call writeString
	JMP skip
	equal:
	mov edx, offset Comparison_Equal
	call writeString
	skip:


exit
main endp	
end main