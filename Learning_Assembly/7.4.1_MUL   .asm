.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO
Crlf PROTO
WriteHex PROTO


.data
val DWORD 3
bVal BYTE 2
wVal WORD 16
dwVal DWORD 100h 

.code
main PROC
	mov eax, 5
	mov ebx, 4
	
	mul ebx
	call WriteInt		; 20
	call Crlf

	mov eax, 5
	mul val
	call WriteInt		; 15
	call Crlf

	; Multiplier can be reg | mem






	call Crlf
	call Crlf
	call Crlf



	; Multiplied Must Matched With Muplier's Size.
	; IF Multiplier == BYTE,	Mutiplied == AL.	Destination == AX			( * 2 Size )
	; If Multiplier == WORD,	Mutiplied == AX,	Destination == DX : AX		( * 2 Size )
	; If Multiplier == DWORD,	Multiplied == EAX,	Destination == EDX : EAX	( * 2 Size )
	
	mov ah, 12h
	mov al, 12h

	mul bVal
	call DumpRegs ; ah 12 is Cleared. Just 0006
	

	mov eax, 12341234h
	mul wVal			; Multiply 16 ( << 4 )
	call DumpRegs		; Upper 1234h Is Same.  DX == 0001h, AX == 2340h

	

	mov eax, 12341234h
	mul dwVal			; Multiply 100h ( << 8 )
	call DumpRegs		; DX == 12h,  EAX == 34123400h 

	INVOKE ExitProcess, 0
main ENDP
END main