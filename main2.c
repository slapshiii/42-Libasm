/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main2.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/27 10:41:43 by phnguyen          #+#    #+#             */
/*   Updated: 2020/08/27 10:44:41 by phnguyen         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>

/*
** Function prototypes
*/
size_t	ft_strlen(char const *s);
int		ft_strcmp(char const *s1, char const *s2);
char	*ft_strcpy(char *dst, char const *src);
ssize_t	ft_write(int fildes, void const *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strdup(char const *s1);

#define malloc(x)	NULL

int		main(void)
{
	char *res;
	
	errno = 0;
	res = ft_strdup("failed");
	printf(" err -> %s\n", strerror(errno));
	return (0);
}