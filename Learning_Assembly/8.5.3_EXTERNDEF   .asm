	.386
	.model flat, stdcall

	includelib Irvine32.lib
	INCLUDE vars.inc

	.stack
	ExitProcess PROTO, dwExitCode:DWORD
	DumpRegs PROTO

	

	.code
	main PROC
		mov eax, SYM1
		mov ebx, count

		call DumpRegs
		


		INVOKE ExitProcess, 0
	main ENDP
	END main