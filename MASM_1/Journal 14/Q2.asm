INCLUDE Irvine32.inc
.data
num1 DWORD ?
num2 DWORD ?
num3 DWORD ?
num4 DWORD ?
msg byte "Enter 4 Numbers whose sum is required",0
Input_Mess byte "Enter number : ",0
sum byte "Sum = ",0
.code
main PROC
    mov edx,offset msg
    call writestring
    call crlf
    mov edx,offset Input_Mess
    call writestring
    call readint
    mov num1,eax
    mov edx,offset Input_Mess
    call writestring
    call readint
    mov num2,eax
    mov edx,offset Input_Mess
    call writestring
    call readint
    mov num3,eax
    mov edx,offset Input_Mess
    call writestring
    call readint
    mov num4,eax
    push num4        ; push num4 onto the stack
    push num3        ; push num3 onto the stack
    push num2        ; push num2 onto the stack
    push num1        ; push num1 onto the stack
    mov ecx, 4       ; set ECX to 4 (number of DWORDs to add)
    mov eax, 0       ; clear EAX (to use it as the sum)

    add_loop:
        pop edx          ; pop the top DWORD from the stack into EDX
        add eax, edx     ; add EDX to EAX
    loop add_loop    ; repeat the loop 4 times (as set in ECX)    exit
    mov edx,offset sum
    call writestring
    call writedec
main ENDP
END main
