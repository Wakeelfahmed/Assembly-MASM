Include Irvine32.inc
.data
mess BYTE "Enter a Number:"
.code
main PROC
mov edx, offset mess
	call writestring
	call readInt
	call writeInt
	call crlf
	XCHG eax, ecx
	call writestring
	call readInt
	call crlf
	call crlf
	call writeInt
	call crlf
	XCHG eax, ecx
	call writeInt
exit
main endp
end main
