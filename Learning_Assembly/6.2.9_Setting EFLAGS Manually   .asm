.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	; How To Set EFLAGS Manually

	; Zf
	test al, 0	; ZF = 1
	call DumpRegs
	
	or al, 1	; ZF = 0
	call DumpRegs


	; SF
	or al, 80h	; SF = 1
	call DumpRegs

	and al, 0h	; SF = 0
	call DumpRegs

	; CF
	stc			; CF = 1
	call DumpRegs

	clc			; CF = 0
	call DumpRegs

	; OF
	mov al, 7Fh
	inc al		; OF = 1
	call DumpRegs

	or al, 0	; OF = 0
	call DumpRegs

	; PF
	mov al, 1h
	cmp al, 0	; PF = 0
	call DumpRegs

	mov al, 0h
	cmp al, 0	; PF = 1
	call DumpRegs




	INVOKE ExitProcess, 0
main ENDP
END main