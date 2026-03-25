.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteString PROTO
Crlf PROTO

.data
Dum BYTE 32 DUP(?), 0


.code
main PROC
	mov eax, 19
	mov esi, OFFSET Dum

	call BinToASC

	mov edx, esi
	call WriteString
	call Crlf



	INVOKE ExitProcess, 0
main ENDP



BinToASC PROC USES ecx esi
	mov ecx, 32
	
	.WHILE ecx > 0
		shl eax, 1
		jnc _ELSE

		mov BYTE PTR [esi], '1'
		jmp _ENDIF

		_ELSE:
		mov BYTE PTR [esi], '0'
		
		_ENDIF:
		inc esi
		dec ecx
	.ENDW

	
	ret
BinToASC ENDP


END main