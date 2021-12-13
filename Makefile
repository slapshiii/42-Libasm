# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 08:21:44 by phnguyen          #+#    #+#              #
#    Updated: 2021/12/13 23:52:09 by phnguyen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

UNAME = $(shell uname)

SRCS =	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s	\
			ft_read.s	\
			ft_strdup.s
			
SRCS_BONUS = 	ft_atoi_base_bonus.s\
				ft_list_push_front_bonus.s\
				ft_list_size_bonus.s\
				ft_list_sort_bonus.s\
				ft_list_remove_if_bonus.s

ifeq ($(UNAME), Darwin)
	CC = gcc
	OS = macho64
	SRCS_DIR = srcs_darwin
else
	CC = clang
	OS = elf64
	SRCS_DIR = srcs_linux
endif

NAME = libasm.a

OBJS = $(addprefix $(SRCS_DIR)/,$(SRCS:.s=.o))

OBJS_BONUS = $(addprefix $(SRCS_DIR)/,$(SRCS_BONUS:.s=.o))

#CFLAGS = -Werror -Wextra -Wall
#CFLAGS += -fsanitize=address
#CFLAGS += -g3


all: $(NAME)

$(NAME): $(OBJS)
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)

bonus: $(OBJS) $(OBJS_BONUS)
	@ar rc $(NAME) $(OBJS) $(OBJS_BONUS)
	@ranlib $(NAME)
	
%.o	: %.s
	nasm -f $(OS) $< -o $@

clean:
	@rm -f $(OBJS)
	@rm -f $(OBJS_BONUS)

fclean: clean
	@rm -f $(NAME)
	@rm -f test_libasm
	@rm -f test

re: fclean all

test: source_code_c/libasm.h all
	touch test
	@$(CC) $(CFLAGS) source_code_c/main.c -o test_libasm -lc libasm.a
	@./test_libasm

test_bonus: bonus
	@$(CC) $(CFLAGS) source_code_c/main_bonus.c -o test_libasm -lc libasm.a
	@./test_libasm

.PHONY: all clean fclean re test test2 test_bonus
