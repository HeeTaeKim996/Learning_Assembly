.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteString PROTO


.data
dwArray DWORD 1h, 2h, 3h, 4h, 5h


source BYTE "this is the source string", 0
dest BYTE SIZEOF source DUP(0)


.code
main PROC
	
	jmp BOT
	
	invoke DumpRegs	; This won't be called

	BOT:


	mov eax, 0
	mov ecx, 5

L1:
	inc ax
	loop L1			; do Jump while ecx > 0. by Loop, DEC ecx

	call DumpRegs	; 5





	; Like under code, by Using LOOP, LENGTHOF, TYPE, Can Access Array's All Component
	mov edi, OFFSET dwArray
	mov ecx, LENGTHOF dwArray
	mov eax, 0

L2:
	add eax, DWORD PTR [edi]	
	add edi, TYPE dwArray
	loop L2

	call DumpRegs		; Fh



	; Other Example of LOOP
	mov esi, 0
	mov ecx, LENGTHOF source
L3:
	mov al, source[esi]
	mov dest[esi], al
	inc esi
	loop L3

	mov edx, OFFSET dest
	call WriteString


	INVOKE ExitProcess, 0
main ENDP
END main

