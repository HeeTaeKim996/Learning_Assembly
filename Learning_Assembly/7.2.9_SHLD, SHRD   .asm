.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteBin PROTO
Crlf PROTO


.data
lowVal BYTE 00001010b
highVal BYTE 01010000b

.code
main PROC
	movzx eax, lowVal
	call WriteBin
	call Crlf
	
	mov ebx, 0
	mov bh, highVal 

	shld ax, bx, 4		
	; ¡Ø shld source, dest, count : Left shift source by count. then Fill Empty Source with High Bits of dest
	; source - dest Comb Requires Specific Type.
	;  -> reg16-reg6, mem16 - reg16, reg32 - reg32, mem32 - reg32
	call WriteBin
	call Crlf

	

	call Crlf
	call Crlf
	call Crlf


	movzx eax, highVal
	call WriteBin
	call Crlf

	mov bl, lowVal
	shrd ax, bx, 4
	; ¡Ø shrd source, dest, 4 : Right shift source by count. then Fill Empty source with Low Bits of dest

	call WriteBin
	call Crlf





	INVOKE ExitProcess, 0
main ENDP
END main