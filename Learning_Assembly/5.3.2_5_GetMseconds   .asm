.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
GetMseconds PROTO
DumpRegs PROTO

.data
startTime DWORD ?

.code
main PROC
	call GetMseconds		; Get Passed Time(ms) from OS Booted Time. move that to eax
	mov startTime, eax

	mov ecx, 100000000
	L1:
	loop L1

	call GetMSeconds
	sub eax, startTime

	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP
END main