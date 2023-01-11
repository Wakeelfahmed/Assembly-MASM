include Irvine32.inc
.data
String1 BYTE "ABCD", 0
String2 BYTE "ABCDE", 0
equal_mess BYTE " Both strings are equal ", 0
str1_mess BYTE "strings1 ", 0
str2_mess BYTE "strings2 ", 0
greater_string_mess BYTE " is greater than string2 ",0
smaller_string_mess BYTE " is smaller than string2 ",0
.code
main PROC
	
	mov edx, offset str1_mess
	call writestring
	mov edx, offset string1
	call writestring
	;Printing before since these effect the flags for jumps

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
	mov edx, offset string2
	call writestring
	call crlf
exit
main endp
end main