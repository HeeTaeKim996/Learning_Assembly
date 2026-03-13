.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

.data

; LABEL variable Doesnt have Real Save Place. Like just Pointer of Under variable

labelVar LABEL WORD		
realVar DWORD 12345678h

labelVar2 LABEL DWORD
realVar2 WORD 5678h
realVar3 WORD 1234h

.code
main PROC
	movzx eax, labelVar
	call DumpRegs

	mov ax, labelVar + 1
	call DumpRegs


	mov eax, labelVar2	; Because LABEL variable is Just Pointer. it can be used to combine Bytes
	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP
END main
