
section .text
    global ft_strcmp

ft_strcmp:
    mov 	rax, 0
	jmp 	loop

loop:
	mov     al, BYTE [rdi]
    mov     bl, BYTE [rsi]
    cmp     al, 0
    je      exit
    cmp     bl, 0
    je      exit
    cmp     al, bl
    jne     exit
    inc     rdi
    inc     rsi
    jmp     loop

eq:
	mov		rax, 0
	ret

le:
	mov		rax, -1
	ret

gr:
	mov		rax, 1
	ret

exit:
    cmp     al, bl
	je		eq
	jl		le
	jg		gr