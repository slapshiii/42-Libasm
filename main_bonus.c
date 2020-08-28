/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/28 04:19:38 by phnguyen          #+#    #+#             */
/*   Updated: 2020/08/28 12:19:00 by phnguyen         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>

#include "libasm.h"

/*
** Function prototypes
*/
void 	ft_list_push_front(t_list **begin_list, void *data);
int 	ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

int		main(void)
{
	t_list	begin;
	t_list	mid;
	t_list	last;
	t_list	tmp;
	t_list	*ptr = &begin;

	begin = (t_list){strdup("000577"), &mid};
	mid = (t_list){strdup("000021"), &last};
	last = (t_list){strdup("052011"), &tmp};
	tmp = (t_list){strdup("000001"), NULL};
	
	printf("%d -- sizeof linkedlist\n", ft_list_size(ptr));
	ft_list_push_front(&ptr, strdup("1500"));
	printf("%s\n", ptr->data);
	printf("%d -- sizeof linkedlist\n", ft_list_size(ptr));
	ft_list_push_front(&ptr, strdup("1594856"));
	printf("%s\n", ptr->data);
	printf("%d -- sizeof linkedlist\n", ft_list_size(ptr));
	ft_list_push_front(&ptr, strdup("484848"));
	printf("%s\n", ptr->data);
	printf("%d -- sizeof linkedlist\n", ft_list_size(ptr));
	
	ft_list_sort(&ptr, strcmp);
	printf("sorted %s\n", ptr->data);
	
	return (0);
}