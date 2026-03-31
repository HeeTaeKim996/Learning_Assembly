.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	
	call LocalSub

	INVOKE ExitProcess, 0
main ENDP




x_local EQU [ebp - 4]

LocalSub PROC
	PUSH ebp
	mov ebp, esp
	sub esp, 4

	mov DWORD PTR x_local, 3

	lea eax, x_local		
	; mov eax, [~] . is Not Operatable. But Using lea, [~]'s ~ Calculated by AGU(AGU is Fast Simple Calculator)
	; So 'ebp - 4' Operated -> mov esi, 'operated ebp - 4' 
	; ¡Ø By This Trait, LEA is Used At Simple Calculation. It's Faster Than ALU


	PUSH eax
	call Twice

	call DumpRegs	; eax == 6


	mov esp, ebp
	POP ebp
	ret
LocalSub ENDP





pointer_x_param EQU [ebp + 8]

Twice PROC
	PUSH ebp
	mov ebp, esp
	
	mov esi, DWORD PTR pointer_x_param
	mov eax, DWORD PTR [esi]
	mov ebx, 2

	mul ebx

	mov DWORD PTR [esi], eax




	POP ebp
	ret 4
Twice ENDP


END main