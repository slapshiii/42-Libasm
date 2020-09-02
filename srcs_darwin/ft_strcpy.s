
section .text
    global _ft_strcpy
    extern _ft_strlen

_ft_strcpy:					;dst = rdi, src = rsi
    push 	rdi
	mov 	rdi, rsi
	call 	_ft_strlen
	mov 	rcx, rax
	pop 	rdi
    cld						;direction d'incrementation
	rep 	movsb			;repete mov rdi rsi jsq rcx=0
    mov     BYTE [rdi], 0
	mov     rax, rdi
    ret
