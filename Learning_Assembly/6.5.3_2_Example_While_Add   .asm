.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO

.data
arr SDWORD 20, -10, -5, 3, 14, -20, 10


.code
main PROC
	mov ebx, 0
	mov ecx, LENGTHOF arr
	mov esi, OFFSET arr
	
	_LOOP:
	mov eax, [esi]
	cmp eax, 0
	jle _FIN
	add ebx, eax

	
	_FIN:
	add esi, TYPE arr

	loop _LOOP

	mov eax, ebx
	call WriteInt
	

	INVOKE ExitProcess, 0
main ENDP
END main