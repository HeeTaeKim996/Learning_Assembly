.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO


.data
first	BYTE	"12345", 0
second	BYTE	"12395", 0

.code
main PROC
	
	mov ecx, 5
	mov esi, OFFSET first
	mov edi, OFFSET second
	cld

	PUSH esi

	repe CMPSB			; 『 REPE : Repeat While ECX > 0 && Equal (ZF == 1). Also DEC Ecx By 1
	; 『 CMPSB : cmp BYTE PTR [esi], BYTE PTR [edi]


	call DumpRegs		; 『 SF == 1 (cmp ESI, EDI)

	POP edi
	sub esi, edi

	call DumpRegs		; 『 ESI == 4
	


	; 『 CMPSW (CMPSD) Also Same. cmp WORD(DWORD) PTR [esi], WORD(DWORD) PTR [edi]

	INVOKE ExitProcess, 0
main ENDP
END main