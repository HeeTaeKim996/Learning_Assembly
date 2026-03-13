.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO


.data
dwValue DWORD 12345678h

wordList WORD 5678h, 1234h

.code
main PROC
	mov eax, 0
	mov ax, WORD PTR dwValue	; Normally PTR is used to DownSize Value
	call DumpRegs

	mov eax, 0
	mov al, BYTE PTR dwValue	; Because x86 is littel endian, 12 34 56 78 -> '78' is Front Byte
	call DumpRegs
	
	mov al, BYTE PTR dwValue + 1	; 56
	call DumpRegs

	mov al, BYTE PTR dwValue + 3	; 12
	call DumpRegs



	mov eax, DWORD PTR wordList;	; PTR also can used like this. To Combine Bytes.
	call DumpRegs					; Because little endian, 5678 + 1234 -> 12345678


	INVOKE ExitProcess, 0
main ENDP
END main
