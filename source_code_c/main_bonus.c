/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/28 04:19:38 by phnguyen          #+#    #+#             */
/*   Updated: 2020/09/04 00:47:01 by phnguyen         ###   ########.fr       */
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
int		ft_atoi_base(char const *str, char const *base);
void 	ft_list_push_front(t_list **begin_list, void *data);
int 	ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

void	print_list(t_list *ptr);
int		str_cmp(char* str1, char *str2);
int		str_eq(char* str1, char *str2);
void	free_list(t_list *to_free);

int		main(void)
{

	/*
	** TEST ATOI_BASE
	*/
	int	i = 0;
	printf("\nTEST ft_atoi_base\n");
	ATOI_BASE(NULL, "0123456789")
	ATOI_BASE("42", NULL)
	ATOI_BASE("42", "")
	ATOI_BASE("42", "0123456789")
	ATOI_BASE("0", "0123456789")
	ATOI_BASE("1", "0123456789")
	ATOI_BASE("1215415478", "0123456789")
	ATOI_BASE("-0", "0123456789")
	ATOI_BASE("-1", "0123456789")
	ATOI_BASE("-42", "0123456789")
	ATOI_BASE("--42", "0123456789")
	ATOI_BASE("-+-42", "0123456789")
	ATOI_BASE("-+-+-+42", "0123456789")
	ATOI_BASE("-+-+-+-42", "0123456789")
	ATOI_BASE("-1215415478", "0123456789")
	ATOI_BASE("2147483647", "0123456789")
	ATOI_BASE("2147483648", "0123456789")
	ATOI_BASE("-2147483648", "0123456789")
	ATOI_BASE("-2147483649", "0123456789")
	ATOI_BASE("2a", "0123456789abcdef")
	ATOI_BASE("ff", "0123456789abcdef")
	ATOI_BASE("poney", "poney")
	ATOI_BASE("dommage", "invalid")
	ATOI_BASE("dommage", "aussi invalide")
	ATOI_BASE("dommage", "+toujours")
	ATOI_BASE("dommage", "-stop")
	ATOI_BASE("dommage", "  \t\nca suffit")
	ATOI_BASE("    +42", "0123456789")
	ATOI_BASE("    -42", "0123456789")
	ATOI_BASE("    42", "0123456789")
	ATOI_BASE("  \t\n\r\v\f  42", "0123456789")
	ATOI_BASE("  \t\n\r\v\f  -42", "0123456789")
	ATOI_BASE("42FINIS !", "0123456789")
	ATOI_BASE("-42FINIS !", "0123456789")
	ATOI_BASE("C'est dommage42", "0123456789")
	printf("\n");
	
	t_list	*ptr = NULL;

	ft_list_sort(&ptr, str_cmp);

	printf("%d -- sizeof linkedlist\n\n", ft_list_size(ptr));
	ft_list_push_front(&ptr, strdup("2848"));
	ft_list_push_front(&ptr, strdup("1500"));
	ft_list_push_front(&ptr, strdup("1594856"));
	ft_list_push_front(&ptr, strdup("484848"));
	ft_list_push_front(&ptr, strdup("983848"));
	ft_list_push_front(&ptr, strdup("005848"));
	printf("%d -- sizeof linkedlist\n\n", ft_list_size(ptr));
	ft_list_push_front(&ptr, strdup("2848"));
	ft_list_push_front(&ptr, strdup("2848"));
	ft_list_push_front(&ptr, strdup("00000001"));
	ft_list_push_front(&ptr, strdup("00000000"));
	ft_list_push_front(&ptr, strdup("2848"));
	print_list(ptr);
	printf("%d -- sizeof linkedlist\n\n", ft_list_size(ptr));
	ft_list_sort(&ptr, str_cmp);
	printf("\n");
	print_list(ptr);
	printf("%d -- sizeof linkedlist\n\n", ft_list_size(ptr));
	ft_list_remove_if(&ptr, "2848", str_eq, free);
	print_list(ptr);
	printf("%d -- sizeof linkedlist\n\n", ft_list_size(ptr));
	free_list(ptr);
	//system("leaks test_libasm");
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

void free_list(t_list *to_free)
{
	t_list *tmp = NULL; 
	
	while(to_free)
	{
		tmp = to_free->next ? to_free->next : NULL;
		free(to_free->data);
		free(to_free);
		to_free = tmp;
	}
}

int		str_cmp(char* str1, char *str2)
{
	if (strcmp(str1, str2) > 0)
		return (1);
	return (0);
}

int		str_eq(char* str1, char *str2)
{
	if (strcmp(str1, str2) == 0)
		return (0);
	return (1);
}
