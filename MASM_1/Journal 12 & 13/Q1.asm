include Irvine32.inc
.data
Source BYTE "My name is Wakeel Furqan Ahmed",0Ah,0dh,0
Destination BYTE lengthof Source DUP(?)
.code
main PROC
	mov ecx, lengthof Source
	inc ecx
	mov esi, offset source
	mov edi, offset Destination
	cld
	rep movsb
	mov edx, offset Destination
	call writestring
exit
main endp
end main