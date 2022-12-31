include Irvine32.inc
.data
y SBYTE	0
i BYTE 0
get_num_input BYTE "Enter Number:", 0
.code
main PROC
	mov edx, offset get_num_input
	call WriteString
	call Readint
	mov y, al
	mov ecx, 5
	l1:
		cmp i, 3
		JNBE skip
		mov bl, y
		add bl, 2
		mov y, bl
		skip:
		cmp y, 5
		JNE skip1
		mov bl, y
		add bl, 4
		mov y, bl
		skip1:
		inc i
	loop l1
	movzx ax, y
	call writeint
exit
main endp
end main