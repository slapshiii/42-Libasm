# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 09:34:32 by phnguyen          #+#    #+#              #
#    Updated: 2020/04/08 13:05:43 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

; Care of the call of errno -> _error or _errno_location

segment .text
    global  ft_write
    extern  __errno_location

ft_write:

    mov     r8, rdx
	mov     rax, 0x1
    syscall
	cmp     rax, -1
    jg      exit
    cmp     rax, -133
    jl      exit
    neg     rax
    mov     r8, rax
    call    __errno_location
    mov     [rax], r8
    jmp     failure

failure:
	mov    rax, -1
	ret

exit:
	mov     rax, r8
	ret
