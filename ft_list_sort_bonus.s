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

	mov		r8, [rdi]		;first (save)
	mov		rdi, [rdi]		;first
	xor		r9, r9			;next
	cmp 	rdi, 0
	jz		exit
	cmp 	rsi, 0
	jz		exit
	
	mov		r14, rsi		;save (cmp)
	jmp		loop

loop:
	mov		r9, [rdi + 8]
	cmp		r9, 0
	jz		exit
	push	rdi
	push	rsi
	mov		rsi, [r9]
	mov		rdi, [rdi]
	call	r14
	pop		rsi
	pop		rdi
	cmp		rax, 0
	jz		swap
	jmp		go_next

swap:						;swap rdi rsi
	mov		r14, [r9]
	mov		r15, [rdi]
	mov		[r9], r15
	mov		[rdi], r14
	jmp		go_next

go_next:
	mov		rdi, [rdi + 8]
	jmp		loop

exit:
	pop		r15
	pop		r14
	pop		rsp
	ret