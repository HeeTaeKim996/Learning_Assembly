.386
.model flat, stdcall


.stack
DumpRegs PROTO


.code
ExternFunc PROC USES eax, 
var1:DWORD, var2:DWORD, var3:DWORD
	mov eax, 0

	add eax, var1
	shl eax, 4
	
	add eax, var2
	shl eax, 4

	add eax, var3
	
	call DumpRegs


	ret
ExternFunc ENDP
END