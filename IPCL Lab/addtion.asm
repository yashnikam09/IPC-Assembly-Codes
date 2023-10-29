section .data
msg db 'Enter the number1 :',10
msglen: equ $-msg
msg1 db 'Enter the number2 :',10
msg1len: equ $-msg1
msg2  db 'Result of addition is = '
msg2len: equ $-msg2

section .bss
num1 resb 1
num2 resb 1
res resb 1

%macro RW 4 
mov eax,%1
mov ebx,%2
mov ecx,%3
mov edx,%4    		
int 80h
%endmacro

section .text
global _start
_start:
RW 4,1,msg,msglen        	;display 'Enter the number1'

RW 3,0,num1,2           	;Accept Number1

RW 4,1,msg1,msg1len        	;display 'Enter the number2'

RW 3,0,num2,2           	;Accept Number2

mov eax,[num1]   		
sub eax,'0'  			;convert ASCII to HEX
mov ebx,[num2]
sub ebx,'0'			;convert ASCII to HEX
add eax,ebx 			;eax=eax+ebx, add num1 & num2
add eax,'0' 			;convert result to ASCII
mov [res],eax			;storing ASCII result to variable

RW 4,1,msg2,msg2len        	;display 'Result of addition is = '

RW 4,1,res,1      		;display result on screen

mov eax,1
mov ebx,0			;EXIT
int 80h
