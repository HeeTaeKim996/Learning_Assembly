.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO

.data
array SWORD -3, -6, -1, -10, 10, 30, 40, 4

.code
main PROC
	
	mov esi, OFFSET array
	mov ecx, LENGTHOF array

	L1:
	test BYTE PTR [esi], 80h	; If Minus Value, ZF = 1
	pushfd
	add esi, TYPE array
	popfd
	loopnz L1					; If ECX > 0 && ZF == 0, JMP

	jnz _Quit					; If NZ, esi Points End of Array (0)
	Sub esi, TYPE array		

	_Quit:
	
	movsx eax, SWORD PTR [esi]
	call WriteInt


	INVOKE ExitProcess, 0
main ENDP

	; LOOPZ(LOOPE)		: IF ECX > 0 && ZF == 1, JMP
	; LOOPNZ(LOOPNE)	: IF ECX > 0 && ZF == 0, JMP


END main