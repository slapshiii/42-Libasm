# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 09:34:30 by phnguyen          #+#    #+#              #
#    Updated: 2020/04/08 11:13:33 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

segment .text
    global ft_strdup
    extern ft_strlen
    extern ft_strcpy
    extern malloc

ft_strdup:
	call	ft_strlen
	add		rax, 1
	push	rdi
	mov		rdi, rax
	call	malloc
	pop		r9
	mov		rdi, rax
	mov		rsi, r9
	call	ft_strcpy
	ret