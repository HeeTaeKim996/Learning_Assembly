.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
Crlf PROTO


.code
main PROC
	mov eax, 0

	mov al, 7
	mov bl, 9

	mul bl

	call DumpRegs	; al == 63 == 3Fh

	aam				; Set AL to Unpacked BCD. AH == 06, AL == 03
	; бр AAM
	;	- Similar With DIV 10 -> AH == Reminent, AL == Quotient
	;	- AAM Is Simialr With DIV 10 -> Switch AH, AL


	call DumpRegs


	call Crlf
	call Crlf
	call Crlf



	mov eax, 0307h		;	AX == 0307h
	call DumpRegs

	aad					;	AH == 0, AL == 37 == 25h
	; бр AAD
	;	- Reverse Of AM. Unpacked BCD To Hex. 
	;	- AL = AH * 10 + AL. 


	mov bl, 5
	div bl

	call DumpRegs		; AX == 2 (Reminent), AL == 7 (Quotient)





	INVOKE ExitProcess, 0
main ENDP
END main