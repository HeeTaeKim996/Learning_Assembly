.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



PBYTE TYPEDEF PTR BYTE ; Similar with typedef (C). Usually used to Mean Pointer of Some Type

.data
arrayB BYTE 10h, 20h, 30h
ptrB PBYTE arrayB


.code
main PROC
	mov esi, ptrB
	movzx eax, BYTE PTR [esi]			; 10h
	call DumpRegs
	; Upper code doesn't look Efficient. but By Using Typedef, it ensures
	; some variable is Only Used for PTR of SomeType


	INVOKE ExitProcess, 0
main ENDP
END main
