.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

WriteWindowsMsg PROTO


.code
main PROC
	call WriteWindowsMsg	; Write Latest Window's Msg




	INVOKE ExitProcess, 0
main ENDP
END main