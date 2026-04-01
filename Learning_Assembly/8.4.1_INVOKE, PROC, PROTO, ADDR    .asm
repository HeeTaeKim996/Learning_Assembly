.386
.model flat, stdcall

includelib Irvine32.lib



; ¡Ø INVOKE - PROC (Declare Parameters)- PROTO 
;	- This 3 Directive Are Used By Trio. For Simply Pushing Parameters.
;	- This Trio Is Not Recommanded On Learning Assembly. But If u Use Assembly Seriously, 
;	  This Trio Can Make Pushing Parameters Simple.
;	- to Use INVOKE, Need PROC (Declare Parameters. Like Under), PROTO (Declare PROC. And PROC's Parameter's Types)

; ¡Ø INVOKE - ADDR 
;  - ADDR is Used On INVOKE'S Parameter PUSHING.
;  - It Simply Help Running Time's Address Pushing. 
;	 ( Just Simple Using Of LEA On INVOKE )


.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
PushParam PROTO, x:DWORD, y:DWORD, z:DWORD										; To Use INVOKE, Declare Parameters
PushArr PROTO, addr_param : DWORD, type_param : DWORD, length_param : DWORD

.data
arr DWORD 4, 5, 6


.code
main PROC
	
	mov eax, 0

	PUSH 3
	PUSH 2
	PUSH 1
	call PushParam

	mov eax, 0
	INVOKE PushParam, 1, 2, 3													; INVOKE Hels Pushing Parameters



	mov eax, 0
	INVOKE PushArr, ADDR arr, TYPE arr, LENGTHOF arr							; Used ADDR On INVOKE. Simple LEA.


	PUSH 0
	call ExitProcess
main ENDP




PushParam PROC, x_param : DWORD, y_param : DWORD, z_param : DWORD				; To Use INVOKE, Declare Parameters
	shl eax, 4
	add eax, x_param

	shl eax, 4
	add eax, y_param

	shl eax, 4
	add eax, z_param

	call DumpRegs

	ret													; If Use PROC Declare Parameters, Doesn't Need ret N
PushParam ENDP


PushArr PROC USES ecx esi, 
addr_param : DWORD, type_param : DWORD, length_param : DWORD
	mov ecx, length_param
	mov esi, addr_param


	.WHILE ecx > 0
	shl eax, 4
	add eax, DWORD PTR [esi]

	dec ecx
	add esi, type_param
	.ENDW

	call DumpRegs

	ret
PushArr ENDP




END main