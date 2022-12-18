INCLUDE irvine32.inc
.data
a BYTE "Enter word : ", 0 
b BYTE "string Found", 0
d BYTE "string not Found",0
array BYTE "absdef",0ah,0dh
BYTE "PEPSII",0ah,0dh
BYTE "TABLES",0ah,0dh 
BYTE "TABLET",0ah,0dh
BYTE "IPHONE",0ah,0dh 
BYTE "POINTS",0ah,0dh
BYTE "SIMILA",0ah,0dh 
BYTE "HARRYS",0ah,0dh
Rows = 8
Columns = 6 
ustr BYTE ?, 0ah, 0dh
.code
main proc
	mov edx, offset a
	call writestring 
	mov edx, offset ustr
	mov ecx, 8
	call ReadString
	mov edx, offset ustr
	call writestring
	mov ebx, offset array
	mov ch, rows
	L1:
		mov cl, columns
		mov esi, 0
		L2: 
			mov al, [ebx + esi]
			mov ah, [edx + esi]
			inc esi 
			cmp al, ah
			JNE X
			stc
			dec cl
		JNZ L2
		cmp al, ah
		JNE X
		stc
		dec cl
		JNZ L2
		jmp next
		X:
		clc
		add ebx, Rows
		dec ch
	JNZ L1
	next:
	JC Z
	mov edx, offset d
	call crlf 
	call writestring
	JMP e
	Z:
	mov edx, offset b 
	call crlf
	call writestring
	e:
exit
main endp
end main