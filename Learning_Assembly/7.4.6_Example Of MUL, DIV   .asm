.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteInt PROTO
WriteString PROTO
Crlf PROTO

.data
var1 DWORD 1
var2 DWORD 2
var3 DWORD 3
var4 DWORD 4

TooBigMsg BYTE  "Too Big", 0


.code
main PROC


	; бс var4 = ( var1 + var2 ) * var3  б╪ CheckOverflow
	;mov var1, 1000000000
	mov var1, 1
	mov var2, 2
	mov var3, 5

	mov eax, var1
	add eax, var2
	mul var3

	jc _ELSE
	mov var4, eax
	call WriteInt
	call DumpRegs
	jmp _ENDIF

	_ELSE:				; _ELSE On Overflow Occured
	mov edx, OFFSET TooBigMsg
	call WriteString 
	_ENDIF:
	
	
	call Crlf
	call Crlf
	call Crlf



	; бс var4 = (var1 * 5) / (var2 - 3) 
	mov var1, 3
	mov var2, 5


	mov eax, var1
	mov ebx, 5
	mul ebx

	mov ebx, var2
	sub ebx, 3

	idiv ebx
	
	mov var4, eax
	call WriteInt
	call DumpRegs

	
	call Crlf
	call Crlf
	call Crlf





	; бс var4 = ( var1 * -5 ) / ( -var2 % var3 )
	mov var1, 2
	mov var2, 15
	mov var3, 4


	mov eax, var2
	neg eax
	cdq

	idiv var3
	PUSH edx

	mov eax, -5
	imul var1

	POP ebx
	idiv ebx

	mov var4, eax

	call WriteInt
	call DumpRegs





	INVOKE ExitProcess, 0
main ENDP
END main