.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
GetMaxXY PROTO

.code
main PROC
	mov eax, 0
	mov edx, 0

	call GetMaxXY 
	;Fill ax with Console Window's Row Buffer Size, Fill dx with Console Window's Column Buffer Size
	call DumpRegs


	INVOKE ExitProcess, 0
main ENDP
END main