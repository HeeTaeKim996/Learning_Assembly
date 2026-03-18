.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO


.data
V1 DWORD 3
V2 DWORD 7
V3 DWORD 2

.code
main PROC
	; Get Max - Two Compare -> Compare eax, ebx. Max mov to edx
	mov eax, 1
	mov ebx, 2

	mov edx, eax
	cmp eax, ebx
	jae T1
	mov edx, ebx

	T1:
	call DumpRegs


	; GetMin - Three Compare -> Compare V1, V2, V3. Min mov to eax
	mov eax, V1
	
	cmp eax, V2
	jbe T2
	mov eax, V2

	T2:
	cmp eax, V3
	jbe T3
	mov eax, V3

	T3:
	call DumpRegs


	INVOKE ExitProcess, 0
main ENDP
END main