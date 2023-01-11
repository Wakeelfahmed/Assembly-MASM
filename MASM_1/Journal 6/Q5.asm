Include	irvine32.inc
.data
a SDWORD ?
b SDWORD ?
mess BYTE "Enter Number for a + b - (b-a) + a", 0Dh
messa BYTE "Enter a :", 0Dh
messb BYTE "Enter b :", 0Dh
.code
main proc
mov edx, offset mess
call writestring
call crlf
mov edx, offset messa
call writestring
call readInt
mov a, eax
mov edx, offset messb
call writestring
call readInt
mov b, eax
sub eax, a
NEG eax
add eax, a
call crlf
mov ecx, b
add eax, b
call crlf
add eax, a
call writeInt
exit
main endp
end main
