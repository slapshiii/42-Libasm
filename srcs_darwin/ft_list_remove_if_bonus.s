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
        push    r15
        mov     r15, rcx			;free_fct
        push    r14
        mov     r14, rdx			;cmp
        push    r13
        mov     r13, rsi			;data_ref
        push    r12					;prev
        xor     r12d, r12d
        push    rbp					;current
        push    rbx
        mov     rbx, rdi			;*begin_list
        push    r8					;stack alignement -> pop to rax in exit
        mov     rbp, [rdi]
loop:
        test    rbp, rbp			;current == NULL?
        je      exit
        xor     eax, eax			;reset
        mov     rdi, [rbp]			;rdi = current->data
        mov     rsi, r13			;rsi = data_ref
        call    r14					;(*cmp)(rdi, rsi)
        test    eax, eax			; == 0?
        mov     rax, [rbp + 8]		;save current->next
        jne     go_next				;else go_next
        test    r12, r12			;if (prev)
        jne     prev				;prev
        mov     [rbx], rax			;else (*begin_list = current->next)
        jmp     remove
prev:
        mov     [r12 + 8], rax		;prev->next = current->next
remove:
        mov     rdi, [rbp]			;rdi = current->data
        call    r15
        mov     rdi, rbp			;rdi = current
        call    _free
        mov     rbp, [rbx]			;current = *begin_list
        jmp     loop
go_next:
        mov     r12, rbp			;prev = current
        mov     rbp, rax			;current = current->next
        jmp     loop
exit:
        pop     rax
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret