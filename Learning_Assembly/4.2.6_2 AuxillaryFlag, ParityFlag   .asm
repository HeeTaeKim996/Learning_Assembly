.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

.code
main PROC

	; AuxillaryFlag 1 when operated's 3 bit occur carry 
	mov eax, 0eh
	inc eax
	call DumpRegs		; AF = 0

	inc eax
	call DumpRegs		; AF = 1 (1111 + 1 = 10000. carry occur on 3bit)


	; ParityFlag. 1 when operated's binary's 1 is even
	mov eax, 10b
	add eax, 1			; PF = 1		(0000 0011 -> 2)
	call DumpRegs

	add eax, 1			; PF = 0		(0000 0100 -> 1)
	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP
END main

