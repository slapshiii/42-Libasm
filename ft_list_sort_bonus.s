section	.text
	global	_ft_list_sort

;ft_list_sort(
;	t_list **begin_list	= rdi,
;	int (*cmp)()		= rsi
;);

_ft_list_sort:
	push	rsp
	push	r14				;temp1
	push	r15				;temp2
	push	r13
	push	r12

	cmp 	rdi, 0
	jz		exit
	mov		r8, [rdi]		;first (save)
	mov		rdi, [rdi]		;first
	cmp 	rdi, 0
	jz		exit
	cmp 	rsi, 0
	jz		exit
	
	mov		r13, rsi		;save (cmp)
	jmp		loop

loop:
	cmp		rdi, 0
	jz		exit
	mov		r12, [rdi + 8]
	push	rdi
	mov		rsi, [r12]
	mov		rdi, [rdi]
	call	r13
	pop		rdi
	cmp		rax, 0
	jz		swap
	jmp		go_next

swap:						;swap rdi rsi
	mov		r14, [r12]
	mov		r15, [rdi]
	mov		[r12], r15
	mov		[rdi], r14
	mov		rdi, r8
	jmp		loop

go_next:
	mov		rdi, [rdi + 8]
	jmp		loop

exit:
	pop		r12
	pop		r13
	pop		r15
	pop		r14
	pop		rsp
	ret