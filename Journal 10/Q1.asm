include irvine32.inc
.data

array dword 5, 30, 34, 38, 45, 76, 77, 88, 99, 200
greater_array dword 10 dup(?)

enter1 byte "Enter a Number = ",0
greaters byte "Greater or Equal Numbers : ",0
spac byte " ",0

.code
main PROC
mov edx,offset enter1 
call writestring

mov esi, offset array
mov edi, offset greater_array
mov eax, 0
call readint

mov ebx,0
mov ecx, 10

L1:
cmp [esi], eax
JA big
jmp small

big:
mov edx, [esi]
mov [edi], edx
add edi, type greater_array
inc ebx

small:
add esi, type array

loop L1
mov ecx, ebx
mov edi,offset greater_array

mov edx,offset greaters
call writestring

L2:
mov eax, 0
mov eax, [edi]
add edi, type greater_array
call writeint
mov edx,offset spac
call writestring

loop L2
exit
main endp
end main
