.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

.data
bVar BYTE ?
wVar WORD ?
dwVar DWORD ?
qwVar QWORD ?



arr1 BYTE 10, 20, 30
arr2 WORD 6 DUP(?), 1, 2

.code
main PROC
	mov eax, TYPE bVar	; TYPE == sizeof
	call DumpRegs

	mov eax, TYPE wVar
	call DumpRegs

	mov eax, TYPE dwVar
	call DumpRegs

	mov eax, TYPE qwVar
	call DumpRegs


	mov eax, LENGTHOF arr1	; LENGTHOF == len
	call DumpRegs

	mov eax, LENGTHOF arr2	; 6 + 2 = 8
	call DumpRegs


	mov eax, SIZEOF arr1	; SIZEOF == TYPE * LENGTHOF
	call Dumpregs

	mov eax, SIZEOF arr2	; 2 * 8 = 16
	call DumpRegs
	
	INVOKE ExitProcess, 0
main ENDP
END main