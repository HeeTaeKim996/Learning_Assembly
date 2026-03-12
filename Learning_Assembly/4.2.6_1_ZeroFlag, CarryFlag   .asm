.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
Crlf PROTO

.data
unsigned DWORD ?
signed SDWORD ?

.code
main PROC
	; ZeroFlag is that operated Value is Zero
	mov eax, 1
	dec eax					; ZeroFlag is 1 (Set After Calculation)
	call DumpRegs


	mov eax, 0FFFFFFFFh
	inc eax
	call DumpRegs			; ZeroFlag is 1

	inc eax
	call DumpRegs			; zeroFlag is 0



	

	
	; CarryFlag : COut XOR M [ Only 1 when (Add & COut is 1) || (Sub && COut is 0) ] 

	mov unsigned, 0FFFFFFFFh	; unsigned has highestValue
	add unsigned, 1			; CF is 1(Add & COut is 1)
	call DumpRegs

	mov unsigned, 3
	sub unsigned, 4			; CF is 1 (Sub & COut is 0)
	call DumpRegs




	mov unsigned, 3
	add unsigned, -4		; CF is 0 (Add & COut is 0). even Though this case is Overflow
	call DumpRegs

	mov unsigned, 0FFFFFFFFh
	sub unsigned, -1		; CF is 0(Sub & COut is 1). even Though this case is Overflow
	call DumpRegs
	; -> even Though this case is Overflow, COut XOR M != 0. so CF = 0



	mov signed, -2	;		
	add signed, -1			; CF is 1 (Add & COut is 1). even Though this case is Not OverFlow
	call DumpRegs

	mov signed, 3
	sub signed, 4			; CF is 1 (Sub & COut is 0). even Though this case is Not OverFlow
	call DumpRegs			

	mov signed, 80000000h
	sub signed,  1			; CF is 0 (Sub & COut is 1). even Though this case is OverFlow
	call DumpRegs


	; ==>> CF is Only Valid when [operand is UnsignedValue and source is not Negative]'s Overflow



	INVOKE ExitProcess, 0	; ZeroFlag is 0
main ENDP
END main
