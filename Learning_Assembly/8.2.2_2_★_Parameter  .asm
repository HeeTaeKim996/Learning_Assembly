.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO


;	¡Ø Most Common Parameter Stack Addressing Sylte is STDCALL_Style
;	  Commonly No use 'mov esp, ebp'. Simply Remove Stack by N ( N is Sum Of SomeProc's Parameter)
;	  Like Under, CDCEL_Style, STDCALL_Style. STDCALL_Style Is Most Common


.code
main PROC
	
	call Proc1



	INVOKE ExitProcess, 0
main ENDP

PROC1 PROC
	PUSH ebp
	mov ebp, esp


	mov eax, 3
	PUSH eax

	mov eax, 4
	PUSH eax

	call CDCEL_Style
	add esp, 8						; CDCEL_Style. Explicitly Remove 8 Stack





	mov eax, 4
	PUSH eax

	mov eax, 5
	PUSH eax
	
	call STDCALL_Style




	POP ebp
	ret
PROC1 ENDP


CDCEL_Style PROC
	PUSH ebp
	mov ebp, esp
	
	mov eax, DWORD PTR [ebp + 8]
	add eax, DWORD PTR [ebp + 12]

	call DumpRegs


	POP ebp
	ret
CDCEL_Style ENDP



xParam EQU [ebp + 8]
yParam EQU [ebp + 12]

STDCALL_Style PROC
	PUSH ebp
	mov ebp, esp

	mov eax, DWORD PTR xParam
	add eax, DWORD PTR yParam

	call DumpRegs

	POP ebp
	ret 8								; STDCALL_Style. Parameter Using PROC Clear Stack Self(C/C++ Use This Style)
STDCALL_Style ENDP

END main