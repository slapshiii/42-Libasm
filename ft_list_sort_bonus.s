section	.text
	global	_ft_list_sort

;ft_list_sort(
;	t_list **begin_list	= rdi,
;	int (*cmp)()		= rsi
;);

_ft_list_sort:
	push	rsp
	push	r14
	push	r15

	xor		rcx, rcx		;current
	xor		rdx, rdx		;bool swap
	xor		r9, r9			;next
	cmp 	rdi, 0
	jz		exit
	cmp 	rsi, 0
	jz		exit
	mov		r8, [rdi]		;first
	mov		r14, rsi
	jmp		back_start

back_start:
	mov		rcx, r8
	mov		r9, [rcx + 8]
	jmp		loop

loop:
	cmp		r9, 0
	jz		check_end
	mov		rdi, [rcx]
	mov		rsi, [r9]
	call	r14
	cmp		rax, 0
	jz		swap
	jmp		go_next

swap:						;swap rdi rsi
	mov		r15, rdi
	mov		rdi, rsi
	mov		rsi, r15
	mov		rdx, 1
	jmp		go_next

go_next:
	mov		r15, r9
	mov		r9, [r9 + 8]
	mov		rcx, r15
	jmp		loop

check_end:
	cmp		rdx, 1
	je		back_start
	jmp		exit

exit:
	pop		r15
	pop		r14
	pop		rsp
	ret