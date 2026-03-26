.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	mov eax, 1000h
	mov bl, 2
	div bl				; al Cannot Holds Quotient. So CRASH Occurs

	; When DIV/IDIV, Using EDX:EAX / reg/mem32 Is Recommanded. 
	; Before DIV/IDIV, Checking Divisor == 0 IS Also Recommanded.




	INVOKE ExitProcess, 0
main ENDP
END main