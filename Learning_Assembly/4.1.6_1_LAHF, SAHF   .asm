
.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

.data?
saveflags BYTE ?

.code
main PROC
	mov eax, 0
	lahf					; Load low EFLAGS into ah (ah is part of eax)
	call DumpRegs
	
	mov saveflags, ah
	
	mov ah, saveflags
	sahf					; Set low EFLAGS from ah


	; ¡Ø upper case, ah is consist of
	; SF / ZF / 0 / AF / 0 / PF / 1 / CF
	; upper case, ZF = 1 && PF = 1, Rest  is 0
	; 64 + 4 + 2 == 70 == 46h


	INVOKE ExitProcess, 0
main ENDP
END main

	