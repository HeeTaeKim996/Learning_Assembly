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
	
	; IMUL Preludes Multiplier is Sign. So Bit-Extension is Sign-Extension
	
	; IMUL Use Single Operand Form / Two-Three Operand Form. 
	; Dest, OF-CF Are Different with Form

	



	; бс Single - Operand Form
	;  - Similar With MUL. Dest is Based On Multiplier's size. BYTE -> AX, WORD -> DX : AX, DWORD -> EDX : EAX 
	;  - But OF-CF is Differnt. Because Dest size is Twice Than Multiplied/Mutiplier, Never Overflow
	;    So, OF-CF used in different way. 

	;    If Dest's Low Bits's Sign(MAX) Bit is Same With High Bit's Bit => OF == CF == 0
	;	 Which Means you don't need to check High Bits. Only Need Low Bits.

	;    But If Low Bits's Sign(MAX) Bit is Different With High Bit's Bit => OF == CF == 1
	;    Which Means you Need To Check High Bits
	
	mov eax, 0

	mov al, 48
	mov bl, 4
	imul bl			; AH == 00h, AL == 192 == C0h

	call WriteInt
	call Crlf
	call DumpRegs	; AH's Bits Are 0, But AL's Max Bit is 1. So OF == CF == 1



	mov al, -4
	mov bl, 4
	imul bl			; AH == FFh, AL == 16 == F0h

	call DumpRegs	; AH's Bits Are 1, And AL's Max Bit is 1. So OF == CF == 0 ( You Dont Need To Check AH )






	; бс Two/Three - Operand Form

	; Two Operand Form		: Dest(Operand), Multiplier(Operand)
	; Three Operand Form	: Dest, Mutiplied(Operand), Multiplier(Operand)

	; Two/Three Operand Form's Dest's Sizs is Same With Source Size. 
	; So Overfloww is Occurable. If OverFlow Occurs, OF == CF == 1

	mov eax, 0


	mov eax, -16
	mov bx, 2
	imul ax, bx		; ax == -32
	call WriteInt
	call Crlf
	call DumpRegs	; CF == OF == 0

	
	mov ax, 7FFFh;
	imul bx, ax, 2
	call WriteInt	; Overflowed
	call Crlf
	call DumpRegs	; CF == OF == 1





	INVOKE ExitProcess, 0
main ENDP
END main