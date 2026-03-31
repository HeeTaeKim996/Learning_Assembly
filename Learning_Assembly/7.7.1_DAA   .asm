.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO


; ¡Ø Packed BCD is Saving Decimal ( 0 ~ 9 ) To Nibble(4-Bits). EX) AL == 32h -> Regards 32 (decimal)

.code
main PROC
	mov eax, 09h
	add al, 18h

	PUSHFD

	call WriteInt	; 33h 
	call DumpRegs	; 21h

	POPFD

	daa

	call DumpRegs	; 27h







	mov eax, 03h
	add al, 98h

	PUSHFD

	call WriteInt	; 155
	call DumpRegs	; 9Bh

	POPFD

	daa

	call DumpRegs	; 01h, CF == 1 -> 101



	; DAA : Regards ADD Result is Packed BCD. 
	;   ( 09h + 18h == 27h, 03h + 98h == 101h)
	;	 Under Phase Are After ADD
	;	- Phase 1 : If Low 4-Bits > 9 || AX == 1, AL += 06h
	;		EX). 09h + 18h == 21h. AX == 1 -> 21h + 06h == 27h
	;	- Phase 2 : If Upper 4Bits > 9 || CF == 1, AL += 60h
	;		EX). 03h + 98h == 9Bh -> Phase 1 -> A1h -> Phase2 -> 01h (CF == 1) == 101




	INVOKE ExitProcess, 0
main ENDP
END main