.386
.model flat, stdcall

includelib Irvine32.lib
INCLUDE Irvine32.inc


.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO


.data
hHeap HANDLE ?

	
.code
main PROC
	INVOKE GetProcessHeap

	.IF eax == NULL
		jmp _QUIT
		
	.ELSE
		mov hHeap, eax
	.ENDIF
	
	_QUIT:
	INVOKE ExitProcess, 0
main ENDP
END main