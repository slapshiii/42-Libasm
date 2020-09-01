section	.text
	global	_ft_list_remove_if
	extern	_free

;ft_list_remove_if(
;	t_list **begin_list,		= rdi
;	void *data_ref,				= rsi
;	int (*cmp)(),				= rdx
;	void (*free_fct)(void *)	= rcx
;);

_ft_list_remove_if:
	push	rsp
	push	r12				;prev
	push	r15				;begin_list
	push	r11				;ref
	push	r13				;(cmp)
	push	r14				;(free_fct)

	cmp		rdi, 0
	jz		exit
	mov		r15, rdi		;save begin_list
	mov		rdi, [rdi]
	cmp		rdi, 0
	jz		exit
	cmp		rdx, 0
	jz		exit
	mov		r13, rdx
	cmp		rcx, 0
	jz		exit
	mov		r14, rcx
	mov		r11, rsi
	xor		r12, r12

	mov		r8, rdi		;set first

	jmp		loop_first

loop_first:
	mov		rdi, [r8]
	mov		rsi, r11
	call	r13
	cmp		rax, 0
	jnz		go_next
	mov		rdi, r8
	mov		r8, [r8 + 8]
	mov		[r15], r8
	jmp		remove

go_next:
	mov		r12, r8
	mov		r8, [r8 + 8]
	jmp		loop

loop:
	cmp		r8, 0
	jz		exit
	mov		rdi, [r8]
	mov		rsi, r11
	call	r13
	cmp		rax, 0
	jnz		go_next
	mov		rdi, r8
	mov		rax, [r8 + 8]
	mov		[r12 + 8], rax
	mov		r8, rax
	jmp		remove

remove:
	push	r8
	push	r12				;prev
	push	r15				;begin_list
	push	r11				;ref
	push	r13				;(cmp)
	push	r14				;(free_fct)
	push	rdi
	mov		rdi, [rdi]
	call	r14
	pop		rdi
	call	_free
	pop		r14
	pop		r13
	pop		r11
	pop		r15
	pop		r12
	pop		r8
	jmp		loop

exit:
	pop		r14
	pop		r13
	pop		r11
	pop		r15
	pop		r12
	pop		rsp
	ret