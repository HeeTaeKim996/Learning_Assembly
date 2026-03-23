.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteBin PROTO
Crlf PROTO
WriteHex PROTO



.code
main PROC

	; ROR, ROL

	mov eax, 0
	mov ax, 8000h
	call WriteBin
	call Crlf

	rol ax, 1			; ROL : Set CF && Min Bit From Max Bit. Other is Same As Left Shift 
	call DumpRegs		; CF == 1
	call WriteBin		; MinBit == 1
	call Crlf
	

	call Crlf
	call Crlf
	call Crlf

	mov ax, 1h
	call WriteBin
	call Crlf

	ror ax, 1			; ROR : Set CF && Max Bit From Min Bit. Other is Same As Right Shift
	call DumpRegs
	call WriteBin
	call Crlf


	call Crlf
	call Crlf
	call Crlf


	; ROR - ROL is Used For Encrypt-Decrypt, And Various Algorithm. they Preserve All Bits And Shift.
						

	mov ax, 2A4Bh
	call WriteHex		; 2A4B
	call Crlf

	rol ax, 8			
	call WriteHex		; 4B2A
	call Crlf





	call Crlf
	call Crlf
	call Crlf




	; RCL - RCR		: It Similar with ROR, ROL. But Min/Max To CF. And CF To Max/Min
					; It's Like ROR - ROL On [ Bits + 1 ]  
					; It is used For Making More than Word size Bits Progress Shift
					;  ex) Win-32 -> QDWORD. x64 -> 128 bits

	mov eax, 0
	mov al, 4Bh;
	
	call WriteHex		; 004B
	call Crlf
	call WriteBin
	call Crlf

	mov ecx, 8
	.WHILE ecx > 0
		rcl al, 1

		PUSHFD
		shl ah, 1
		POPFD

		jnc _WHILE_END
		inc ah

		_WHILE_END:

		call WriteBin
		call Crlf

		dec ecx
	.ENDW

	call WriteHex		; 4B00
	call Crlf






	INVOKE ExitProcess, 0
main ENDP
END main