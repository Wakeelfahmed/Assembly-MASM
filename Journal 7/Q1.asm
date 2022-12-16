include	irvine32.inc
.data
;unsigned_Number	DWORD 2
.code
main PROC
	mov ax, -2
	call WriteBin
	movzx eax, bx
	call writeInt
exit
main endp
end main