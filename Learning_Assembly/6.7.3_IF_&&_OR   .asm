.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteString PROTO
Crlf PROTO

.data
TrueMsg BYTE "TRUE", 0
FalseMsg BYTE "FALSE", 0


.code
main PROC
	mov eax, 3
	

	.IF eax > 1 && eax < 5
		mov edx, OFFSET TrueMsg
	.ELSE
		mov edx, OFFSET FalseMsg
	.ENDIF
	
	call WriteString
	call Crlf


	; SEE Alt + DWDD. 

	; Aim is Using Just 1 JMP
	; && case is Simple.  ~(TRUE && TRUE) == FALSE || FALSE	(Demorgan's Law). Can use one jmp











	.IF eax < 1 || eax > 5
		mov edx, OFFSET TrueMsg
	.ELSE
		mov edx, OFFSET FalseMsg
	.ENDIF

	call WriteString
	call Crlf

	; || Case is For Code Situation. A || B -> IF A == TRUE, JMP TRUE, then check IF B == false, JMP FALSE
	; then u can use only 1 JMP


	INVOKE ExitProcess, 0
main ENDP
END main