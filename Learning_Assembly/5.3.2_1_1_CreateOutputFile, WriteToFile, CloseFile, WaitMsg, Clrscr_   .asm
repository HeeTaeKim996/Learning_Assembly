.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
CreateOutputFile PROTO
WriteToFile PROTO
CloseFile PROTO

WaitMsg PROTO
Clrscr PROTO



.data
filename BYTE "Test/newfile.txt", 0					; File 'Test' is must be. otherwise, no create
fileHandle DWORD ?

buffer BYTE "Test Texts", 0dh, 0ah
buffSize DWORD ($ - buffer)


.code


main PROC
	mov edx, OFFSET filename
	call CreateOutputFile		; CreateFle. and fill eax with HANDLE
	mov fileHandle, eax
	

	mov eax, fileHandle
	mov edx, OFFSET buffer
	mov ecx, buffSize
	call WriteToFile


	call WaitMsg				; Wait until use push any key
	call Clrscr					; Clear console Msg

	mov eax, fileHandle
	call  CloseFile				; close File, handle must be in eax


	INVOKE ExitProcess, 0
main ENDP
END main



