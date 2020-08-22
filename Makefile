# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 08:21:44 by phnguyen          #+#    #+#              #
#    Updated: 2020/08/22 06:53:43 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

UNAME = $(shell uname)

ifeq ($(UNAME), Darwin)
	CC = nasm
	OS = macho64
else
	CC = nasm
	OS = elf64
endif

NAME = libasm.a

SRCS =	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s	\
		ft_read.s	\
		ft_strdup.s

OBJS = $(SRCS:.s=.o)

%.o	: %.s
	$(CC) -f $(OS) $< -o $@

$(NAME): $(OBJS) 
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)

all: $(NAME)

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)
	@rm -f test_libasm

re: fclean all

test: all
	@gcc -Wall -Wextra -Werror main.c -L. -lasm -I. -o test_libasm
	@./test_libasm

.PHONY: all clean fclean re test