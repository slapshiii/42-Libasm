
segment .text
    global	_ft_strdup
    extern	_ft_strlen
    extern	_malloc
	extern	_ft_strcpy

_ft_strdup:					;rax = _ft_strdup(rdi)
	push	rdi				
	xor		rcx, rcx
	jmp		len_loop

do_malloc:
	inc		rcx				
	mov		rdi, rcx		
	call	_malloc			
	cmp		rax, 0			
	jz		error			
	pop		rsi				
	xor		rcx, rcx
	xor		rdx, rdx
	jmp		copy_loop

len_loop:
	cmp 	BYTE [rdi + rcx], 0
	je 		do_malloc
	inc	 	rcx
	jmp 	len_loop

copy_loop:
	mov		dl, BYTE [rsi + rcx]
	mov		BYTE [rax + rcx], dl
	cmp		dl, 0
	je		exit
	inc		rcx
	jmp		copy_loop

exit:
	ret

error:
	xor		rax, rax
	ret
