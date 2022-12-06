include Irvine32.inc
.data
Prompt BYTE "Unsigned value from 50-180 are:",0
array1 DWORD -20,-1,192,30,49,50,51,60,70,-181,182,1,2,3
array2 DWORD lengthof array1 DUP(?)
.code
main PROC
	mov esi, 0
	mov ecx, lengthof array1
	l1:
		mov ebx, array1[esi]
		mov eax, array1[esi]
		or ebx, 0
		JS Skip
		cmp eax, 180
		JA skip
		mov eax, ebx
		cmp eax, 50
		JB skip
		call writeint
		call DumpRegs
		skip:
		add  esi, type array1
	loop l1
	mov edx, offset Prompt
	call WriteString
	mov esi, 0 
	mov ecx, lengthof array2
	l2:
		mov ebx, array1[esi]
		mov eax, ebx
		cmp eax, 180
		JA skip1
		mov eax, ebx
		cmp eax, 50
		JB skip1
		call WriteInt
		mov al, 9
		call writechar
		skip1:
		add esi, type array2
	loop l2
exit
main endp
end main