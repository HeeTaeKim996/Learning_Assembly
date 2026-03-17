.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

Crlf PROTO

WriteBin PROTO
WriteBinB PROTO
WriteChar PROTO
WriteDec PROTO
WriteHex PROTO
WriteHexB PROTO
WriteInt PROTO
WriteString PROTO

.data
msg BYTE "SampleMessage", 0

.code
main PROC
	mov eax, 1234h

	call WriteBin
	call Crlf

	call WriteBinB
	call Crlf

	call WriteChar
	call Crlf

	call WriteDec
	call Crlf

	call WriteHex
	call Crlf

	call WriteHexB
	call Crlf

	call WriteInt
	call Crlf


	mov edx, OFFSET msg
	call WriteString
	call Crlf



	INVOKE ExitProcess, 0
main ENDP
END main