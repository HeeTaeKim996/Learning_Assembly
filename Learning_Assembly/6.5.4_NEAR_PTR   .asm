.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteString PROTO
Crlf PROTO
ReadChar PROTO

.data
Prompt BYTE "Press A or B or C or D", 0

CaseTable	BYTE 'A'
			DWORD Process_A
UnitSize = ($ - CaseTable)
			BYTE 'B'
			DWORD Process_B
			BYTE 'C'
			DWORD Process_C
			BYTE 'D'
			DWORD Process_D

LengthOfTable = ($ - CaseTable) / UnitSize

Msg_A BYTE "A_Process", 0
Msg_B BYTE "B_Process", 0
Msg_C BYTE "C_Process", 0
Msg_D BYTE "D_Process", 0


.code
main PROC
	
	mov edx, OFFSET Prompt
	call WriteString
	call Crlf
	call ReadChar

	mov esi, OFFSET CaseTable
	mov ecx, LengthOfTable


	L1:
	mov bl, BYTE PTR [esi]
	cmp al, bl
	
	jnz _LOOP_END

	call NEAR PTR [esi + 1]		; NEAR PTR : Interpret Function's Address
	call WriteString 
	call Crlf
	
	_LOOP_END:
	add esi, UnitSize
	loop L1

	
	
	_Exit:

	INVOKE ExitProcess, 0
main ENDP


Process_A PROC
	mov edx, OFFSET Msg_A
	ret
Process_A ENDP

Process_B PROC
	mov edx, OFFSET Msg_B
	ret
Process_B ENDP

Process_C PROC
	mov edx, OFFSET Msg_C
	ret
Process_C ENDP

Process_D PROC
	mov edx, OFFSET Msg_D
	ret
Process_D ENDP


END main