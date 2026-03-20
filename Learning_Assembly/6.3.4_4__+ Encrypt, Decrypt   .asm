.386
.model flat, stdcall

includelib Irvine32.lib

KEY = 239
BUFMAX = 128

.stack
ExitProcess PROTO:DWORD
WriteString PROTO
ReadString PROTO
Crlf PROTO

.data
sPrompt		BYTE "Enter the plain text : ", 0
sEncrypt	BYTE "Cipher Text : ", 0
sDecrypt	BYTE "Decrypted : ", 0
buffer		BYTE BUFMAX + 1 DUP(0)
bufSize		DWORD ?

.code
main PROC
	call InputTheString

	call TranslateBuffer
	mov edx, OFFSET sEncrypt
	call DisplayMessage

	call TranslateBuffer
	mov edx, OFFSET sDecrypt
	call DisplayMessage
	


	INVOKE ExitProcess, 0
main ENDP


InputTheString PROC
	pushad
	mov edx, OFFSET sPrompt
	call WriteString
	mov ecx, BUFMAX
	mov edx, OFFSET buffer
	call ReadString
	mov bufSize, eax
	call Crlf
	popad
	ret
InputTheString ENDP

DisplayMessage PROC
	pushad
	call WriteString
	mov edx, OFFSET buffer
	call WriteString
	call Crlf
	call Crlf
	popad
	ret
DisplayMessage ENDP

TranslateBuffer PROC
	pushad
	mov ecx, bufSize
	mov esi, 0

	L1:
	xor buffer[esi], KEY
	inc esi
	loop L1

	popad
	ret
TranslateBuffer ENDP


; A XOR B = C, Then C XOR B = A. Upper Encrypt, Decrypt Use this
; This case is Symmetric Key (Encrypt, Decrypt Use the Same key)

END main

