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

	call MySub


	POP ebp
	INVOKE ExitProcess, 0
main ENDP



x_local EQU [ebp - 4]
y_local EQU [ebp - 8]

MySub PROC
	PUSH ebp
	mov ebp, esp
	sub esp, 8					; If Use LocalVariable. Make Space Like This

	mov DWORD PTR x_local, 3
	mov DWORD PTR y_local, 4

	mov eax, DWORD PTR x_local
	add eax, DWORD PTR y_local

	call DumpRegs


	mov esp, ebp				; If Use LocalVariable. Return Esp Like This. (C/C++ Use This Style)
	POP ebp
	ret 
MySub ENDP





END main