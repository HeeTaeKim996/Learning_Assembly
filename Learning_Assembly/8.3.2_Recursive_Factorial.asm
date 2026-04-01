.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO
Crlf PROTO


.code
main PROC
	
	PUSH 5
	call Factorial

	call WriteInt	; 120
	call Crlf

	INVOKE ExitProcess, 0
main ENDP



n_param EQU [ebp + 8]

Factorial PROC
	PUSH ebp
	mov ebp, esp

	mov eax, n_param
	cmp eax, 0
	jnz _ELSE

	mov eax, 1		; 0! == 1
	jmp _ENDIF

	
	_ELSE:
	dec eax
	PUSH eax
	call Factorial

	mov ebx, n_param
	mul ebx

	jmp _ENDIF

	

	_ENDIF:
	POP ebp
	ret 4
Factorial ENDP



END main