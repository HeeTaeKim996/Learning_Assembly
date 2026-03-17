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
	mov eax, esp
	push eax
	call DumpRegs

	mov eax, esp

	push eax
	call DumpRegs

	mov eax, esp
	call DumpRegs

	pop eax
	call DumpRegs

	pop eax
	call DumpRegs
	
	; @@ ==> ESP is the pointer of stack's top Address. IF you touch esp, All Stack Boom
	;		 Also Dont Touch EBP. EBP is Pointer Of Stack's 0 Address




	INVOKE ExitProcess, 0
main ENDP
END main