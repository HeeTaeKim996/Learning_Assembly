TITLE Sample_WriteInt

INCLUDE Irvine32.inc
includelib Irvine32.lib

.code

main PROC
	mov eax, 5
	add eax, 6
	call WriteInt	; display value in eax
	exit
main ENDP

END main