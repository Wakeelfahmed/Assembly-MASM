Include irvine32.inc
.data
msg byte "The index of the row you want to print: ",0 
msg3 byte "The number is: ",0
array2D byte 50 dup(?) 
Rows = 5
Columns = 4
.code 
main proc
	mov ebx,offset array2D 
	mov ch,Rows
	L1:
		mov cl,Columns 
		mov esi,0
		L2:
			call readchar 
			mov [ebx+esi],al 
			call writechar
			add esi,type array2D 
			dec cl
		JNZ L2
		add ebx,Columns 
		call crlf
		dec ch 
	JNZ L1
	call crlf
	mov edx,offset msg 
	call writestring 
	mov eax,0
	call readint 
	mov dl,Columns 
	mul dl
	mov esi,offset array2D 
	add esi,eax
	mov edx,offset msg3 
	call writestring 
	mov ecx,Columns 
	output:
		mov al,[esi] 
		call writechar 
		inc esi
	loop output
 
call crlf 
exit
main endp
end main
