# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 08:21:44 by phnguyen          #+#    #+#              #
#    Updated: 2020/08/27 10:45:46 by phnguyen         ###   ########.fr        #
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

CFLAGS = -fsanitize=address

all: $(NAME)

$(NAME): $(OBJS) 
	@ar rc $(NAME) $(OBJS) libasm.h
	@ranlib $(NAME)
	
%.o	: %.s
	$(CC) -f $(OS) $< -o $@

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)
	@rm -f test_libasm

re: fclean all

test: all
	@gcc -g $(CFLAGS) main.c -o test_libasm -lc libasm.a
	@./test_libasm

test2: all
	@gcc -g $(CFLAGS) main2.c -o test_libasm -lc libasm.a
	@./test_libasm

.PHONY: all clean fclean re test test2