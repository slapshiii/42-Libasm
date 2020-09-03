section	.text
	global	_ft_list_sort

;ft_list_sort(
;	t_list **begin_list	= rdi,
;	int (*cmp)()		= rsi
;);

_ft_swap_list:		; void	swap(void **a, void **b)
	push rbx
	push rcx
	mov rbx, [rdi]
	mov rcx, [rsi]
	mov qword [rdi], rcx
	mov qword [rsi], rbx
	mov rax, 0
	pop rcx
	pop rbx
	ret

_ft_list_sort:	; rdi = t_list **begin_list, rsi = int (*cmp)()
	cmp	 rdi, 0
	jz	 return
	cmp	 rsi, 0
	jz	 return
	push rdi
	mov	 r13, rsi
	mov	 r14, [rdi]			; begin = *begin_list
	cmp	 r14, 0
	jz	 return
	mov	 r15, [r14 + 8]		; lnext = begin->next
	jmp	 while_sort

increment_list:
	push rdx
	push rcx
	mov	 rdx, [r14 + 8]
	mov	 r14, rdx
	mov  rcx, [r15 + 8]
	mov  r15, rcx
	pop  rcx
	pop  rdx

while_sort:
	cmp	 r15, 0
	jz	 return
	mov	 rax, r13
	mov	 rdi, [r14]
	mov	 rsi, [r15]
	call rax
	cmp	 eax, byte 0
	jle	 increment_list
	mov	 rdi, r14
	mov	 rsi, r15
	call _ft_swap_list
	jmp	 reset_list

reset_list:
	pop	 r11
	mov	 r14, [r11]
	push r11
	mov	 r15, [r14 + 8]
	jmp	 while_sort

return:
	pop	 rdi
	ret
