Include Irvine32.inc
.data
var1 DWORD ?
var2 DWORD ?
var3 DWORD ?
var4 DWORD ?
ans_mess BYTE "Var4 is:" ,0
.code
main PROC
	push 11
	push 2
	push 3
	call FunCPLUS
	mov edx, offset ans_mess
	call writestring
	call WriteDec
exit
MAIN endp

FunCPLUS PROC 
	push ebp
	mov ebp, esp
	mov eax, [ebp+ 16]	;11
	mov var1, eax
	;call Writeint
	;call crlf
	mov ebx, [ebp+ 12]	;2
	mov var2, ebx
	add eax, ebx
	mov var4, eax	;var4 = 11 + 2	= 13
	mov ecx, [ebp + 8]	;3
	mov var3, ecx
	sub eax, ecx		;var4 = var4 - var3 (3) = 10
	mov var4, eax
	call writeint
	mov eax, var1
	cmp var4, eax
	JNA skip
	mov var4, 10
	skip:

	cmp var4, ebx
	JNB skip2
	mov var4, 30
	skip2:
	mov eax, var4
	call crlf
	;call crlf
	;;call WriteInt		var4 is 10
	pop ebp
	ret 12
exit
FunCPLUS endp
END main
