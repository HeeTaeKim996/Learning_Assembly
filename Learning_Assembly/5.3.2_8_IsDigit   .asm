.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
IsDigit PROTO
DumpRegs PROTO

.code
main PROC
	mov al, '2'		; If al is DigitNumber's ASCII, Set ZeroFlag to 1. otherise, Set zeroFlag to 0
	call IsDigit	; 1
	call DumpRegs

	mov al, 'c'
	call IsDigit	; 0
	call DumpRegs


	INVOKE ExitProcess, 0
main ENDP
END main