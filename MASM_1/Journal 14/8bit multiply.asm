include irvine32.inc
.data
multiplier DWORD 6
multiplicand DWORD 6
result DWORD ?
.code
main PROC
    mov eax, 0
    mov  ecx, 8
    mov  dl, BYTE PTR [multiplier]
        checkbit: 
        shr  dl, 1
        jnc  skip
            mov al, BYTE PTR [multiplicand]      ; extended addition 
            add [result], al
            mov al, BYTE PTR [multiplicand + 1]
            adc [result + 1], al 
        skip:
        shl  [multiplicand], 1  ;extended shift
        rcl  [multiplicand + 1], 1 
        dec  cl
        jnz checkbit
    call dumpregs
    call writeint
exit
main endp 
end main
