#include "libasm.h"

int		ft_strcmp(const char *s1, const char *s2);

int		ft_strcmp(const char *s1, const char *s2)
{
	while (*s1 && *s2 && *s1 == *s2)
	{
		s1++;
		s2++;
	}
	if (((unsigned const char)*s1 - (unsigned const char)*s2) == 0)
		return (0);
	else if (((unsigned const char)*s1 - (unsigned const char)*s2) > 0)
		return (1);
	else
		return (-1);
}