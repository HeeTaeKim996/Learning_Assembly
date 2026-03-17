.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteBin PROTO
Crlf PROTO


.data
a1 BYTE 0A9h



.code
main PROC
	
	; TEST is similar with AND. But Result Doesn't change Destination
	; Bool Cal Affects EFLAGS. So Test Is For Checking EFLAGS will be result


	movzx eax, a1
	call WriteBin
	call Crlf

	test eax, 00001001b
	call DumpRegs		; No eax changed. but EFLAGS is changed
	
	

	; CMP is similar with SUB. But Result Doesn't change Destination
	; It Can Change CF, ZF -> Can Judge <, > , !=, =
	; if CF == 0,	ZF == 1	-> Dest = Source
	; if CF == 1,	ZF == 0 -> Dest < Source
	; if CF == 0,	ZF == 0	-> Dest > Source

	movzx eax, a1
	cmp al, 0A9h
	call DumpRegs	; CF == 0, ZF == 1

	cmp al, 0AAh
	call DumpRegs	; CF == 1, ZF == 0

	cmp al, 0A8h
	call DumpRegs	; CF == 0, ZF == 0



	INVOKE ExitProcess, 0
main ENDP
END main