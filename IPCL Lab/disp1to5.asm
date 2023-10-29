section .data
nl db ' ',10
ln: equ $-nl
;-----------------------------
section .bss
num resb 1
;-----------------------------
section .text
global _start
_start:

%macro RW 4
mov eax,%1
mov ebx,%2
mov ecx,%3
mov edx,%4
int 80h
%endmacro

mov ecx,5
mov eax,1
l1: 	add eax,'0'
	mov [num],eax
	push rcx
	RW 4,1,num,1
	RW 4,1,nl,ln
	mov eax,[num]
	sub eax,'0'
	inc eax
	pop rcx
	loop l1	

mov eax,1
mov ebx,0
int 80h





