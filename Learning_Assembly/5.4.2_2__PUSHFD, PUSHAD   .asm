.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code
main PROC
	pushfd										; PUSH EFLAGS
	call DumpRegs


    ; --- FOR Changing EFLAGS---
    mov al, 0FFh        
    add al, 1           

    mov eax, 7FFFFFFFh  
    add eax, 1          
    ; ---------------------------------------

	call DumpRegs

	popfd										; POP EFLAGS
	call DumpRegs



	mov eax, 1
	mov ebx, 2
	mov ecx, 3
	mov edx, 4

	pushad										; PUSH All Registers
	call DumpRegs

	mov eax, 9
	mov ebx, 8
	mov ecx, 7
	mov edx, 6
	call DumpRegs
	

	popad										; POP All Registers
	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP
END main