Include Irvine32.inc
.data
array2D DWORD 1, 1, 1,1,1,1,1,1,1,1
		DWORD 2, 2, 2,2,2,2,2,2,2,2
		DWORD 3, 3, 3,3,3,3,3,3,3,3
		DWORD 4, 4, 4,4,4,4,4,4,4,4
		DWORD 5, 5, 5,5,5,5,5,5,5,5
		DWORD 6, 6, 6,6,6,6,6,6,6,6
		DWORD 7, 7, 7,7,7,7,7,7,7,7
		DWORD 8, 8, 8,8,8,8,8,8,8,8
		DWORD 9, 9, 9,9,9,9,9,9,9,9
		DWORD 0, 0, 0,0,0,0,0,0,0,0
Rows = 10
Columns = 10
.code
main PROC
	mov ebx , offset array2D
	mov ch, Rows
	call print
exit
MAIN endp

print PROC 
L2:
mov cl , Columns 
mov esi , 0
mov edx,0 
L1:
mov eax, [ebx+esi] 
	call writedec
	add edx,eax
	mov al, ' '
	call writechar
	add esi, 4
	dec cl
	JNZ L1
	mov al , ' '
	call writechar
	mov eax,edx
	call writeint
	call crlf
	mov eax,Columns
	mov dl,4
	mul dl
	add ebx,eax
	dec ch
	JNZ L2
ret 
exit
print endp
END main
