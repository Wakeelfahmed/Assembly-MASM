include Irvine32.inc
.data
    arr DWORD 1, 2, 3, 4, 5 ; array of integers
.code
main Proc
   mov eax, offset arr  ; move the offset of the array into EAX
   mov ecx, 5           ; move the size of the array into ECX
   push eax
   push ecx
   call print_array     ; call the procedure and pass in the array
   ret                  ; return from the procedure
main endp
print_array PROC
    push ebp
    mov ebp, esp
    mov edx, eax        ; move the starting address of the array into EDX
    mov eax, [ebp + 4] ; move the size of the array into ECX
    mov ecx, [ebp + 8] ; move the size of the array into ECX
    mov eax, ecx
    call writeint
    ;0call readint
    mov esi, 0           ; initialize a counter at 0
    mov ebx, ecx
loop1:
    
    ;cmp ebx, ecx         ; compare the counter to the size of the array
    ;jz done              ; if equal, exit the loop
    mov eax, [edx + 4*esi]   ; move the element at the current index into EAX
    call writeint
    add esi, 1           ; increment the counter
    loop loop1         ; jump back to the start of the loop


done:
    pop ebp
    ret 8
print_array endp
end main