.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteString PROTO
Crlf PROTO


.data
Msg BYTE "Loop", 0


.code
main PROC
	mov eax, 3
	mov edx, OFFSET Msg


	; WHILE( ~ ) Is Also Just Combintation Of IF_JMPs
	

	_WHILE:

	cmp eax, 1
	jbe _END_WHILE

	dec eax

	call WriteString
	call Crlf

	jmp _WHILE


	_END_WHILE:


	INVOKE ExitProcess, 0
main ENDP
END main