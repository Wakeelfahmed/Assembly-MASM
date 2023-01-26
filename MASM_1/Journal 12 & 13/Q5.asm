include Irvine32.inc
.data
String_ToggleCase BYTE "ToggLE StRINg CaSE",0Ah,0dh,0
.code
main PROC
	mov edx, offset String_ToggleCase
	call writestring
	mov ecx, lengthof String_ToggleCase
	mov ebx, 0
	l1:
		mov al, String_ToggleCase[ebx]
		cmp al, 'A'
		JB skip
		cmp al, 'Z'
		JA skip
		JMP TO_LowerCase	;TO_LowerCase
		skip:

		cmp al, 'a'
		JB skip1
		cmp al, 'z'
		JA skip1
		JMP TO_UPPERCASE	;TO_UPPERCASE
		skip1:
		JMP Continue	;skip spaces or other chars
			
			TO_LowerCase:
			or byte ptr String_ToggleCase[ebx], 00100000b 
			;and byte ptr String_ToggleCase[ebx], 11011111b 
			JMP Continue
			TO_UPPERCASE:
			and byte ptr String_ToggleCase[ebx], 11011111b 
			;or byte ptr String_ToggleCase[ebx], 00100000b 
			JMP Continue
		Continue:
		inc ebx
	loop l1

	mov edx, offset String_ToggleCase
	call writeString
exit
main endp
end main