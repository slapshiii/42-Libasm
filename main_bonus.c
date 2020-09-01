/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/28 04:19:38 by phnguyen          #+#    #+#             */
/*   Updated: 2020/09/01 05:36:34 by phnguyen         ###   ########.fr       */
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

void	clear_list(t_list *ptr);
void	print_list(t_list *ptr);
int		str_cmp(char* str1, char *str2);
int		str_eq(char* str1, char *str2);
void	free_list(void* str);

int		main(void)
{
	t_list	*ptr = NULL;
	char	*ref = strdup("2848");
	int		res = 0;
	ft_list_push_front(&ptr, strdup("1500"));
	ft_list_push_front(&ptr, strdup("1594856"));
	ft_list_push_front(&ptr, strdup("484848"));
	ft_list_push_front(&ptr, strdup("7682848"));
	ft_list_push_front(&ptr, strdup("983848"));
	ft_list_push_front(&ptr, strdup("005848"));
	ft_list_push_front(&ptr, strdup("2848"));
	ft_list_push_front(&ptr, strdup("2848"));
	ft_list_push_front(&ptr, strdup("00000001"));
	ft_list_push_front(&ptr, strdup("00000000"));
	ft_list_push_front(&ptr, strdup("2848"));
	res = ft_list_size(ptr);
	
	printf("\n%d -- sizeof linkedlist\n\n", res);
	
	print_list(ptr);
	ft_list_sort(&ptr, str_cmp);
	printf("\n");
	print_list(ptr);
	//ft_list_remove_if(&ptr, ref, str_eq, &free_list);
	printf("\n");
	print_list(ptr);
	clear_list(ptr);
	free(ref);
	//system("leaks test_libasm");
	return (0);
}

void	clear_list(t_list *ptr)
{
	t_list *tmp;
	while (ptr != NULL)
	{
		tmp = ptr;
		ptr = ptr->next;
		free_list(tmp->data);
		free(tmp);
	}
}

void	print_list(t_list *ptr)
{
	while (ptr != NULL)
	{
		printf("%s\n", ptr->data);
		ptr = ptr->next;
	}
}

void	free_list(void* str)
{
	free(str);
	str = NULL;
}

int		str_cmp(char* str1, char *str2)
{
	if (strcmp(str1, str2) > 0)
		return (0);
	return (1);
}

int		str_eq(char* str1, char *str2)
{
	if (strcmp(str1, str2) == 0)
		return (0);
	return (1);
}