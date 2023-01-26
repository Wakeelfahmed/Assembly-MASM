Include Irvine32.inc
.data
arr1 DWORD 1,2,3,4,5,6,7,8
arr2 DWORD 9,10,11,12,13,14,15,16
result DWORD sizeof arr1 DUP(?)
rowcount DWORD 0
colcount DWORD 0
.code
main proc
	L1:
		mov edx,0 ; initialize result
		mov eax,[arr1+4*rowcount+4*colcount]; getting value from first array(YE DISP ADDRESSING MODE HAY LECTURES ME HAY 2D ARRAY k)
		shl eax,2 ; multiplies by 4
		mul[arr2+4*rowcount+4*colcount]; arr2 ka pehla element multiply hogya arr1 k first se
											;"RESULT MULTIPLICATION KA EAX ME STORE HOGYA"
		add edx,eax
		mov[result+4*rowcount+4*colcount], edx; Storing result in result arr
		inc colcount;
		cmp colcount,2 ; k last column hay k ni
	jl L1 ; agr 2 ni he tou ye step repeat hoga
		mov colcount,0 ;qk hr row k column ko access krna hay
		inc rowcount
		cmp rowcount,2
	jl L1
	call DumpRegs; to show final result(marzi hay agr likhna h tou)
exit