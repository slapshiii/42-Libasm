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

	push	rbp				;current
	push	rbx				;tmp
	push	r12				;prev
	mov		r12, [rdi]
	xor		rbx, rbx

	cmp		rdi, 0
	jz		exit
	cmp		rdx, 0
	jz		exit
	cmp		rcx, 0
	jz		exit
	jmp		loop

free_node:

link_prev_to_next:
	mov		r9, [rbp + 8]
	mov		[r12], r9
	jmp		loop

go_next:
	mov		rbx, [rdi]
	mov		r8, [rbx + 8]
	mov		[rdi], r8

loop:

	call	rdx
	jz		

remove:
	mov		[rdi], 

exit:
	pop		r12
	pop		rbx
	pop		rbp
	pop		rsp
	ret