.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	call Proc1




	INVOKE ExitProcess, 0
main ENDP


PROC1 PROC
	push ebp
	mov ebp, esp

	mov eax, 10
	PUSH eax

	mov eax, 20
	PUSH eax

	PUSHFD
	call DumpRegs
	POPFD

	call Sum

	PUSHFD
	call DumpRegs
	POPFD


	mov esp, ebp
	pop ebp
	ret
PROC1 ENDP


xParam EQU [ebp + 8]			; ¡Ø Use EQU To Point Parameter Explicitly
yParam EQU [ebp + 12]

Sum PROC
	push ebp
	mov ebp, esp


	mov eax, DWORD PTR xParam
	add eax, DWORD PTR yParam

	call DumpRegs


	mov esp, ebp
	pop ebp
	ret 

Sum ENDP


END main