# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 09:34:33 by phnguyen          #+#    #+#              #
#    Updated: 2020/04/08 10:03:30 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
    global ft_strcmp

ft_strcmp:
    mov 	rax, 0
	jmp 	loop

loop:
	mov     al, BYTE [rdi]
    mov     bl, BYTE [rsi]
    cmp     al, 0
    je      exit
    cmp     bl, 0
    je      exit
    cmp     al, bl
    jne     exit
    inc     rdi
    inc     rsi
    jmp     loop

exit:
    movzx	rax, al
    movzx	rbx, bl
    sub     rax, rbx
	ret