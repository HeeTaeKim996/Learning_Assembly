.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO


.data
status BYTE 10001100b

.code
main PROC
	
	mov al, status

	; HAS 1 FLAG Check 
	test al, 00001000b
	jnz T1					; Is 3 Bit 1 ?

	mov ebx, 0
	call DumpRegs
	T1:

	; Has MANY FLAG Check
	and al, 10001000b
	cmp al, 10001000b
	jz T2					; Is 7, 4 Bitz 1 ?

	mov ebx, 1
	call DumpRegs
	T2:





	INVOKE ExitProcess, 0
main ENDP
END main