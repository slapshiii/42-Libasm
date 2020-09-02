
#include "libasm.h"

void 	ft_list_push_front(t_list **begin_list, void *data);

void 	ft_list_push_front(t_list **begin_list, void *data)
{
	t_list	*res;

	res = (t_list*)malloc(sizeof(t_list));
	res->data = data;
	res->next = *begin_list;
	*begin_list = res;
}