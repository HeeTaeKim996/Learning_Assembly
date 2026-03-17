.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	

	call SpeakEIP1


	INVOKE ExitProcess, 0
main ENDP


SpeakEIP1 PROC
	pop eax
	call DumpRegs
	push eax

	call SpeakEIP2

	ret
SpeakEIP1 ENDP


SpeakEIP2 PROC
	pop eax
	call DumpRegs
	push eax

	call SpeakEIP3

	ret
SpeakEIP2 ENDP

SpeakEIP3 PROC
	pop eax
	call DumpRegs
	push eax

	ret
SpeakEIP3 ENDP


END main