INCLUDE irvine32.inc
.data
aName BYTE "This is a string", 0
nameSize = ($ - aName) - 1
.code
main PROC
mov ecx, nameSize
mov esi, 0
L1:
	movzx eax, aName[esi]
	push eax
	inc esi
loop L1
mov ecx, nameSize
mov esi,0
L2:
	pop eax
	mov aName[esi], al
	inc esi
LOOP L2

mov edx, offset aName
call Writestring
call crlf

exit
main endp
end main