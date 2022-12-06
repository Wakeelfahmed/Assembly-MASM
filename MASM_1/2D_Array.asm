INCLUDE irvine32.inc
.data
myarray DWORD 1, 2, 3
Rowsize = ($ - myarray)
DWORD 3,5,6
DWORD 7,8,9
prompt BYTE "New Row/Col"
Rowsize1 DWORD 3
msg byte "not digit",0
val1 Byte 9
.code
main proc
	XOR eax, eax
	;CALL DumpRegs
	;movzx eax, val1
	;cmp al, val1
	;mov al, val1
	;call IsDigit
	mov al,val1
	cmp al,0
	jae digitvalid
	call dumpRegs
	jb digitunvalid
	cmp al,9
	jbe digitvalid
	ja digitunvalid
	call dumpRegs
	call exitss
	digitvalid:
	call DumpRegs
	call writeint
	;ret
	digitunvalid:
	mov edx, offset msg
	call writestring
	;ret
	
	call DumpRegs
exitss:
	call DumpRegs
exit
main endp
end main