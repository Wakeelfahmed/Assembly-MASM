include	irvine32.inc
.data
USERSTRING BYTE "2nd",0
tableW BYTE "first element",0
RowSize = ($ - tableW) 
BYTE "2nd", 0 
BYTE "3rd", 0
BYTE "4th", 0
BYTE "5th", 0
BYTE "6th", 0
BYTE "7th", 0
BYTE "8th", 0
;RowSize DWORD 8
Iterator DWORD 0
ColSize DWORD 8
row_index DWORD 0
column_index = 0
.code
main PROC
	mov ecx, lengthof USERSTRING
	mov esi, offset USERSTRING
	USER_STRING:
		mov ax, BYTE PTR [USERSTRING+Iterator]
		call writechar
		inc Iterator
		;add Iterator, type USERSTRING
	loop USER_STRING
	call crlf
	call crlf

	mov ecx, ColSize
	l1: 
		mov ebx, offset tableW
		mov eax, RowSize		;call WriteInt
		mul row_index	;add ebx, RowSizeW * row_index 
		add ebx, eax
		mov esi, column_index
		l2:
			mov al, [ebx + esi * type tableW]
			
			cmp al, 0
			je skip
			call writechar
			inc esi
		JMP l2
		skip: 
		call crlf
		inc Row_index
	loop l1
	
exit
main endp
end main