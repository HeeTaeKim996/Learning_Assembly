.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	PUSH ebp
	mov ebp, esp


	mov ebx, 1
	
	mov eax, 2
	PUSH eax

	call Cautious



	POP ebp
	INVOKE ExitProcess, 0
main ENDP


FirstParam EQU [ebp + 8]

Cautious PROC USES ebx				; If You Use EQU To Param. Using USES is Not Recommanded
	PUSH ebp
	mov ebp, esp

	
	mov eax, DWORD PTR FirstParam

	call DumpRegs		; Because of 'USES ebx', [ebp + 8] doesn't Point 2. It Points return Address
						;					(ebp / ebx /  returnAddress / 2 )


	POP ebp
	ret	4
Cautious ENDP

END main