# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 09:34:32 by phnguyen          #+#    #+#              #
#    Updated: 2020/04/08 11:31:50 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

segment .text
    global ft_read

ft_read:
	mov     rax, 0
    syscall
	jc      failure
	jmp     exit

failure:
	mov     rax, -1
	ret

exit:
	ret
