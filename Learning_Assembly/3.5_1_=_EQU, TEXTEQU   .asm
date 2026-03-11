TITLE = And EQU, TEXTEQU

.386
.model flat, stdcall

includelib Irvine32.lib

.stack
ExitProcess PROTO, dwExitCode:DWORD
WriteInt PROTO	; Irvine32.lib
WriteHex PROTO	; Irvine32.lib
Crlf PROTO		; Irvine32.lib


; # =
COUNT = 500				; = is similar to #define. only integar. chanagable

.data
; # $
CurrLocation DWORD $ ; $ means current location

list BYTE 10, 20, 30, 40
ListSize = ($ - list) ; $ can used like this

wordList WORD 1, 2, 3
WordListSize = ($ - wordList) / 2 ; If not byte, must Divide with sizeof


; # EQU
matrix1 EQU 10 * 10			; EQU is similar to =. but EQU is not revisable
matrix2 EQU <10 * 10>		; EQU and <~> combi can be used for text and float

M1 WORD matrix1 ; 100
M2 WORD matrix2 ; 10 * 10 --> 100


; # TEXTEQU : TEXTEQU is used when <?, ? ... ?> ? is Subsitutable 
a1 DWORD ? 
rowSize = 5
count2 TEXTEQU %(rowSize * 2)	; TEXTEQU & %(~) : ~ output is cast to Text 
move TEXTEQU <mov>				; TEXTEQU can use before TextMacro
setupAL TEXTEQU <move a1, count2> ; TEXTEQU can use Text with Subsisuted values


.code
main PROC
	mov eax, COUNT
	call WriteInt
	call Crlf

	COUNT = 600 ; = is Changable
	mov eax, COUNT
	call WriteInt
	call Crlf

	mov eax, CurrLocation
	call WriteHex
	call Crlf

	mov eax, ListSize
	call WriteInt
	call Crlf
	
	mov eax, WordListSize
	call WriteInt
	call Crlf

	mov ax, M1 
	; eax is DWORD, WORD is not matched with eax. ax(low 2byte) is matched.
	call WriteInt
	call Crlf

	mov ax, M2
	call WriteInt
	call Crlf

	setupAL
	mov eax, a1
	call WriteInt
	call Crlf

	INVOKE ExitProcess, 0
main ENDP
END main
	