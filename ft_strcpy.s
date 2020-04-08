# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 09:34:33 by phnguyen          #+#    #+#              #
#    Updated: 2020/04/08 10:25:09 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global ft_strcpy
    extern ft_strlen

ft_strcpy:
    push 	rdi
	mov 	rdi, rsi
	call 	ft_strlen
	mov 	rcx, rax
	pop 	rdi
    cld
    mov     rax, rdi
    rep 	movsb
    mov     BYTE [rdi], 0
    jmp     exit

exit:
	ret