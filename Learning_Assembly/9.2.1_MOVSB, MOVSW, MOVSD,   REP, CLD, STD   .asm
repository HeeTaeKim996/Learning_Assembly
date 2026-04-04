.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
DumpRegs PROTO
WriteString PROTO
Crlf PROTO
	
.data 
src1 BYTE "Harry"
src2 BYTE "Borii"

des1 BYTE 10 DUP('-'), 0
des2 BYTE 10 DUP('-'), 0

.code
main PROC
	
	mov ecx, 5
	mov esi, OFFSET src1
	mov edi, OFFSET des1

	cld							; 『 CLD : Set DirectionFlag Increase
	rep MOVSB					; 『 REP : Repeate StringPrimitive, While ecx > 0. DEC ECX By One
	; 『 MOVSB : Copy BYTE From Source(ESI) And Past To Destination(EDI)
	;	After That, Increase Or Decrease ESI-EDI. It Depends On DirectionFlag

	; 『 CLD : Set DestinationFlag Increase
	;   STD	: Set DestinationFlag Decrease 


	mov edx, OFFSET des1
	call WriteString
	call Crlf
		





	mov ecx, 5
	mov esi, OFFSET src2
	add esi, LENGTHOF src2 - 1

	mov edi, OFFSET des2
	add edi, LENGTHOF des2 - 1

	std							; 『 STD : Set DestinationFlag Decrease
	rep MOVSB

	mov edx, OFFSET des2
	call WriteString
	call Crlf

	

	; 『 MOVSW, MOVSD Also Same. But Copy And Past By 2(4) Bytes. Also Increase/Decrease ESI-EDI After That


	INVOKE ExitProcess, 0
main ENDP
END main