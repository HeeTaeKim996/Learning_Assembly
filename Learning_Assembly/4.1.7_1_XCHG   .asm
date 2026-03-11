
.386
.model flat, stdcall

.stack
includelib Irvine32.lib
ExitProcess PROTO, dwExitCode:DWORD
WriteHex PROTO
Crlf PROTO


.code
main PROC
	mov eax, 0AABBh
	call WriteHex
	call Crlf

	xchg ah, al				
	; exchange two operand. at least one operand must be register

	call WriteHex 
	call Crlf

	INVOKE ExitProcess, 0
main ENDP
END main


