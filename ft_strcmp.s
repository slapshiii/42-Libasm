
section .text
    global _ft_strcmp

_ft_strcmp:
	push	rsp

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
	pop		rsp
    cmp     al, bl
	je		eq
	jl		le
	jg		gr