/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/28 04:19:38 by phnguyen          #+#    #+#             */
/*   Updated: 2020/08/31 23:59:19 by phnguyen         ###   ########.fr       */
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

void	print_list(t_list *ptr);
int		str_cmp(char* str1, char *str2);

int		main(void)
{
	t_list	*ptr = NULL;
	
	// print_list(&ptr);
	ft_list_push_front(&ptr, strdup("1500"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("1594856"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("484848"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("7682848"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("983848"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("005848"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("2848"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("2848"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("00000001"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("00000000"));
	printf("%s\n", ptr->data);
	ft_list_push_front(&ptr, strdup("2848"));
	printf("%s\n", ptr->data);
	
	printf("%d -- sizeof linkedlist\n", ft_list_size(ptr));
	
	
	print_list(ptr);
	ft_list_sort(&ptr, str_cmp);
	printf("\n\n");
	print_list(ptr);
	
	return (0);
}

void	print_list(t_list *ptr)
{
	while (ptr != NULL)
	{
		printf("%s\n", (char*)ptr->data);
		ptr = ptr->next;
	}
}

int		str_cmp(char* str1, char *str2)
{
	if (strcmp(str1, str2) > 0)
		return (0);
	return (1);
}
