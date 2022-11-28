INCLUDE irvine32.inc
.data
    prompt BYTE "Enter HEC num:", 0
    binary BYTE "binary is ", 0
    HEX BYTE "HEX is ", 0
    Sum BYTE "*******Result*******",0Ah,"SUM:", 0
    num1 DWORD  ?
    num2 DWORD  ?
    bVal BYTE ?
    wVal WORD ?
    dVal DWORD ?
    dVal2 DWORD ? 
    myArray DWORD 11,12,13,14,15
    Bytel BYTE 10,20,30,"40array"
.code
main PROC
mov al,00000110b 
cmp al,00000101b ; CF= ? ZF= ? SF= ? 
call dumpregs
    mov eax , lengthof bytel
    call writeInt
    mov esi, OFFSET bVal ; ESI = 00404000
    add esi,esi
    mov esi, OFFSET wVal ; ESI = 00404001
    mov esi, OFFSET dVal ; ESI = 00404003
    mov esi, OFFSET dVal2 ; ESI = 00404007
    mov esi,0
    mov eax,0
    mov esi, 3 * TYPE myArray
    ;mov esi, Type myArray
    ;add esi, Type myArray
    ;add esi, Type myArray
    mov eax, myArray[esi]
    call WriteInt
    call DumpRegs



    mov edx, offset prompt 
    call writeString
    call ReadHex   
    mov [num1], eax
    mov edx, offset binary
    call writeString
    call writeBin
    call crlf
    mov edx, offset prompt 
    call writeString
    call ReadHex
    mov edx, offset binary 
    call writeString
    mov [num2], eax
    call writeBin
    add eax, [num1]
    call crlf
    mov edx, offset Sum
    call writeString
    call crlf
    mov edx, offset binary 
    call writeString
    call WriteBin
    call crlf
        mov edx, offset HEX 
    call writeString
    call WriteHex

    ;call dumpregs
exit
main endp
end main