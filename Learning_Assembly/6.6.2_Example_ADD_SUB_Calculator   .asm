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
Curr SDWORD 0
Opp BYTE ' '
Save SDWORD 0

MAX_DEC DWORD ?

.data

BuffSize = 15

SaveBuff	BYTE BuffSize DUP(' ')
OppBuff		BYTE BuffSize DUP(' ')
CurrBuff	BYTE BuffSize DUP(' ')

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

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	ret
Init ENDP


InChar PROC

	movzx ebx, al
	sub ebx, 48			; - '0'
	
	mov eax, Curr
	mov ecx, 10
	mul ecx
	
	add eax, ebx

	cmp eax, 03B9ACA00h
	jae _EXIT

	mov Curr, eax
	
	_EXIT:
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
	
	mov eax, Save
	mov esi, OFFSET SaveBuff

	call ClearBuff
	call WriteDecToBuffer

	mov edx, OFFSET SaveBuff
	call WriteString
	call Crlf


	mov al, Opp
	mov esi, OFFSET OppBuff + BuffSize - 2
	mov BYTE PTR[esi], al
	
	inc esi
	mov BYTE PTR [esi], 0

	mov edx, OFFSET OppBuff
	call WriteString
	call Crlf
	


	mov eax, Curr
	mov esi, OFFSET CurrBuff

	call ClearBuff
	call WriteDecToBuffer

	mov edx, OFFSET Currbuff
	call WriteString
	call Crlf

	
	ret
Display ENDP

ClearBuff PROC USES eax esi
	mov ecx, BuffSize
	
	_LOOP:
	mov BYTE PTR [esi], ' '
	inc esi
	loop _LOOP

	ret
ClearBuff ENDP



;-------------------------------------------------------------
WriteDecToBuffer PROC USES esi
;	
	mov BYTE PTR [esi], ' '	

	test eax, 80000000h
	jz _SKIP_NEG

	mov BYTE PTR [esi], '-'
	neg eax

	_SKIP_NEG:


	add esi, BuffSize - 1
	mov BYTE PTR [esi], 0

	dec esi

	mov ecx, BuffSize - 3
	mov ebx, 10

	_LOOP:

	cmp eax, 0
	jz _LOOP_END

	mov edx, 0
	div ebx		; eax = eax / 10, edx = eax % 10

	add dl, '0'
	mov BYTE PTR [esi], dl

	
	_LOOP_END:
	dec esi
	loop _LOOP
	
	
	ret
WriteDecToBuffer ENDP
;-------------------------------------------------------------------

END main