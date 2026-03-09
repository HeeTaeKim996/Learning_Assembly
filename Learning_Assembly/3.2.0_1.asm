TITLE Add and Substract

INCLUDE Irvine32.inc
includelib Irvine32.lib

.code
main PROC
	mov eax, 10000h
	add eax, 40000h
	sub eax, 20000h

	call DumpRegs ; Display registers

	exit ; IrvineAPI. End Prcessor
main ENDP
END main