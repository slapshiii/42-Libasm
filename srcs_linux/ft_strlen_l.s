
segment .text
	global ft_strlen

ft_strlen:
	mov 	rax, 0
	jmp 	loop

loop:
	cmp 	BYTE [rdi + rax], 0
	je 		exit
	inc	 	rax
	jmp 	loop

exit:
	ret