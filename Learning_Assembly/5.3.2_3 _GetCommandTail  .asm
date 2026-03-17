.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
GetCommandTail PROTO
WriteString PROTO

.data
cmdTail BYTE 129 DUP(0)

.code
main PROC
	mov edx, OFFSET cmdTail
	call GetCommandTail		
	; Get Command Arguments to edx.
	; Command Argument is settable at Properties - Debugging - Command Arguments
	; cmdTail must be 129 BYTEs

	call WriteString

	INVOKE ExitProcess, 0
main ENDP
END main
