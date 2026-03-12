.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

.data
bVal BYTE ?
wVal WORD ? 
dVal DWORD ? 
dVal2 DWORD ? 

.code
main PROC
	mov esi, OFFSET bVal
	call DumpRegs
	mov esi, OFFSET wVal
	call DumpRegs
	mov esi, OFFSET dVal
	call DumpRegs
	mov esi, OFFSET dVal2
	call DumpRegs
	
	mov esi, OFFSET main
	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP
END main

