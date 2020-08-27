
segment .text
	global	ft_write
	extern	___errno_location

ft_write:

	mov		rax, 1
	syscall
	cmp		rax, 0
	jl		failure
	ret

failure:
	push	rax
	call	___errno_location
	pop		r8
	neg		r8
	mov		[rax], r8
	mov		rax, -1
	ret
