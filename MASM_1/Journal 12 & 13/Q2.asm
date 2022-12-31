include Irvine32.inc
.data
String1 BYTE "ABCDF",0Ah,0dh,0
String2 BYTE "ABCDE",0Ah,0dh,0
equal_mess BYTE "Both strings are equal !",0Ah,0dh,0
greater_string_mess BYTE "strings1 is greater than string2 !",0Ah,0dh,0
smaller_string_mess BYTE "strings1 is smaller than string2 !",0Ah,0dh,0
.code
main PROC
	mov ecx, lengthof String1
	mov esi, offset String1
	mov edi, offset String2
	cld		;left to right or auto-increment  mode
	repz cmpsb
	JZ Equal
	JB greater
	JA smaller 
	Equal:
	mov edx, offset equal_mess
	JMP Skip

	smaller:
	mov edx, offset greater_string_mess
	JMP Skip

	greater:
	mov edx, offset smaller_string_mess
	JMP Skip
	Skip:
	call Writestring
exit
main endp
end main