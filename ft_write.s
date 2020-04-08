# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 09:34:32 by phnguyen          #+#    #+#              #
#    Updated: 2020/04/08 11:02:12 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

segment .text
    global ft_write

ft_write:

    mov     r8, rdx
	mov     rax, 0x1
    syscall
	jc      failure
	jmp     exit

failure:
	mov     rax, -1
	ret

exit:
	mov     rax, r8
	ret
