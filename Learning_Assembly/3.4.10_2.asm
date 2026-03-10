
.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD

.data
smallArray DWORD 10 DUP(0) 
; TYPE n DUP(a) : Array of Type. size is n. filled with a

.data? ; .data? is efficient when Varaible is not assigned with value
bigArray DWORD 5000 DUP(?) ; ? means not assigning value

.code
main PROC

	INVOKE ExitProcess, 0

main ENDP
END main
