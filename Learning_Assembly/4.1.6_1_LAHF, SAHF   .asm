
.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
WriteHex PROTO

.data?
saveflags BYTE ?

.code
main PROC
	mov eax, 0
	lahf					; Load low EFLAGS into ah (ah is part of eax)
	call WriteHex

	mov saveflags, ah
	
	mov ah, saveflags
	sahf					; Set low EFLAGS from ah


	INVOKE ExitProcess, 0
main ENDP
END main

	