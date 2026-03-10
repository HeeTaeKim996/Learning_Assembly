TITLE Add and substract

.386								; Set CPU to Intel-80386
.model flat, stdcall				
; Model is Setting Segmentation Model
; flat Means Segmentation Model is Protected Mode
; stdcall Set MS-Windows Function enable



.stack 4096

; PROTO is Directive that Declare this function is Extern function
ExitProcess PROTO, dwExitCode:DWORD



DumpRegs PROTO
; Lib Irvine's Function

includelib Irvine32.lib

.code
main PROC
	mov eax, 10000h
	add eax, 40000h
	sub eax, 20000h
	
	call DumpRegs

	INVOKE ExitProcess, 0

main ENDP
END main