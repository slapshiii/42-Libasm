
; Care of the call of errno -> ___error or ___errno_location

segment .text
	global	_ft_write
	extern	___error

_ft_write:

	mov		r8, rdx
	mov		rax, 0x2000004
	syscall
	jc		failure
	jmp		exit

failure:
	mov		r8, rax
	call	___error
	mov		[rax], r8
	mov		rax, -1
	ret

exit:
	mov		rax, r8
	ret

