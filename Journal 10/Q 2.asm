include irvine32.inc
.data

array dword 5, 30, 34, 38, 45, 76, 77, 88, 99, 200
smaller_array dword 10 dup(?)

enter1 byte "Enter a Number = ",0
smallers byte "Smaller or Equal Numbers : ",0
spac byte " ",0

.code
main PROC
mov edx,offset enter1 
call writestring

mov esi, offset array
mov edi, offset smaller_array
mov eax, 0
call readint

mov ebx,0
mov ecx, 10

L1:
cmp [esi], eax
JA big
jmp small

small:

mov edx, [esi]
mov [edi], edx
add edi, type smaller_array
inc ebx

big:

add esi, type array


loop L1
mov ecx, ebx
mov edi,offset smaller_array

mov edx,offset smallers
call writestring

L2:
mov eax, 0
mov eax, [edi]
add edi, type smaller_array
call writeint
mov edx,offset spac
call writestring

loop L2
exit
main endp
end main
