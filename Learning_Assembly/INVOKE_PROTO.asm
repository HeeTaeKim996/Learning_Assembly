.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

ExternFunc PROTO, var1:DWORD, var2:DWORD, var3:DWORD
	

.code
main PROC
		
	INVOKE ExternFunc, 1, 2, 3
	

	INVOKE ExitProcess, 0
main ENDP
END main