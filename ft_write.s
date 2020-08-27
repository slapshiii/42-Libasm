
; Care of the call of errno -> ___error or ___errno_location

segment .text
	global	_ft_write
	extern	___error

_ft_write:

	mov		rax, 0x2000004
	syscall
	jc		failure
	ret

failure:
	push	rax
	call	___error
	pop		r8
	mov		[rax], r8
	mov		rax, -1
	ret
