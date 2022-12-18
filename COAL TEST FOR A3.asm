TITLE Two-Dimensional Table                (Table2.asm)
; Demonstration of Base-Index-Displacement mode with a
; two-dimensional table. Chapter 4 example.
; Last update: 06/01/2006
INCLUDE Irvine32.inc
.data
Found_mess BYTE "String FOUND!", 0dh,0ah,0
NOT_Found_mess BYTE "String NOT FOUND!", 0dh,0ah,0
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
	TakeINPUT:
	mov edx, offset Enter_Str_Prompt
	call WriteString
	mov edx, offset USER_STR 
	mov ecx, 100
	call Readstring
	mov edx, offset USER_STR
	call WriteString
		mov ecx, RowSize ;* ColSize + 1
	mov ebx, 0
	mov esi, 0
	;l4:
	;mov al, USER_STR[ebx]
	;call writechar
	;inc ebx
	;loop l4
	;call crlf
	mov eax, 0
	mov esi, 0		; column number
	mov check1, 0
	mov  ebx, 0
		l2:
		mov al,tableB[esi]
		mov ah, USER_STR[ebx]
		;xchg al, ah
		;call CRLF
		;call writechar
		;call CRLF
		;xchg al, ah
		;call writechar
		cmp ah, al
		JE skip2
		mov check1 , 1
		skip2:
		cmp al, 0 ;if end of string
		JNE skip1
		cmp check1, 0
		JE FOUND
		mov check1, 0
		mov ebx, 0
		inc esi
		dec ecx
		cmp ecx, 0
		JE NOT_FOUND
		cmp al,0
		JE l2
		skip1:
		inc ebx
		inc esi
		skip3:
	jmp l2
	FOUND:
		mov edx, offset Found_mess
		call CRLF
		call WriteString
	;mov USER_STR, 0
	JMP TakeINPUT
		exit
	NOT_FOUND:
		mov edx, offset NOT_Found_mess
		call CRLF
		call WriteString
	;mov USER_STR, 0
	JMP TakeINPUT
	exit
main ENDP
END main