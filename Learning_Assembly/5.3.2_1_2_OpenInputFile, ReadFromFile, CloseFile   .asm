.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
OpenInputFile PROTO
ReadFromFile PROTO
WriteString PROTO
CloseFile PROTO

.data
filename BYTE "Test/newfile.txt", 0
fileHandle DWORD ?
buffer BYTE 5000 DUP(?)
bytesRead DWORD ?


.code
main PROC
	; 1. Open File
	mov edx, OFFSET filename
	call OpenInputFile
	mov fileHandle, eax
	
	; 2. Get Contents
	mov edx, OFFSET buffer		; Filled OFFSET
	mov ecx, 5000				; Max Byte's To Read
	call ReadFromFile


	mov edx, OFFSET buffer
	call WriteString

	; 3. Close File
	mov eax, fileHandle
	call CloseFile



	INVOKE ExitProcess, 0
main ENDP
END main