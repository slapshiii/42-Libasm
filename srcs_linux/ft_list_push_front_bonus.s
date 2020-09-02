
section .text
	global	ft_list_push_front
	extern	malloc

	;void 	ft_list_push_front(
		;t_list **begin_list	= rdi,
		;void *data 			= rsi
	;);

ft_list_push_front:
	push	rbp
	push	rbx
	sub		rsp, 8

	mov		rbx, rdi
	mov		rbp, rsi
	mov		rdi, 16
	call	malloc
	mov		[rax], rbp
	mov		rdx, [rbx]
	mov		[rax + 8], rdx
	mov		[rbx], rax

exit:
	add		rsp, 8
	pop		rbx
	pop		rbp
	ret