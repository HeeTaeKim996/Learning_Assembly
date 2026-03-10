TITLE Add and Subtract, Version2

.386
.model flat, stdcall

includelib Irvine32.lib


.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.data
val1 DWORD 10000h
val2 DWORD 40000h
val3 DWORD 20000h
finalVal DWORD ?



.code
main PROC
	mov eax, val1
	add eax, val2
	sub eax, val3
	mov finalVal, eax
	call DumpRegs
	
	INVOKE ExitProcess, 0
main ENDP
END main