.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO

.data
; ALIGN : ALIGN {bound} is only Affect Next variable's address. 
;		  next variable's address must be {bound} * N 
var1 BYTE ?		; 0
var2 BYTE ?		; 1
ALIGN 1			; ALIGN 1 is Same as None				
var3 BYTE ?		; 2
ALIGN 2			; Next variable's adress must be 2 * N
var4 BYTE ?		; 4

var5 BYTE ?		; 5

ALIGN 4
var6 BYTE ?		; 8


.code
main PROC
	mov esi, OFFSET var1
	call DumpRegs
	mov esi, OFFSET var2
	call DumpRegs
	mov esi, OFFSET var3
	call DumpRegs
	mov esi, OFFSET var4
	call DumpRegs
	mov esi, OFFSET var5
	call DumpRegs
	mov esi, OFFSET var6
	call DumpRegs
	
	INVOKE ExitProcess, 0
main ENDP
END main


