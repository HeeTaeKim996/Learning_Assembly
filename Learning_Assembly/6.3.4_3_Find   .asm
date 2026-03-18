.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO

.data
arr DWORD 1h, 2h, 3h, 5h, 7h

.code
main PROC
	mov eax, 5h
	mov ebx, TYPE arr
	mov ecx, LENGTHOF arr
	mov esi, OFFSET arr
	call Find

	call DumpRegs


	INVOKE ExitProcess, 0
main ENDP



;-------------------------------------------------
Find PROC USES ecx esi
;		
;		Find Matched Index
;		Receives:	EAX = Find Value
;					EBX = TYPE
;					ESI = OFFSET
;					ECX	= LENGTHOF
;		 Returns :	EDX	= Index
;--------------------------------------------------
	mov edx, ecx

	L1:
	cmp DWORD PTR [esi], eax
	jz _FOUND


	add esi, ebx
	loop L1

	_FOUND:
	sub edx, ecx
	ret
Find ENDP
END main