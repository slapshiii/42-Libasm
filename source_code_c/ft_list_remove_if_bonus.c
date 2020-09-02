
#include "libasm.h"

void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *))
{
	t_list	*res;
	t_list	*prev;

	prev = NULL;
	res = *begin_list;
	while (res)
	{
		if (cmp(res->data, data_ref) == 0)
		{
			if (!prev)
				*begin_list = res->next;
			else
				prev->next = res->next;
			free_fct(res->data);
			free(res);
			res = *begin_list;
		}
		else
		{
			prev = res;
			res = res->next;
		}
	}
}