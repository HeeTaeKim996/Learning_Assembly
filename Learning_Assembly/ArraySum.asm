.386
.model flat, stdcall

	DumpRegs PROTO

.code
ArraySum PROC
;---------------------------------
sum_ptr		EQU [ebp + 8]
len			EQU [ebp + 12]
address		EQU [ebp + 16]
;---------------------------------
	PUSH ebp
	mov ebp, esp

	mov ecx, DWORD PTR len
	cmp ecx, 0
	jle _EXIT

	mov esi, DWORD PTR address
	mov eax, 0
	_WHILE:
	add eax, DWORD PTR [esi]
	add esi, 4
	dec ecx

	cmp ecx, 0
	ja _WHILE


	mov esi, sum_ptr
	mov DWORD PTR [esi], eax

	call DumpRegs

	_EXIT:

	POP ebp
	ret 12
ArraySum ENDP

END