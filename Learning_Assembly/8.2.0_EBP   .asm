.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO





.code
main PROC
	
	call FirstProc


	; ¡Ø EBP
	;	- PUSH -> ESP Decreases. POP -> ESP Increases
	;   - PROC's Base Structure is 
	;		PUSH ebp / mov ebp, esp / sub esp, n (local Vraible Space) / ...
	;		/ mov esp, ebp	/ POP ebp
	;	- EBP + n Indicates Parameter
	;	  ESP - n Indicates LocalVariable


	INVOKE ExitProcess, 0
main ENDP


FirstProc PROC
	PUSH ebp
	mov ebp, esp

	sub esp, 4

	mov DWORD PTR [ebp - 4], 10
	mov eax, DWORD PTR [ebp - 4]
	call DumpRegs


	lea eax, [ebp - 4]		; LEA [~] : Calculate ~ By AGU ( Fast Calculate. Not ALU). And Move ~ To Dest
	PUSH eax

	call Twice
	
	mov eax, DWORD PTR [ebp - 4]
	call DumpRegs


	mov esp, ebp
	POP ebp
	ret
FirstProc ENDP



Twice PROC
	PUSH ebp
	mov ebp, esp

	mov ebx, [ebp + 8]
	mov eax, DWORD PTR [ebx]

	mov ecx, 2
	mul ecx

	mov DWORD PTR [ebx], eax



	mov esp, ebp
	POP ebp
	ret
Twice ENDP



END main