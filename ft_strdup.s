
segment .text
    global	_ft_strdup
	extern 	___error
    extern	_ft_strlen
    extern	_malloc

_ft_strdup:
	push	rdi
	call	_ft_strlen
	inc		rax
	push	rax
	mov		rdi, rax
	call	_malloc
	cmp		rax, 0
	jz		error_malloc
	mov		rdi, rax
	pop		rcx
	pop		rsi
	cld
	rep		movsb
	ret

error_malloc:
	mov		rdx, 0x0c
	call	___error
	;and		rax, -16
	mov		[rax], rdx
	xor		rax, rax
	ret
