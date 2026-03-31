.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
		
	call LocalExample



	INVOKE ExitProcess, 0
main ENDP



; ¡Ø LOCAL varName1:TYPE1, varName2:TYPE2
;	-> Make ENTER (Sum Of TYPE), 0
;			LEAVE


;	-> Under Code,	mov BYTE PTR bVal, 1 == mov BYTE PTR [ebp - 1]		(Use 1 BYTE)
;					mov WORD PTR dVal, 2 == mov WORD PTR [ebp - 4]		(Use 2 BYTE. Leave 1 BYTE Dummy )
;				   
;				 

LocalExample PROC
	LOCAL bVal : BYTE, dVal : WORD


	mov BYTE PTR bVal, 1
	movzx eax, bVal


	mov WORD PTR dVal, 2
	movzx ebx, dVal

	
	call DumpRegs


	ret
LocalExample ENDP


END main