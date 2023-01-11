INCLUDE Irvine32.inc
.data
nums WORD 10, -5, 8, -2, -3
numCount = ($-nums)/2
.code
main PROC
    mov eax, numCount
    mov ebx, offset nums
    push ebx
    push eax
    call SUM
    add esp, 8
    call writedec
    exit
main ENDP
SUM PROC
    push ebp
    mov ebp, esp
    mov ecx, [ebp+8]
    mov esi, [ebp+12]
    mov eax, 0
    mov edx, 0

    add_loop:
        add eax, [esi+edx*2]
        inc edx
    loop add_loop

    mov esp, ebp
    pop ebp
    ret 8
SUM ENDP
END main
