.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO



.code

sub1 PROC, var1 : DWORD
	mov eax, var1

	call DumpRegs


	ret
sub1 ENDP


	
END