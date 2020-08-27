
segment .text
    global	ft_read
    extern	___error

ft_read:
	mov     rax, 0
    syscall
    jc		failure
	ret

failure:
	push	rax
	call	___errno_location
	pop		r8
	mov		[rax], r8
	mov		rax, -1
	ret

