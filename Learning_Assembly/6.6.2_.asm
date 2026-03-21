.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
Clrscr PROTO
ReadChar PROTO
WriteString PROTO

.data
Opp BYTE ' '
Curr DWORD 0

DEC_SIZE = 8
MAX_DEC DWORD ?

.data
BufferSize = DEC_SIZE
Buff1 BYTE BufferSize DUP(' ')

.code
main PROC
	call Init


	_LOOP_BEGIN:
	
	call ReadChar

	cmp al, '0'
	jb _NOT_DEC

	cmp al, '9'
	ja _NOT_DEC

	call InChar
	jmp _LOOP_END

	_NOT_DEC:


	_LOOP_END:
	call Display


	jmp _LOOP_BEGIN


	INVOKE ExitProcess, 0
main ENDP


Init PROC

	mov eax, 1
	mov ecx, DEC_SIZE - 1
	mov ebx, 10

	_LOOP:
	mul ebx
	loop _LOOP

	mov MAX_DEC, eax


	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	ret
Init ENDP


InChar PROC

	movzx ebx, al
	sub ebx, 48
	
	mov eax, Curr
	cmp eax, MAX_DEC
	jae _Exit
	
	mov ecx, 10
	mul ecx

	add eax, ebx
	mov Curr, eax
	_Exit:


	ret
InChar ENDP


Display PROC
	
	call Clrscr
	mov ecx, BufferSize
	mov esi, OFFSET Buff1

	_Loop_Clr:
	mov BYTE PTR [esi], ' '
	inc esi
	loop _Loop_Clr


	mov eax, Curr
	mov esi, OFFSET Buff1

	call WriteDecToBuffer

	mov edx, OFFSET Buff1
	call WriteString
	
	ret
Display ENDP

;-------------------------------------------------------------
WriteDecToBuffer PROC
;	
;	Write Decimal To Buffer
;
;	Receives :	EAX - Decimal
;				ESI - OFFSET Of Buffer
	mov ebx, 10
	mov ecx, DEC_SIZE
	add esi, DEC_SIZE

	PUSH esi

	_LOOP:
	cmp eax, 0
	jz _LOOP_EXIT

	mov edx, 0
	div ebx

	add dl, '0'
	mov BYTE PTR[esi], dl

	jnz _LOOP_END
	mov BYTE PTR [esi], ' '

	_LOOP_END:
	dec esi
	loop _LOOP

	_LOOP_EXIT:
	POP esi
	inc esi
	
	ret
WriteDecToBuffer ENDP
;-------------------------------------------------------------------

END main