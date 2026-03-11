.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
WriteInt PROTO
Crlf PROTO

.data
arrB BYTE 1, 2, 3
arrW WORD 10, 20, 30
arrD DWORD 100, 200, 300


.code
main PROC
	movzx eax, arrB
	call WriteInt
	call Crlf

	mov al, [arrB+1]	; 2
	call WriteInt
	call Crlf

	mov al, arrB+1		; same
	call WriteInt
	call Crlf


	mov ax, arrW
	call WriteInt
	call Crlf

	mov ax, [arrW + 1]	; ! No 20
	call WriteInt
	call Crlf

	mov ax, [arrW + 2]	; 20. must Add sizeof's Multiple 
	call WriteInt
	call Crlf

	mov ax, [arrW + 4]	; 30
	call WriteInt
	call Crlf

	mov eax, [arrD + 4] ; 200
	call WriteInt
	call Crlf

	INVOKE ExitProcess, 0
main ENDP
END main