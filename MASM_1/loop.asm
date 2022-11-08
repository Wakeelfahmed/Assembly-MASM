Include Irvine32.inc

.data
i DWORD 0
str1 BYTE "*",0
.code
main PROC
mov eax,i
mov ecx,5
L1:
inc i
push ecx
mov ecx,i
L2:
mov edx,offset str1
call writestring
loop L2
call crlf
pop(ecx)
loop L1
      call dumpRegs
      exit

main ENDP
END main