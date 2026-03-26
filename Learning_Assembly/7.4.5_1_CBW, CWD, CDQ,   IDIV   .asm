.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
Crlf PROTO
WriteInt PROTO


.code
main PROC
	; бс CBW, CWD, CDQ

	; CBW, CWD, CDQ Are BitExtension For IDIV.

	mov eax, 0

	; бр CBW ( Convert Byte to Word ) : AL -> AX (Bit Extension)
	mov al, -101		; 9BH
	call DumpRegs
	cbw
	call DumpRegs		; AX == FF9Bh

	call Crlf
	call Crlf
	

	; бр CWD ( Convert Word to DoubleWord ) : AX -> DX:AX
	mov ax, -101		; FF9BH
	call DumpRegs
	cwd
	call DumpRegs		; DX == FFFFh, AX == FF9Bh

	call Crlf
	call Crlf


	; бр CDQ	( Convert DoubleWord To QuadWord )
	mov eax, -101		; FFFFFF9Bh
	call DumpRegs
	cdq
	call DumpRegs		; EAX == FFFFFF9Bh, EDX == FFFFFFFFh

	call Crlf
	call Crlf










	; бс IDIV
	; - IDIV is Sign Version Of DIV.
	; - Before IDIV, CBW, CWD, CDQ Are Recommanded
	mov eax, 0

	mov al, -48
	cbw
	mov bl, 5
	idiv bl

	call DumpRegs		; al == -9, ah == -3



	call Crlf
	call Crlf



	mov ax, -5000
	cwd
	mov bx, 256

	idiv bx
	call dumpRegs	; AX == -19, DX == -136


	mov eax, 50000
	cdq
	mov ebx, -256

	idiv ebx
	call DumpRegs	; EAX == -195, EDX == 80



	INVOKE ExitProcess, 0
main ENDP
END main