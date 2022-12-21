Include Irvine32.inc
.data
enter1 byte "Enter a String = ",0
enter2 byte "Smaller Alphabets = ",0
org_string BYTE 21 DUP(0)
new_string BYTE 21 DUP(0)
byteCount DWORD ?
.code
main PROC
	mov edx,offset enter1
	call writestring

	mov   edx, OFFSET org_string
	mov   ecx, SIZEOF org_string
	call  ReadString

	mov esi,offset org_string
	mov edi,offset new_string

	mov ecx,lengthof org_string
	mov ebx,0

	l1:
	   mov al,[esi]
	   cmp al,'a'
	   jb next
	   cmp al,'z'
	   ja next

		mov [edi],al
		add edi,type new_string
		next:
		add esi,type new_string

	loop l1

	mov edx,offset enter2
	call writestring
		mov edx,offset new_string
		call writestring
		add edi,type new_string
exit
main ENDP
END main
