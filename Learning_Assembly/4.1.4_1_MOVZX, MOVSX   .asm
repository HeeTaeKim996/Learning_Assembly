
.386
.model flat, stdcall

includelib Irvine32.lib


.stack
ExitProcess PROTO, dwExitCode:DWORD
WriteInt PROTO
WriteHex PROTO
Crlf PROTO

.data
oneByte BYTE 7h
oneWord WORD 1234h
oneDword DWORD 12345678h

signedVal SWORD ?

.code
main PROC
	mov eax, oneDword
	call WriteHex
	call Crlf

	mov ax, oneWord		; Copy source to ax. high 16-bits keep past values
	call WriteHex
	call Crlf

	movzx eax, oneWord	; set Upper bits to 0. and copy source to ax
	call WriteHex
	call Crlf

	mov al, oneByte
	call WriteHex
	call Crlf

	movzx eax, oneByte
	call WriteHex
	call Crlf


	mov signedVal, 16	; 0010h
	mov eax, 0
	mov ax, signedVal	; 0000010h
	call WriteHex
	call Crlf

	mov signedVal, -16	; FFF0h
	mov eax, 0
	mov ax, signedVal	; 0000FFF0h
	call WriteHex
	call Crlf
	call WriteInt
	call Crlf

	mov eax, 0FFFFFFFFh 
	; Added 0 at first. because only FF..h is regarded as text
	mov ax, signedVal
	call WriteHex
	call Crlf
	call WriteInt
	call Crlf

	mov signedVal, 16
	movsx eax, signedVal ; If source is Positive, Fill upper bits to 0
	call WriteHex
	call Crlf
	call WriteInt
	call Crlf
	
	mov signedVal, -16
	movsx eax, signedVal ; If source is Negative, Fill upper bits to 1
	call WriteHex
	call Crlf
	call WriteInt
	call Crlf




	INVOKE ExitProcess, 0
main ENDP
END main
