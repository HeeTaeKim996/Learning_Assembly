.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpMem PROTO


.data
array DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 0Ah, 0Bh

.code
main PROC
	mov esi, OFFSET array
	mov ecx, LENGTHOF array
	mov ebx, TYPE array

	call DumpMem


	INVOKE ExitProcess, 0
main ENDP
END main