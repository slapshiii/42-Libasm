
section .text
	global _ft_list_size

_ft_list_size:
	push	rsp
	xor		rcx, rcx
	cmp 	rdi, 0
	jz		exit
	jmp		loop

loop:
	inc 	rcx
	mov		rdi, [rdi + 8]
	cmp 	rdi, 0
	jz		exit
	jmp 	loop

exit:
	pop 	rsp
	mov		rax, rcx
	ret