include Irvine32.inc
.data
    arr DWORD 1, 2, 3, 4, 5 ; array of integers
.code
main Proc
   mov eax, offset arr      ; move the offset of the array into EAX
   mov ecx, 5               ; move the size of the array into ECX
   push eax
   push ecx
   call print_array         ; call the procedure and pass in the array
   ret                      ; return from the procedure
main endp
print_array PROC
    push ebp
    mov ebp, esp
    mov edx, [ebp + 12]     ; move the size of the array into ECX
    mov ecx, [ebp + 8]      ; move the size of the array into ECX
    mov esi, 0              ; initialize a counter at 0
    loop1:
        mov eax, [edx + 4*esi]   ; move the element at the current index into EAX
        call writeint
        add esi, 1          ; increment the counter
    loop loop1              ; jump back to the start of the loop
    pop ebp
    ret 8
print_array endp
end main