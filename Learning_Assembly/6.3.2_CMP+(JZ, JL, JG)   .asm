.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	mov eax, 5
	
	cmp eax, 5			
	jz L1				; CMP + JZ ==> if(X == N)

	mov ebx, 0
	call DumpRegs
	jmp _Next1


	L1:
	mov ebx, 1
	call DumpRegs
	jmp _Next1



	_Next1:
	cmp eax, 6
	jl L2				; ZL : IF SF != OF, JMP ==> if(X < N)


	mov ebx, 2
	call DumpRegs
	jmp _Next2

	L2:
	mov ebx, 3
	call DumpRegs
	jmp _Next2



	_Next2:

	cmp eax, 4
	jg L3				; ZG : IF SF == OF && ZF == 0, JMP ==> if(X > N)

	mov ebx, 4
	call DumpRegs
	jmp _Exit


	L3:
	mov ebx, 5
	call DumpRegs
	jmp _Exit


	_Exit:
	INVOKE ExitProcess, 0
main ENDP
END main