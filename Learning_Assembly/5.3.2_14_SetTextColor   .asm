.386
.model flat, stdcall

includelib Irvine32.lib

INCLUDE Irvine32.inc

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
SetTextColor PROTO
WriteString PROTO


.data
msg BYTE "SampleMessage", 0


.code
main PROC
	mov eax, Yellow + (Blue * 16)
	call SetTextColor

	mov edx, OFFSET msg
	call WriteString


	INVOKE ExitProcess, 0
main ENDP
END main