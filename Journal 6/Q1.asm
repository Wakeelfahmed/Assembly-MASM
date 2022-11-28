include	Irvine32.inc
.data
mess BYTE "Random # from 0 to 50"

.code
main PROC
	mov edx, offset mess
	call writeString
	mov ecx	, 10
	mov eax,50
	;call Randomize
	l1:
		call crlf
		mov eax,50
		call RandomRange
		call writeInt

	loop l1
	exit
main endp
end main