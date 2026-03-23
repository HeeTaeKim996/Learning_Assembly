.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO
Crlf PROTO


.code
main PROC
	
	mov eax, 1

	.WHILE eax < 3
		inc eax
		call WriteInt
		call Crlf
	.ENDW

	; See Alt + DWDD

	; .WHILE is Same as While(C++).
	; See Machine Languate. At .ENDW Location, cmp eax, 3 + jb To inc eax
	; And At .WHILE Location, Directly JMP .ENDW Location
	; Its Like Added JMP Version Of Do-While



	call Crlf


	.REPEAT 
		inc eax
		call WriteInt
		call Crlf
	.UNTIL eax >= 2

	; .REPEAT is Similar With Do-While(C++). But, Condition is Reverse. .UNTIL FALSE, Repeat. NOT TURE.
	



	INVOKE ExitProcess, 0
main ENDP
END main