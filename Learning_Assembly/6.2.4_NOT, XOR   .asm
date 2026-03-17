.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteBin PROTO
Crlf PROTO


.data
SetX DWORD 1A67025Fh;
SetY DWORD 834D9A3Bh;

.code
main PROC
	mov eax, SetX
	call WriteBin
	call Crlf

	mov eax, SetY
	call WriteBin
	call Crlf

	mov eax, SetX
	not eax
	call WriteBin
	call Crlf


	mov eax, SetX
	xor eax, SetY
	call WriteBin
	call Crlf





	INVOKE ExitProcess, 0
main ENDP
END main