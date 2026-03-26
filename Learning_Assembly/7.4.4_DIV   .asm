.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	
	; �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
	; When Using DIV, Must Know Dividened, Divisor, Quotient, Remainder's Locations
	;	Dividend	/		Divisor		/		Quotient	/		Remainder		's Are Below
	;	AX			/		reg/mem8	/		AL			/		AH
	;	DX:AX		/		reg/mem16	/		AX			/		DX
	;	EDX:EAX		/		reg/mem32	/		EAX			/		EDX

	; So If Divisor is reg/mem16, 32, Keep Clean EDX/DX Before DIV
	; And Div Type Depends On Divisor's Type, Be Cautious On Divisor's Type

	; DIV Preludes Dividened, Divisor is Unsigned

	
	mov eax, 0083h
	mov bl, 2
	div bl
	call DumpRegs	; AH == 1, AX == 41h

	mov edx, 1h
	mov eax, 0083h
	mov ebx, 2
	div ebx
	call DumpRegs	; EAX == 80000041h, EDX = 1



	INVOKE ExitProcess, 0
main ENDP
END main