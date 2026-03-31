.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	
	call EnterLeave



	INVOKE ExitProcess, 0
main ENDP


x_local EQU [ebp - 4]
y_local EQU [ebp - 8]

EnterLeave PROC
	enter 8, 0
	; ¡Ø ENTER N, 0 means Under
	; PUSH ebp
	; mov ebp, esp
	; sub esp, N

	
	mov DWORD PTR x_local, 3
	mov DWORD PTR y_local, 4

	mov eax, DWORD PTR x_local
	add eax, DWORD PTR y_local

	call DumpRegs

	leave
	; ¡Ø LEAVE means Under
	; mov esp, ebp
	; POP ebp

	ret
EnterLeave ENDP


END main