.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO


.code
main PROC
	mov eax, 6
	.IF eax > 5
		call DumpRegs
	.ELSE
		call WriteInt
	.ENDIF




	INVOKE ExitProcess, 0
main ENDP
END main


; JMP, JMP_IF is goto on NOT eip, its goto EIP(Curr) + a  (relative goto Mapping)

; .IF - .ELSE - .ENDIF Works Same way. it assembled in JMP_IF + JMP Codes. 

; Below Is Example. First Will Be Assembled To Below. Left Column Means EIP

; 1	.IF EAX > 5
; 2	CALL DUMPREGS
; 3	.ELSE
; 4	CALL WRITEINT
; 5	.ENDIF


; 1	CMP EAX, 5
; 2	JBE 5
; 3	CALL DUMP REGS
; 4	JMP 6
; 5	CALL WRITEINT
; 6	BLANK