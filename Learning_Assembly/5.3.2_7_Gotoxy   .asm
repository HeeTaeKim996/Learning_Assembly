.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
Gotoxy PROTO

.code
main PROC
	mov dh, 10
	mov dl, 20
	call Gotoxy	; Set 'TEXT's Cursor Pos. DH is Row, DL is Col


	INVOKE ExitProcess, 0
main ENDP
END main
