.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO


.code
main PROC
	mov eax, 35h
	sub al, 18h

	PUSHFD

	call WriteInt	; 29
	call DumpRegs	; 1Dh

	POPFD

	das

	call DumpRegs	; 17h






	mov eax, 01h
	sub al, 09h


	PUSHFD

	call WriteInt	; 248
	call DumpRegs	; F8

	POPFD

	das

	call DumpRegs	; 92






	; бс DAS
	;	- Similar with DAA.
	;	- Under Are After Sub
	;	- Phase1 : If Low Nibble > 9 || AC == 1 (Low Borrow), AL -= 06h
	;		EX) 35h - 18h == 1Dh, D > 9 -> AL -= 06h -> AL == 17h
	;

	;	- Phase2 : If High Nibble > 9 || CF == 1(High Borrow), AL -= 60h, CF == 1
	;		EX) 01h - 09h == F8h -> Phase1 -> F2h -> Phase2 -> 92h (CF == 1) == -8





	INVOKE ExitProcess, 0
main ENDP
END main