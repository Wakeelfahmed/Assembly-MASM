INCLUDE Irvine32.inc
.data

maxPrimes	DWORD	?				;input
max		DWORD	300
min		DWORD	1
primeCount	DWORD	0				;number of primes printed
counter		BYTE	10
numToCk		DWORD	2				;number to check if prime
Num_tocomp	DWORD	2
prevPrim	DWORD	1	



greeting	BYTE "welcome",0
greeting2	BYTE "Please enter a number between 1 and 300: ",0
oops		BYTE "That number was not between 1 and 300, please try again: ",0
three		BYTE "   ",0
goodBye		BYTE "end",0
star		BYTE "*",0

.code

;=======================================================
;MODULARIZED MAIN PROCEDURE 
;=======================================================
main PROC
							
call	greet				;procedure to greet the user
		
call	Input				;Procedure to gets input from the user

mov	maxPrimes, eax		;move the "within limits" number to its variable

call	getPrimes			;Procedure gets and prints primes to screen

call	laterDude			;says goodybe to the user

	exit	; exit to operating system
main ENDP


;=======================================================
;PROCEDURE TO CALCULATE PRIMES
; - this procedure loops through each number between 1
;	and the number needed to get to the amount of primes 
;	the user wants to see. It divides the number we are 
;	currently checking by every number starting at 2. If 
;	the number can be divided by anything other than itself
;	and 1, it will not print.
;=======================================================

getPrimes PROC

primeLoop:					;-------Top of loop--------------

	mov	edx, 0				;divide number we are checking
	mov	eax, numToCk
	mov	ecx, num_tocomp
	div	ecx

	cmp	edx, 0				;if evenly devided, check if prime
	je	checkQuo
								;else 
	inc	num_tocomp
	jmp	primeLoop			;back to top if not evenly divisable


			checkQuo:
				cmp	eax, 1				;remainder is 0, if quotent == 1, its prime
				je	printPrimes
				jmp	notPrime			;else, its not prime


			printPrimes:					;prints prime
				mov	eax, numToCk
				call	addAster			
				call	writeDec			
				call	AddSpace
				dec	maxPrimes
				mov	ecx, maxPrimes

			notPrime:						;moves on to check next number
				mov     eax, 2
				mov	num_tocomp, eax
				inc	numToCk


	loop	primeLoop		;_______back to top of loop_______

	ret
	
getPrimes ENDP


;=======================================================
;PROCEDURE TO INPUT AN ASTERISK
; - This determines if the prime numbers are twins and
;	inputs a asterisk next to the higher number. This also 
;	updates the "previous prime" to the currrent number
;=======================================================

addAster Proc
sub	eax, prevPrim
cmp	eax, 2
je	aster
mov	eax, numToCk
mov	prevPrim, eax
ret

	aster: 
	mov	edx, offset star
	call	writeString
	mov	eax, numToCk
	mov	prevPrim, eax
	ret

addAster ENDP

;=======================================================
;PROCEDURE TO GREET THE USER
;=======================================================
greet PROC

mov	edx, offset greeting
call	writeString
call	crLf
mov	edx, offset greeting2
call	writestring
call	crlf
ret

greet ENDP
;##########


;=======================================================
;PROCEDURE TO SAY GOODBYE TO THE USER
;=======================================================
laterDude PROC

call	crlf				;Says goodbye
call	crLf
mov	edx, offset goodBye
call	writeString
call	crLf	

ret

laterDude ENDP
;##########

;=======================================================
;PROCEDURE TO GET INPUT FROM THE USER
; - this procedure gets and valitates the user input
;	which is set by the min and max variables 
;=======================================================

Input PROC			

top:				;called until input is correct
	call 	ReadInt
	cmp 	eax, max
	jg	badInput
	cmp 	eax, min
	jl 	badInput
	ret				;returns if number is within limits


						
	badInput:		;if the number is outside of the limits
	 mov 	edx, offset oops
	 call 	WriteString
	 call 	crlf
	 jmp 	top

Input ENDP
;##########


;=======================================================
;PROCEDURE TO PRINT THE RESULTS TO THE SCREEN
; - this prints the data 10 items per line with 3 spaces in between
;=======================================================

AddSpace PROC
					;procedure determines the space needed
dec	counter		;keeps track of the numbers per line
mov	cl, counter
cmp	cl, 0
jne	threeSpace
je	NewLine
ret

	threeSpace:		;adds 5 spaces
	mov	edx, offset three
	call	writeString
	ret

	NewLine:		;starts a new line
	call	crLf
	mov	counter, 10
	ret

AddSpace ENDP
;###########

END main