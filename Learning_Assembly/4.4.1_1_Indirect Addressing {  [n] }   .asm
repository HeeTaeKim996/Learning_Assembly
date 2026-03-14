.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO


.data
byteVal BYTE 10h

arrayB BYTE 10h, 20h, 30h
arrayW WORD 1h, 2h, 3h

.code
main PROC
	mov esi, OFFSET byteVal
	movzx eax, BYTE PTR [esi]
	; [n] is similar as *pVal's * 
	; But [n] doesn't know TYPE. so if want to get exact value, need PTR
	call DumpRegs

	inc BYTE PTR [esi]			; also can revise memory's value
	movzx eax, BYTE PTR [esi]
	call DumpRegs



	; IndirectAddressing [n] is Good at Acessing Array's Component
	mov esi, OFFSET arrayB
	movzx eax, BYTE PTR [esi]
	call DumpRegs				; 10h

	inc esi
	movzx eax, BYTE PTR [esi]	
	call DumpRegs				; 20h

	inc esi 
	movzx eax, BYTE PTR [esi]
	call DumpRegs				; 30h


	mov esi, OFFSET arrayW
	movzx eax, WORD PTR [esi]
	call DumpRegs				; 1

	add esi, 2					; add 2 because WORD's TYPE is 2
	movzx eax, WORD PTR [esi]
	call DumpRegs				; 2

	add esi, 2
	movzx eax, WORD PTR [esi]
	call DumpRegs				; 3



	; Other style is Under code
	mov esi, 0
	movzx eax, BYTE PTR [arrayB + esi]
	call DumpRegs				; 10h

	inc esi
	movzx eax, BYTE PTR [arrayB + esi]
	call DumpRegs				; 20h


	; By Using TYPE, can easily access Array's Component by Index
	mov esi, TYPE arrayW * 2			; Index is 2
	movzx eax, WORD PTR [arrayW + esi]	
	call DumpRegs						; 3h

	; Also can used like under code
	mov esi, 2
	movzx eax, WORD PTR [arrayW + esi * TYPE arrayW]
	call DumpRegs						; 3h

	INVOKE ExitProcess, 0
main ENDP
END main




