
segment .text
    global	ft_read
    extern	__errno_location

ft_read:
	mov     rax, 0
    syscall
	cmp		rax, 0
    jl		failure
	ret

failure:
	push	rax
	call	__errno_location
	pop		r8
	neg		r8
	mov		[rax], r8
	mov		rax, -1
	ret

