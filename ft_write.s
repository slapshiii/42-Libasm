
; Care of the call of errno -> ___error or ___errno_location

segment .text
	global	_ft_write
	extern	___error

_ft_write:

	mov		rax, 0x2000004
	syscall
	cmp		rax, 0
	jl		failure
	ret

failure:
	reg		rax
	mov		rdx, rax
	call	___error
	mov		[rax], rdx
	mov		rax, -1
	ret

