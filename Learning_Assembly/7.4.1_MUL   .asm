.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO
Crlf PROTO
WriteHex PROTO



.code
main PROC

	; ! MUL Preludes Mutiplier is Unsigned. So Bit Extension is Zero-Extension. NOT Sign Extension


	; бс  Multiplied Must Matched With Muplier's Size.
	;	Dest		/		Multiplied		/		Mutiplier		Are Below

	;	AX			/		AL				/		reg/mem8
	;	DX:AX		/		AX				/		reg/mem16
	;	EDX:EAX		/		EAX				/		reg/mem32

	
	; бс If Dest's Upper Bits (AH, DX, EDX) is Zero, CF == 0, If Not Zero, CF == 1
	
	mov eax, 0


	mov ah, 12h
	mov al, 12h
	mov bl, 2

	mul bl
	call DumpRegs ; AH 12 is Cleared. AL == 24. CF == 0
	

	mov eax, 12341234h
	mov bx, 16
	mul bx				; Multiply 16 ( << 4 )
	call DumpRegs		; Upper 1234h Is Same.  DX == 0001h, AX == 2340h. CF == 1

	

	mov eax, 12341234h
	mov ebx, 100h
	mul ebx				; Multiply 100h ( << 8 )
	call DumpRegs		; EDX == 12h,  EAX == 34123400h. CF == 1

	INVOKE ExitProcess, 0
main ENDP
END main