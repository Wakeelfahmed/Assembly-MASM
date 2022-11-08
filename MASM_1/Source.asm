;TITLE Add and Subtract          (AddSub.asm)

; This program adds and subtracts 32-bit integers.

INCLUDE Irvine32.inc

.data
i DWORD 0
str1 BYTE "*",0

    num BYTE 126d
    num2 SBYTE -26d
    num3 WORD   692Ah
    num4 SWORD -32789
    num5 DWORD 12345678h
    num6 SDWORD -2147483648

.code
main PROC

;    mov al, num
;    call DumpRegs
;
;    mov ah, num2
;    mov cx, num3
;    mov dx, num4
;    mov eax, num5
;    mov ebx, num6


mov eax,i
mov ecx, 5
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
call DumpRegs
exit 
main ENDP
END main