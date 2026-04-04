.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO
Crlf PROTO

.data
srcArr DWORD 1, 2, 3, 4, 5
desArr DWORD 5 DUP(?)

.code
main PROC
	mov ecx, LENGTHOF srcArr
	mov esi, OFFSET srcArr
	mov edi, OFFSET desArr

	cld
	mov ebx, 2

	_WHILE:
	lodsd							; ¡Ø LODSD : mov EAX, DWORD PTR [ESI]. Also ESI += 4
	mul ebx
	stosd

	dec ecx

	cmp ecx, 0
	ja _WHILE


	

	mov esi, OFFSET desArr
	mov ecx, 5
	.WHILE ecx > 0
	mov eax, DWORD PTR [esi]

	call WriteInt
	call Crlf  

	add esi, 4
	dec ecx
	.ENDW
	
		
	
	; ¡Ø LODSB, LODSW Is Also Same. mov AL(AX), BYTE(WORD) PTR [ESI]. aLSO ESI  += 1(2)

	INVOKE ExitProcess, 0
main ENDP
END main