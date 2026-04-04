	.386
	.model flat, stdcall

	includelib Irvine32.lib

	.stack
	ExitProcess PROTO, dwExitCode:DWORD
	DumpRegs PROTO

	EXTERN sub1@4:PROC					; @n : n is Sum Of Params Type. Must Be Declared By N:TYPE IN PROC
	sub1 EQU sub1@4

	.code
	main PROC


		push 4		
		call sub1



		INVOKE ExitProcess, 0
	main ENDP
	END main