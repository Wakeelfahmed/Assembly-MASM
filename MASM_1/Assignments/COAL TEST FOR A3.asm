INCLUDE Irvine32.inc
.data
Found_mess BYTE "String FOUND!", 0dh,0ah,0
NOT_Found_mess BYTE "String NOT Found!", 0dh,0ah,0
RowSize = 8
iterator DWORD 0
check1 BYTE 0
Enter_Str_Prompt BYTE "Enter String :",0
tableB  BYTE  "COAL", 0
        BYTE  "TOSHIBA", 0
        BYTE  "ASDFG", 0
        BYTE  "UNIVERSITY", 0
        BYTE  "APPLE", 0
        BYTE  "ASSIGNEMT", 0
        BYTE  "Hello World", 0
        BYTE  "I love Programming", 0
USER_STR BYTE ?
.code
main PROC
	TakeINPUT:	;as a while loop, (keeps taking new strings)
		mov edx, offset Enter_Str_Prompt
		call WriteString
		mov edx, offset USER_STR 
		mov ecx, 100
		call Readstring
		mov edx, offset USER_STR
		mov ecx, RowSize
		mov ebx, 0
		mov eax, 0
		mov esi, 0
		mov check1, 0
		mov  ebx, 0
		l2:
			mov al,tableB[esi]
			mov ah, USER_STR[ebx]
			cmp ah, al
			JE skip2
			mov check1 , 1	;if mismatch found check = 1
			skip2:
			cmp al, 0	;if end of string reached
			JNE skip1
			cmp check1, 0	;Check if no mismatch found in string
			JE FOUND	;if no mismatch found String matches
			mov check1, 0
			mov ebx, 0
			inc esi
			dec ecx
			cmp ecx, 0		;check if Array exhausted
			JE NOT_FOUND  ;if array exhausted, that mean string does not exit in list
			JE l2
			skip1:
			inc ebx
			inc esi
		jmp l2
		FOUND:
			mov edx, offset Found_mess
			call WriteString
			call CRLF
		JMP TakeINPUT
		NOT_FOUND:
			mov edx, offset NOT_Found_mess
			call WriteString
			call CRLF
		JMP TakeINPUT
	exit
main ENDP
END main