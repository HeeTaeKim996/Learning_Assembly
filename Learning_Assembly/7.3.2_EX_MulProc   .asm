.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO
Crlf PROTO


.code
main PROC
	mov ecx, 123
	mov eax, ecx
	call WriteInt
	call Crlf



	mov ebx, 5
	call MulProc

	call WriteInt
	call Crlf



	

	INVOKE ExitProcess, 0
main ENDP



; Current CPU Use Booth Algorithm. So Don't Use Under Algorithm

MulProc PROC
	mov eax, 0

	.WHILE SDWORD PTR ebx > 0
		shr ebx, 1
		jnc _END_WHILE

		add eax, ecx

		_END_WHILE:
		shl ecx, 1
	.ENDW

	ret
MulProc ENDP










END main