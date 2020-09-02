
#ifndef LIBASM_H
# define LIBASM_H

# include <stdlib.h>
# include <unistd.h>
# include <string.h>
# include <stdio.h>
# include <errno.h>
# include <fcntl.h>

typedef struct	s_list
{
	void			*data;
	struct s_list	*next;
}				t_list;

/*
** Function prototypes
*/
void 	ft_list_push_front(t_list **begin_list, void *data);
int 	ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

void	print_list(t_list *ptr);
int		str_cmp(char* str1, char *str2);
int		str_eq(char* str1, char *str2);
void	free_list(t_list *to_free);

#endif