.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteBin PROTO
Crlf PROTO


.code
main PROC
	mov eax, 0EA84B235h


	call WriteBin
	call Crlf
	

	; SHL, SHR : IN : 0, OUT : DUMP
	; SHL can be used for * 2^n, SHR can be used for / 2^n
	shl eax, 1		; << 1
	call WriteBin
	call Crlf

	shr eax, 1		; >> 1
	call WriteBin
	call Crlf

	

	call Crlf
	; ¡Ø SAL == SHL(Exactly Same). Fill New Bit with 0
	;	SAR != SHR. (Almost Same). Fill New Bit With Same with Max Bit
	;	SAR is Suit for Assigned Division

	mov eax, 80h
	sal eax, 24
	call WriteBin
	call Crlf

	sar eax, 16			; Upper Bit was 1. So Fill New Bit's with 1
	call WriteBin
	call Crlf




	INVOKE ExitProcess, 0
main ENDP
END main