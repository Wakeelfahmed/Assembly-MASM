    INCLUDE Irvine32.inc

.data
    num1 DWORD 5
    num2 DWORD 10
    result DWORD 0
    prompt BYTE "The result is: ",0

.code
main proc
    mov eax, num1
    mov ebx, num2
    xor eax, eax    ; clear eax register

next_bit:
    and ebx, 1     ; check if the least significant bit of ebx is set
    jz no_add       ; if not, skip the next instruction
    add eax, num1    ; add num1 to eax
    jmp next_bit
no_add:
    shl ebx, 1      ; shift ebx left by 1 bit
    cmp ebx, 0      ; check if ebx is zero
    jnz next_bit    ; if not, go back to next_bit
    mov result, eax
    call WriteString
    mov edx, offset prompt
    call WriteString
    call WriteDec
    mov eax, result
    call Crlf
    exit
main endp
end main
