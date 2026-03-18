.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	mov eax, 0
	cmp eax, 0
	jz L1			; IF ZF == 1, JMP

	mov ebx, 1
	call DumpRegs
	l1:


	mov eax, 1
	cmp eax, 0
	jnz L4			; IF ZF == 0, JMP
	

	mov ebx, 4
	call DumpRegs
	L4:



	stc
	jc L2			; IF CF == 1, JMP

	mov ebx, 2
	call DumpRegs
	L2:

	cmp eax, 0

	jnc L3			; IF CF == 0, JMP

	mov ebx, 3
	call DumpRegs
	L3:




	INVOKE ExitProcess, 0
main ENDP
END main