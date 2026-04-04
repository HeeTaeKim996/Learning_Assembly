.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

	
.data
alpha BYTE "ABCDEFGHI", 0


.code
main PROC
	
	mov ecx, LENGTHOF alpha
	mov edi, OFFSET alpha
	mov al, 'F'

	cld
	PUSH edi

	repne scasb				; 『 REPNE : REP While ECX > 0 &&  Not Same (ZF == 0). Also Dec ECX By 1
	; 『 SCASB : cmp al, BYTE PTR [edi]


	call DumpRegs			; 『 ZF == 1

	POP ebx
	sub edi, ebx

	call DumpRegs			; 『 EDI == 6 ('F' is Sixth)
		
	



	; 『 SCASW(D) Is Also Same. cmp AX(EAX), WORD(DWORD) PTR [edi]


	INVOKE ExitProcess, 0
main ENDP
END main