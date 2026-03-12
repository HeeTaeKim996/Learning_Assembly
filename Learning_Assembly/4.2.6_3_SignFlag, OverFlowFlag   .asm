.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

.data?
signed SDWORD ?

.code
main PROC
	; SF : 1 when operated Source is Minus

	mov eax, 1
	sub eax, 2			; SF == 1
	call DumpRegs
	
	
	add eax, 3
	call DumpRegs		; SF = 0
	

	; OverFlow : Cn XOR Cn-1. unlike CF, Irrelevant with M
	mov signed, 07FFFFFFFh ; Max num
	add signed, 1
	call DumpRegs		; OF = 1

	mov signed, 80000000h ;	Min num
	sub signed, 1
	call DumpRegs		; OF = 1

	mov signed, 07FFFFFFFh ; Max num
	sub signed, -1
	call DumpRegs		; OF = 1

	mov signed, 80000000h ; Min num
	add signed, -1
	call DumpRegs		; OF = 1
	

	INVOKE ExitProcess, 0
main ENDP
END main