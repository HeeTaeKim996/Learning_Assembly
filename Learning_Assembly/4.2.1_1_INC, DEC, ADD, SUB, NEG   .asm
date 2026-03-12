
.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
WriteInt PROTO
Crlf PROTO

.code
main PROC
	mov eax, 300
	call WriteInt
	call Crlf

	inc eax						; Add one
	call WriteInt
	call Crlf

	dec eax						; Sub one
	call WriteInt
	call Crlf

	add eax, 400				; Add Source
	call WriteInt
	call Crlf

	sub eax, 500				; Sub source
	call WriteInt
	call Crlf

	neg eax						; Negation
	call WriteInt
	call Crlf

	neg eax
	call WriteInt
	call Crlf



	
	INVOKE ExitProcess, 0
main ENDP
END main


