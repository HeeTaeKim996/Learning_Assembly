.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

StrLength PROTO

.data
buffer BYTE "abcde", 0

.code
main PROC
	mov edx, OFFSET buffer
	call StrLength			; Move SIZEOF edx's address's Buffer to eax
	call DumpRegs			; eax : 5




	INVOKE ExitProcess, 0
main ENDP
END main