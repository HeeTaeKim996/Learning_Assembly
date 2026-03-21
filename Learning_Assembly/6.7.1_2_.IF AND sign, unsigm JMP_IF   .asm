.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
Crlf PROTO


.data
dVal DWORD 3

sVal SDWORD -2

.code
main PROC
	mov eax, 4 
	.IF eax > dVal			; TRUE (JBE - Register - Unsigned Val Use UNSIGNED_JMP_IF)
		call DumpRegs
	.ENDIF

	.IF eax > sVal			; TRUE (JLE - Register - Signed Val Use SIGNED_JMP_IF)
		call DumpRegs
	.ENDIF

	mov ebx, -2
	.IF eax > ebx			; FALSE (JBE - Even if ebx is -2. Register - Register Compare Default is Unsigned)
							; So It Regards ebx To Big Unsigned Int
		call DumpRegs
	.ENDIF



	INVOKE ExitProcess, 0
main ENDP
END main