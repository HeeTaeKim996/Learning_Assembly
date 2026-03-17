.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
GetTextColor PROTO
DumpRegs PROTO

.data
color BYTE ?

.code
main PROC
	call GetTextColor	
	; Set AL Upper 4bits to Console's Background Color. Lower 4Bits to Text Color
	mov color, AL

	movzx eax, color
	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP
END main
	
	