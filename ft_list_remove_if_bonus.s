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
        mov     r15, rcx
        push    r14
        mov     r14, rdx
        push    r13
        mov     r13, rsi
        push    r12
        xor     r12d, r12d
        push    rbp
        push    rbx
        mov     rbx, rdi
        push    r8
        mov     rbp, [rdi]
loop:
        test    rbp, rbp
        je      exit
        xor     eax, eax
        mov     rdi, [rbp]
        mov     rsi, r13
        call    r14
        test    eax, eax
        mov     rax, [rbp + 8]
        jne     go_next
        test    r12, r12
        jne     first
        mov     [rbx], rax
        jmp     remove
first:
        mov     [r12 + 8], rax
remove:
        mov     rdi, [rbp + 0]
        call    r15
        mov     rdi, rbp
        call    _free
        mov     rbp, [rbx]
        jmp     loop
go_next:
        mov     r12, rbp
        mov     rbp, rax
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