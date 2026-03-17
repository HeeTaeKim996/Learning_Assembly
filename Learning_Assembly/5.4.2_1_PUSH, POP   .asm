.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteString PROTO
Crlf PROTO

.data
aName BYTE "Abraham Lincoln", 0
nameSize = ($ - aName) - 1

.code
main PROC
	; Stack (PUSH & POP is Common Register Space. (For Any. eax, ebx, ecx, Ram..))
	; So Be Cautious of LIFO Sequence

	mov ecx, nameSize
	mov esi, 0
	L1:
	movzx eax, aName[esi]
	push eax
	inc esi
	loop L1


	mov ecx, nameSize
	mov esi, 0
	L2:
	pop eax
	mov aName[esi], al
	inc esi
	loop L2


	mov edx, OFFSET aName
	call WriteString
	call Crlf




	INVOKE ExitProcess, 0
main ENDP
END main