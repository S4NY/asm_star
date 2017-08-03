global _start

section .data
	star db '*********'
	new db 0x0a ; new line

section .text
_start : 

	pop rax;
	pop rax;
	pop rax;
	mov rax, [rax]
	and rax, 0x000000000000000f
	mov rbx, rax ; input number 
	mov r9,1 ; initialize the counter
	 

loop2 : 
	mov rax, 1    ; sys_write number
	mov rdi, 1   ; prints the servers answer
	mov rsi, star
	mov rdx, r9 ; loop 
	call _syscall ;  



	mov rax, 1    ; sys_write number
	mov rdi, 1   ; prints new line
	mov rsi, new
	mov rdx, 1;
	call _syscall ;  

	cmp rbx, 0
	je END
	cmp rbx, 1
	je END 

	cmp r9, rbx
	je loop4 ; if r9 is greater than input, finish the loop


loop1 :
	
	inc r9 ; increase counter
	jmp loop2 ; 


END :
	mov rax, 60
	call _syscall ; exit

	
loop3 : 
	mov rax, 1    ; sys_write number
	mov rdi, 1   ; prints the servers answer
	mov rsi, star
	mov rdx, r9 ; loop 
	call _syscall ;  

	mov rax, 1    ; sys_write number
	mov rdi, 1   ; prints new line
	mov rsi, new
	mov rdx, 1;
	call _syscall ;  

	cmp r9,0
	je END ; if r9 is greater than 9, finish the loop


loop4 :
	dec r9 ; decrease counter
	jmp loop3 





_syscall:
	syscall
	ret


_zerocase:
	mov rbx,1
	ret