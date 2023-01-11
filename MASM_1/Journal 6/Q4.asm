include	Irvine32.inc

.data
mess BYTE "****** Computer Organization & Assembly Language Lab ******"
.code
main PROC
mov eax,50
mov eax, 0

mov edx, offset mess
l1:
call writeString
call crlf
loop l1

exit
main endp
end main