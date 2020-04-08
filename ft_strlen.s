# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 08:20:54 by phnguyen          #+#    #+#              #
#    Updated: 2020/04/08 09:29:16 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #



segment .text
	global ft_strlen

ft_strlen:
	mov 	rax, 0
	jmp 	loop

loop:
	cmp 	BYTE [rdi + rax], 0
	je 		exit
	inc	 	rax
	jmp 	loop

exit:
	ret