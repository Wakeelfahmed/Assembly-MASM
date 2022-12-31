include Irvine32.inc
.data
n DWORD ?
t1 DWORD ?
t2 DWORD 1
nextTerm DWORD ?
get_num_input BYTE "Enter Number:", 0
i DWORD 1
.code
main PROC
	mov edx, offset get_num_input
	call WriteString
	call Readint
	mov n, eax
	mov ecx, n
	l1:
	cmp i, 1
	JNE skip
	mov eax, t1
	call writeint
	mov al, ','
	call writechar
	JMP Continue
	skip:

	cmp i, 2
	JNE skip1
	mov eax, t2
	call writeint
	mov al, ','
	call writechar
	JMP Continue
	skip1:

	mov ebx, t1
	add ebx, t2
	mov nextTerm, ebx
	mov edx, t2
	mov t1, edx
	mov edx, nextTerm
	mov t2, edx
	mov eax, edx
	call writeint
	mov al, ','
	call writechar
	Continue:
	inc i
	loop l1
exit
main endp
end main