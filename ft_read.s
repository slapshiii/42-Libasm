# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 09:34:32 by phnguyen          #+#    #+#              #
#    Updated: 2020/04/08 13:29:17 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

segment .text
    global ft_read
    extern __errno_location

ft_read:
	mov     rax, 0
    syscall
    cmp     rax, -1
    jg      exit
    cmp     rax, -133
    jl      exit
    neg     rax
    mov     r8, rax
    call    __errno_location
    mov     [rax], r8
	jc      failure

failure:
	mov     rax, -1
	ret

exit:
	ret
