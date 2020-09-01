# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/08 08:21:44 by phnguyen          #+#    #+#              #
#    Updated: 2020/09/01 04:26:57 by phnguyen         ###   ########.fr        #
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
	SRCS_BONUS = 	ft_atoi_base.s\
					ft_list_push_front_bonus.s\
					ft_list_size_bonus.s\
					ft_list_sort_bonus.s\
					ft_list_remove_if_bonus.s
else
	CC = clang
	OS = elf64
	SRCS =	ft_strlen_l.s \
		ft_strcpy_l.s \
		ft_strcmp_l.s \
		ft_write_l.s	\
		ft_read_l.s	\
		ft_strdup_l.s
	SRCS_BONUS =	ft_atoi_base_l.s\
					ft_list_push_front_l_bonus.s\
					ft_list_size_l_bonus.s\
					ft_list_sort_l_bonus.s\
					ft_list_remove_if_l_bonus.s
endif

NAME = libasm.a

OBJS = $(SRCS:.s=.o)

OBJS_BONUS = $(SRCS_BONUS:.s=.o)

#CFLAGS = -Werror -Wextra -Wall
CFLAGS += -fsanitize=address
#CFLAGS += -g3


all: $(NAME)

$(NAME): libasm.h $(OBJS)
	@ar rc $(NAME) $(OBJS) libasm.h
	@ranlib $(NAME)

bonus: libasm.h $(OBJS) $(OBJS_BONUS)
	@ar rc $(NAME) $(OBJS) $(OBJS_BONUS) libasm.h
	@ranlib $(NAME)
	
%.o	: %.s
	nasm -f $(OS) $< -o $@

clean:
	@rm -f $(OBJS)
	@rm -f $(OBJS_BONUS)

fclean: clean
	@rm -f $(NAME)
	@rm -f test_libasm

re: fclean all

test: all
	@$(CC) val main.c -o test_libasm -lc libasm.a
	@./test_libasm

test2: all
	@$(CC) $(CFLAGS) main2.c -o test_libasm -lc libasm.a
	@./test_libasm

test_bonus: bonus
	@$(CC) $(CFLAGS) main_bonus.c -o test_libasm -lc libasm.a
	@./test_libasm

.PHONY: all clean fclean re test test2 test_bonus