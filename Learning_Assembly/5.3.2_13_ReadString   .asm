.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
ReadString PROTO

WriteString PROTO


.data
buffer BYTE 21 DUP(?)
byteCount DWORD ?

.code
main PROC
	mov edx, OFFSET buffer
	mov ecx, SIZEOF buffer
	call ReadString			; Read String. Fill edx's addreess with Inputed. Fill eax with byteCount
	mov byteCount, eax


	call DumpRegs
	call WriteString


	INVOKE ExitProcess, 0
main ENDP
END main