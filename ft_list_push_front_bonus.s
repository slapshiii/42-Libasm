
section .text
	global	_ft_list_push_front
	extern	_malloc

_ft_list_push_front:
	push	rsp

	cmp		rdi, 0
	jz		exit
	jmp		add_node

add_node:
	push	rdi
	push 	rsi
	mov		rdi, 16
	call	_malloc
	cmp		rax, 0
	jz		exit
	pop 	rsi
	pop		rdi
	mov		[rax], rsi
	mov		rcx, [rdi]
	mov		[rax + 8], rcx
	mov		[rdi], rax
	jmp		exit

exit:
	pop		rsp
	ret