include Irvine32.inc
.data
Input_Prompt BYTE "Enter String:", 0
Max_Length_input BYTE "Enter max length to read:", 0
Rejected_mess BYTE "Rejected !", 0
User_Entered_str BYTE "Your complete String is:", 0
USER_STR BYTE ?
.code
main PROC
	mov edx, offset Max_Length_input	;ask for max length
	call WriteString
	call Readint
	mov ecx, eax
	
	mov esi, offset USER_STR ;passing offset of storage
	call String_Input
	ret
main endp

String_Input PROC
	mov ebx, 0
	mov edx, offset Input_Prompt ;ask for input
	l1:
		call WriteString
		call Readchar
		call writechar
		call crlf
		cmp	al, 'a'
		JA L2
		cmp	al, 'z'
		JB L2
		L2:
		cmp	al, 'A'
		JA break
		JB Reject
		cmp	al, 'Z'
		JB break
		JA Reject
		break:
		mov [esi+ebx], al	;filling chars in the storage
		inc ebx
	loop l1
	mov edx, offset User_Entered_str
	call writestring
	mov edx, offset USER_STR	;displaying final data in storage
	call writestring
	call crlf
	ret 

	reject:
 	mov edx, offset Rejected_mess
	call crlf
	call writestring
	ret 
String_Input endp
exit
end main