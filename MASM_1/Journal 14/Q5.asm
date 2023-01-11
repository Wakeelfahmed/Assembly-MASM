INCLUDE Irvine32.inc
.data
.code
main PROC
    invoke addtwo, 12, 12 
    call writeint
    exit
main ENDP
addtwo PROC, num1:DWORD, num2:DWORD
    mov eax, num1    ; move the value of num1 into EAX
    add eax, num2    ; add the value of num2 to EAX
    ret                ; return
addtwo ENDP
END main
