
segment .text
    global _ft_read
    extern ___error

_ft_read:
	mov     rax, 0
    syscall
    cmp     rax, -1
    jg      exit
    cmp     rax, -133
    jl      exit
    neg     rax
    mov     r8, rax
    call    ___error
    mov     [rax], r8
	jc      failure

failure:
	mov     rax, -1
	ret

exit:
	ret
