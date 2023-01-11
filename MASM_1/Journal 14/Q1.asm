INCLUDE Irvine32.inc
.data
num1 DWORD ?
num2 DWORD ?
num3 DWORD ?
num4 DWORD ?
msg1 byte "Enter the Multiplicant : ",0
msg2 byte "Enter the Multiplier : ",0
.code
main PROC
    mov edx,offset msg1
    call writestring
    call readint
    mov num1,eax
    mov edx,offset msg2
    call writestring
    call readint
    mov num2,eax
    mov eax, num1     ; move the value of num1 into EAX
    mov ecx, num2     ; move the value of num2 into EBX
    mov ebx,0

    mul_loop:
        add ebx, eax      ; double EAX (equivalent to EAX = EAX * 2)
        dec ecx           ; decrement EBX (equivalent to EBX = EBX - 1)
        cmp ecx, 0        ; compare EBX to 0
    jne mul_loop      ; if EBX is not 0, jump to mul_loop
    mov eax,ebx
    call crlf
    call writedec  
    exit
main ENDP
END main
