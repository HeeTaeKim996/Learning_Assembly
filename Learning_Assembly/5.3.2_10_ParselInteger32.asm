.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
ParseInteger32 PROTO
WriteInt PROTO


.data
buffer BYTE "-8193"
bufSize DWORD ($ - buffer)

randVal DWORD ?

.code
main PROC
	mov edx, OFFSET buffer
	mov ecx, bufSize
	call ParseInteger32	; Move Text's digital value to eax

	call WriteInt


	INVOKE ExitProcess, 0
main ENDP
END main