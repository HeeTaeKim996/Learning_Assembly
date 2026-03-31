.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO




.code
main PROC
	mov eax, 0

	mov al, '8'		; 38h
	mov bl, '9'		; 39h
	sub al, bl		; FFh

	aas			
	; бс AAS
	;	- after SUB, if al > 9 || AF == 1, Meaning Minus, 
	;		AL -= 6 ==>> F - 6 == 9, D - 6 == 7, A - 6 == 4
	;		AH -= 1 
	;		CF == AC == 1
	;	ELSE,
	;		CF == AC == 0


	PUSHF			; CF == AC == 1
	or al, 30h		; 39h
	POPF

	call DumpRegs	; AX == FFh, AL == 39h



	INVOKE ExitProcess, 0
main ENDP
END main