.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO


.data
arr DWORD 1, 2, 3

.code
main PROC
	mov esi, OFFSET arr
	mov ecx, LENGTHOF arr
	mov ebx, TYPE arr

	call ArraySum	
	call DumpRegs

	call ArraySum2
	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP





ArraySum PROC 
	push ecx
	push esi

	mov eax, 0
	

	L1:
	add eax, [esi]
	add esi, ebx

	loop L1

	pop esi
	pop ecx

	ret
ArraySum ENDP


ArraySum2 PROC USES ecx esi		; USES Automatically Address PUSH - POP (Restore Register)
	mov eax, 0

	L1:
	add eax, [esi]
	add esi, ebx

	loop L1

	ret
ArraySum2 ENDP


END main