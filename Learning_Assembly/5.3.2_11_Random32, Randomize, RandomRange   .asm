.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD

Random32 PROTO
DumpRegs PROTO
Randomize PROTO
RandomRange PROTO

.data

randVal DWORD ?

.code
main PROC

	call Random32	; Fill Eax with random value
	call DumpRegs

	call Random32 
	call DumpRegs

	; if You Repeate the program, you will see the same Number in eax.
	; because random Value is From Same Seed. 
	; if You want to change seed, Use Randomsize


	call Randomize	; Change seed
	call Random32
	call DumpRegs


	mov eax, 10
	call RandomRange	; Set eax with random value from 0 to n-1 (9)
	call DumpRegs



	INVOKE ExitProcess, 0
main ENDP
END main