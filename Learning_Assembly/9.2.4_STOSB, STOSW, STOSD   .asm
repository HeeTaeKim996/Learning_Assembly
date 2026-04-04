.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteString PROTO
Crlf PROTO

	
.data
Count = 10
msg BYTE Count DUP(' '), 0


.code
main PROC
	mov ecx, Count
	mov edi, OFFSET msg
	mov al, 'F'

	cld

	rep stosb						; ¡Ø STOSB : mov BYTE PTR [EDI], al.  Also EDI++

	mov edx, OFFSET msg

	call WriteString
	call Crlf
	

	INVOKE ExitProcess, 0


	; ¡Ø STOSW(D) Is Also Same. mov WORD(DWORD) PTR [edi], al

main ENDP
END main