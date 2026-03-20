.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteString PROTO
Crlf PROTO


.data
a DWORD 3h
b DWORD 2h
cVal DWORD 1h

TrueMsg BYTE "TRUE", 0
FalseMsg BYTE "FALSE", 0


.code


main PROC


; IF ( ~ AND ~ ) is Just Two Of IF_JUMP

	mov eax, a
	cmp eax, b
	jbe _NOT

	
	JBE _NOT

	mov edx, OFFSET TrueMsg
	call WriteString
	jmp _Next

	_NOT:
	mov edx, OFFSET FalseMsg
	call WriteString


	

	_Next:

	call Crlf


	; IF( ~ OR ~ ) is Also Same. Just Two If IF_JMP

	mov eax, b
	cmp eax, a
	jb _True

	cmp eax, cVal
	jb _True

	mov edx, OFFSET FalseMsg
	call WriteString
	jmp _Exit

	_True:
	mov edx, OFFSET TrueMsg
	call WriteString


	_Exit:
	INVOKE ExitProcess, 0
main ENDP
END main