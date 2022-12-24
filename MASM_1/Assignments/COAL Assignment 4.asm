include Irvine32.inc
.data
var1 DWORD	?
var2 DWORD	?
var4 DWORD	?
a DWORD	?
.code
main PROC
	push 12
	push 10	
	call subtr		;int a = subtr(12, 10)
	mov a, eax
	call WriteDec ;Displaying unsigned what's in Accumulator
main endp
exit
subtr PROC
	push ebp
	mov ebp, esp
	mov ecx, [ebp + 12]	;1st parameter (x)
	mov edx, [ebp + 8]	;2nd parameter (y)
	mov var1, 10
	mov var2, 50
	mov eax, var1
	mov ebx, var2
	add eax, ebx
	mov var4, eax
	add ecx, edx
	sub eax, ecx
	pop ebp
	ret 8
subtr endp
end main