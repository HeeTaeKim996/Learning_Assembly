.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
Clrscr PROTO
ReadChar PROTO
WriteString PROTO
Crlf PROTO

.data
Curr DWORD 0

Opp BYTE ' '
Save DWORD 0

DEC_SIZE = 8
MAX_DEC DWORD ?

.data
BufferSize = DEC_SIZE
Buff1 BYTE BufferSize DUP(' ')

; dump BYTE 1000 DUP(0)

SecondBuffSize = BufferSize + 2
SecondBuff BYTE SecondBuffSize DUP(' ')


.code
main PROC
	call Init

	call Display

	_LOOP_BEGIN:
	
	call ReadChar

	cmp al, '0'
	jb _NOT_DEC

	cmp al, '9'
	ja _NOT_DEC

	call InChar
	jmp _LOOP_END

	_NOT_DEC:

	cmp al, '+'
	jnz _CHECK_SUB
	call AddOpp
	jmp _LOOP_END


	_CHECK_SUB:
	cmp al, '-'
	jnz _NOT_OPP
	call AddOpp
	jmp _LOOP_END


	_NOT_OPP:
	cmp al, 13
	jnz _LOOP_END
	call AddEnter
	jmp _LOOP_END


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



AddOpp PROC
	movzx eax, al
	PUSH eax

	mov al, Opp
	
	cmp al, '+'
	jnz _CHECK_SUB

	mov ebx, Save
	add ebx, Curr
	mov Curr, ebx
	jmp _OPP_FINISHED

	_CHECK_SUB:
	cmp al, '-'
	jnz _NO_OPP

	mov ebx, Save
	sub ebx, Curr
	mov Curr, ebx
	jmp _OPP_FINISHED


	

	_OPP_FINISHED:
	mov ebx, Curr
	mov Save, ebx
	mov Curr, 0


	_NO_OPP:
	mov ebx, Curr

	cmp ebx, 0
	jz _REPLACE_OPP

	mov Save, ebx
	mov Curr, 0

	_REPLACE_OPP:
	

	POP eax
	mov Opp, al
	
	ret
AddOpp ENDP


AddEnter PROC
	mov al, Opp
	
	cmp al, '+'
	jnz _CHECK_SUB

	mov ebx, Save
	add ebx, Curr
	mov Curr, ebx
	jmp _FINISHED

	_CHECK_SUB:
	cmp al, '-'
	jnz _FINISHED

	mov ebx, Save
	sub ebx, Curr
	mov Curr, ebx
	jmp _FINISHED

	_FINISHED:
	
	mov ebx, Curr
	mov Save, ebx
	mov Curr, 0

	mov Opp, ' '

AddEnter ENDP



Display PROC
	
	call Clrscr

	mov ecx, SecondBuffSize
	mov esi, OFFSET SecondBuff

	_LOOP_CLR_SECOND:
	mov BYTE PTR [esi], ' '
	inc esi
	loop _LOOP_CLR_SECOND

	mov eax, Save
	mov esi, OFFSET SecondBuff

	call WriteDecToBuffer

	add esi, 1
	mov al, Opp
	mov BYTE PTR [esi], al
	


	mov edx, OFFSET SecondBuff
	call WriteString
	call Crlf

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