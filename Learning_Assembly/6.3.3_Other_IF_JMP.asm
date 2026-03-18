.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	mov al, 07Fh
	inc al
	jo L1				; IF OF == 1, JMP

	mov ebx, 0
	call DumpRegs
	L1:


	or al, 80h
	js L2				; IF SF == 1, JMP

	mov ebx, 1
	call DumpRegs
	L2:

	
	mov al, 0h
	cmp al, 0
	jp L3				; IF PF == 1, JMP


	mov ebx, 2
	call DumpRegs
	L3:


	; Other, Just Typing
	; JE	== JZ
	; JNE	== JNZ
	; JCXZ	: Jump If CX == 0
	; JECXZ	: Jump If ECX == 0
	; JA	: Jump If Above ( Regard Two Values are unsigned)
	; JNBE	: Jump If Not Below Or Equal	(Regard Unsigned)
	; JAE	: Jump If Above Or Equal		(Regard Unsigned)
	; JNB	: Jump If Not Below				(Regard unsigned)
	; JB	: Jump If Below					(Regard Unsigned)
	; JNAE	: Jump If not above or equal	(Regard Unsigned)
	; JBE	: Jump If Below or equal		(Regard Unsigned)
	; JNA	: Jump If Not Above				(Regard Unsigned)

	; JG	: Jump If Greater
	; JNLE	: Jump If not less than or equal
	; JGE	: Jump If Greater than or equal
	; JNL	: Jump If not less
	; JL	: Jump If Less
	; JNGE	: Jump if not greater than or equal
	; JLE	: Jump If Less than or Equal
	; JNG	: Jump if not greater



	INVOKE ExitProcess, 0
main ENDP
END main