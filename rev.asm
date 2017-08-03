global _start

section .data
addr : dw 2;AF_INET
	   db 05h, 39h
	   db 0dh, 7ch, 4bh, 14h
	   db 0,0,0,0,0,0,0,0



section .text

_start:
	mov rax, 41 ;41 sys_socket number
	mov rdi, 2
	mov rsi, 1
	mov rdx, 0   ;SK_STREAM
	call _syscall; Create

	mov rax, 42 ;42 sys_connect number
	mov rdi, 3
	mov rsi, addr ; addr structure to set 
	mov rdx, 16  ;Maximum length of input buffer
	call _syscall ; Connect a socket 

	mov rax, 0  ;0 sys_read number

	mov rdi, 3
	mov rsi, rsp ;
	mov rdx, 32  ; Maximum length of read buffer
	call _syscall ; 

	mov rdx, rax ; Return string length
	mov rax, 1    ; sys_write number
	mov rdi, 3   
	mov rsi, rsp
	call _syscall;

	mov rdx, rax ; 
	mov rax, 0  ;0 sys_read number
	mov rdi, 3
	mov rsi, rsp ;
	
	call _syscall ; 

	mov rdx, rax
	mov rax, 1    ; sys_write number
	mov rdi, 1    ;prints the server's answer
	mov rsi, rsp
	
	call _syscall ; 

	mov rax, 60 ; Exit number
	call _syscall;


	_syscall:
	syscall
	ret