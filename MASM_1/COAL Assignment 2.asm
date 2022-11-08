include Irvine32.inc
.data
array1 SDWORD - 1, -2, 3, 9, -8, 8, 6, -5, -7
array_Unsigned SDWORD SIZEOF array1 DUP(0)
.code
main proc
mov ecx, lengthof array1
mov esi, 0
mov ebx, 0
mov edx, 0
l1 :
	mov eax, array1[esi]
	or eax, 0	;to set/clear sign flag depanding on Value
	JS skip
		call writeInt	;block executed if sign flag set
		call DumpRegs
		mov array_Unsigned[ebx], eax	;copied to resultant array
		add ebx, Type array1
		inc edx						;count of unsigned values moved to resultant array
	skip :
	add esi, Type array1
loop l1

call crlf
call crlf
call crlf

mov ecx, edx	;loop to be exexuted
mov esi, 0
l2 :
mov eax, array_Unsigned[esi]
call writeInt
call DumpRegs
; inc esi
add esi, Type array1

loop l2

exit
main endp
end main