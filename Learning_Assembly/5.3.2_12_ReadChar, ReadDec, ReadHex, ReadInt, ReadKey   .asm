.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

ReadChar PROTO
ReadDec PROTO
ReadHex PROTO
ReadInt PROTO
ReadKey PROTO

WriteInt PROTO
Crlf PROTO

.data
char BYTE ?

.code
main PROC
	mov eax, 0

	call ReadChar	
	; If an extended key was pressed, fill AL = 0, fill AH with keyboard scan code
	; Else, Fill AL with Ascii key value, ¡Ø AH is keyboard san code (same)4
	
	call DumpRegs



	call ReadDec	; Fill eax with Inputed keyboard values
	call WriteInt
	call Crlf


	call ReadHex	; Fill eax with Hex 
	call DumpRegs

	call ReadInt 
	call DumpRegs

	call ReadKey	
	; it doesn't wait. it checks 'Current' inputed key value. if true, fill AL with ASCII
	call DumpRegs



	INVOKE ExitProcess, 0
main ENDP
END main