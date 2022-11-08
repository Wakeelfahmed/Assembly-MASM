include Irvine32.inc

.data
    num1 sdword -5
    num2 DWORD 6

.code
main PROC
;move edx
    mov eax, num1
    mov ebx, num2
    sub eax,ebx
   ; call num1
    ;call readint
    call DumpRegs
       call WriteHex

    exit
main ENDP
END main


