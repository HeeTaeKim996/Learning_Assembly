.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteHex PROTO
Crlf PROTO


.code


main PROC
	mov eax, 1
	mov ebx, 2
	mov ecx, 3

	call DumpRegs

	call SumOf

	call DumpRegs

	call CheckEIP


	INVOKE ExitProcess, 0
main ENDP




SumOf PROC
	add eax, ebx
	add eax, ecx
	ret
SumOf ENDP


CheckEIP PROC
	pop eax				; 'CALL' Saved EIP to Stack. Pointing 'INVOKE ExitProcess, 0' Line
	call WriteHex
	call Crlf

	push eax			

	ret					; RET Set EIP From POPPED STACK
CheckEIP ENDP

END main