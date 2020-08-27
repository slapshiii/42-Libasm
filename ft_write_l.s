
segment .text
	global	ft_write
	extern	___error

ft_write:

	mov		rax, 1
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