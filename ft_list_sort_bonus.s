section	.text
	global	_ft_list_sort

_ft_list_sort:				;ft_list_sort(rdi, rsi);
	push	rsp

	xor		rcx, rcx
	xor		r9, r9
	cmp 	rdi, 0
	jz		exit
	cmp 	rsi, 0
	jz		exit
	mov		r8, [rdi]
	push	rdi
	jmp		loop

loop:

swap:						;swap node with next node



exit:
	pop		rsp
	ret