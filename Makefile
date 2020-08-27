# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 08:21:44 by phnguyen          #+#    #+#              #
#    Updated: 2020/08/28 01:21:28 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

UNAME = $(shell uname)

ifeq ($(UNAME), Darwin)
	CC = gcc
	OS = macho64
	SRCS =	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s	\
		ft_read.s	\
		ft_strdup.s
else
	CC = clang
	OS = elf64
	SRCS =	ft_strlen_l.s \
		ft_strcpy_l.s \
		ft_strcmp_l.s \
		ft_write_l.s	\
		ft_read_l.s	\
		ft_strdup_l.s
endif

NAME = libasm.a

OBJS = $(SRCS:.s=.o)

CFLAGS += -fsanitize=address

all: $(NAME)

$(NAME): libasm.h $(OBJS)
	@ar rc $(NAME) $(OBJS) libasm.h
	@ranlib $(NAME)
	
%.o	: %.s
	nasm -f $(OS) $< -o $@

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)
	@rm -f test_libasm

re: fclean all

test: all
	@$(CC) $(CFLAGS) main.c -o test_libasm -lc libasm.a
	@./test_libasm

test2: all
	@$(CC) $(CFLAGS) main2.c -o test_libasm -lc libasm.a
	@./test_libasm

.PHONY: all clean fclean re test test2