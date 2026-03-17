.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteBin PROTO
Crlf PROTO
WriteString PROTO

.data
array BYTE "AbCdEf", 0


.code
main PROC
	mov eax,	10101111b	
	and al,		11110110b
	call WriteBin
	call Crlf




	mov esi, OFFSET array
	mov ecx, LENGTHOF array - 1
	L1:
	and BYTE PTR [esi], 11011111b ; Clear bit 5. Change LowerCase To UpperCase
	; ' ' is 00100000b. so. if 00100000b And 11011111 , be 0 (==\n). So It doesn't work in ' ' 
	
	
	inc esi
	loop L1

	mov edx, OFFSET array
	call WriteString
	call Crlf

	

	mov eax,	11100011b
	or al,		00000100b
	call WriteBin
	call Crlf


	INVOKE ExitProcess, 0
main ENDP
END main