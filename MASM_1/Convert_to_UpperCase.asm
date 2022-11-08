INCLUDE Irvine32.inc

.data 
array byte"this Is a Mixed Case sentence",0
.code
main proc
mov edx, offset array
call writestring
mov ecx, lengthof array
mov esi, offset array
L1:
;and array[esi], 11011111b
;mov al, array[esi]
;and al, 11011111b
;mov array[esi], al
and byte PTR [esi], 11011111b
inc esi
loop L1
mov edx, offset array
call crlf
mov edx, offset array
call writestring

exit 
main ENDp
end main