.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO
Crlf PROTO

.data
dwVal DWORD 10240

.code
main PROC
	mov eax, dwVal
	call WriteInt
	call Crlf
	

	shr BYTE PTR [dwVal + 3], 1

	mov ecx, 2
	.WHILE SDWORD PTR ecx >= 0
		shr BYTE PTR [dwVal + ecx], 1
		dec ecx 
	.ENDW


	; SHL - SHR's Out Bit Go To CF
	; RCR - RCL's In Bit is From CF, Out Bit Go To CF
	; /= 2
	
	mov eax, dwVal
	call WriteInt
	call Crlf



	INVOKE ExitProcess, 0
main ENDP
END main