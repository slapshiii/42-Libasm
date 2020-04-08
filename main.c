/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/08 08:21:16 by phnguyen          #+#    #+#             */
/*   Updated: 2020/04/08 13:40:59 by phnguyen         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

/**
 * Check for syscalls values and os in makefile before push
 * And function name -> _function or function
 *
 */


int main(void)
{
    char str[20];
    int fd;
    int err;
    int err2;
    char *str2;

    str2 = calloc(50, sizeof(char));

    printf("looking for: 10, res: %ld\n", ft_strlen("0123456789"));
    printf("looking for: 0, res: %d\n", ft_strcmp("0123456789", "0123456789"));
    printf("looking for: 1, res: %d\n", ft_strcmp("0123456789", "0123456788"));
    printf("looking for: -1, res: %d\n", ft_strcmp("0123456788", "0123456789"));
    printf("looking for: %s, res: %s\n", "0123456789", ft_strcpy(str, "0123456789"));
    printf("looking for: %s, res: %s\n", "abcd", ft_strcpy(str, "abcd"));

    printf("looking for: %d, res: %ld\n", 11, ft_write(2, "0123456789\n", 11));
    printf("looking for: %d, res: %ld\n", 12, ft_write(1, "0123456789\n", 12));
    
    fd = open("test", O_WRONLY);
//    err2 = errno;
    err = ft_write(fd, "test_write\n", 11);
    if(err == -1)
    {
        err2 = errno;
        printf("%d\n", err);
        printf("%d %s\n", err2, strerror(err2));
    }
    else
        printf("Success\n");
    close(fd);
    fd = open("test", O_RDONLY);
    err = ft_read(fd, str2, 11);
    if(err < 0)
    {
        err2 = errno;
        printf("%d\n", err);
        printf("%d %s\n", err2, strerror(err2));
    }
    else
        printf("%d %s\n", err, str2);
    if(fd != -1)
        close(fd);
    free(str2);
    return (0);
}