.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteHex PROTO
Crlf PROTO
WriteString PROTO

.data
Msg BYTE 2 DUP(?), 0


; ¡Ø Unpacked BCD is Saving Decimal ( 0 ~ 9 ) To Byte


.code
main PROC

	; ¡á AAA : For Adding of Asci's Decimal ('1', '2', ... , '9')


	mov eax, '8'	; '8' == 30h + 8 == 38h
	mov ebx, '4'	; '4' == 30h + 4 == 34h

	call DumpRegs	; eax == 38h, ebx == 34h

	add al, bl		; al == 38h + 34h == 6Ch		¡Ø Adding Must be On 'AL'

	call WriteHex
	call Crlf

	aaa				
	; Asci's decimal add means 30h + a + 30h + b == 60h + a + b

	; IF ( al & 0Fh ) > 9 ( means a + b > 9 && a + b < 16 )  ||  AF == 1 (means a + b >= 16)
	; Set AH = AH + 1,	AL = AL - 60h - Ah 
	; ELSE,
	; Set AH = AH,		AL = AL - 60h


	call DumpRegs

	or ax, 3030h		; Set a, b To Asci's a, b 
	call DumpRegs

	mov esi, OFFSET Msg
	mov BYTE PTR [esi], ah
	mov BYTE PTR [esi + 1], al

	mov edx, esi
	call WriteString
	call Crlf

	INVOKE ExitProcess, 0
main ENDP
END main