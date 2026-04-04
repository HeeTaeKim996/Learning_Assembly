	.386
	.model flat, stdcall

	includelib Irvine32.lib

	.stack
	ExitProcess PROTO, dwExitCode:DWORD
	DumpRegs PROTO

	EXTERN ArraySum@0:PROC			; If u Declare PROC's Param By EQU (Classic), @0 is Fixed
	ArraySum EQU ArraySum@0


	.data
	arr DWORD 1, 2, 3
	sum DWORD ?


	.code
	main PROC
		
		PUSH OFFSET arr
		PUSH LENGTHOF arr
		PUSH OFFSET sum
		call ArraySum

		mov eax, sum
		call DumpRegs


		INVOKE ExitProcess, 0
	main ENDP
	END main