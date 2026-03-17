.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
MsgBox PROTO
MsgBoxAsk PROTO

.data
caption BYTE "Dialog Title", 0
HelloMsg BYTE "This is a pop-up message box.", 0dh, 0ah
	BYTE "Click OK to continue...", 0

caption2 BYTE "Survey Completed", 0
question BYTE "Thank you for completing the survey.", 0dh, 0ah
	BYTE "Would you like to receive the results?", 0

.code
main PROC
	mov ebx, OFFSET caption
	mov edx, OFFSET HelloMsg	
	call MsgBox						; MsgBox

	mov ebx, OFFSET caption2
	mov edx, OFFSET question
	call MsgBoxAsk					; MsgBoxAsk


	INVOKE ExitProcess, 0
main ENDP
END main

