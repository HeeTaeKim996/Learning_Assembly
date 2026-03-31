.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO




.code
main PROC
	mov edx, 0
	mov al, 0FFh
	add al, 0FFh

	adc dl, 0
	; ADC source, n ==> source = source + CF + n

	call DumpRegs


	mov edx, 7
	mov eax, 1
	sub eax, 2

	sbb edx, 0
	; SBB source, n ==> source = source - CF - n

	call DumpRegs



	INVOKE ExitProcess, 0
main ENDP
END main