/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/08 08:21:16 by phnguyen          #+#    #+#             */
/*   Updated: 2020/08/27 03:34:05 by phnguyen         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * Check for syscalls values and os in makefile before push
 * And function name -> _function or function
 *
 */

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>

/*
** Useful macros
*/
# define STRLEN(x)			printf("\"%s\" = %ld (%ld)\n", x, ft_strlen(x), strlen(x));
# define STRCMP(a, b)		printf("\"%s\":\"%s\" = %d (%d)\n", a, b, ft_strcmp(a, b), strcmp(a, b));
# define STRCPY(a)			reset_str(str1, str2); ft_strcpy(str1, a); strcpy(str2, a); printf("strcmp : %d \"%s\"\n", strcmp(str1, str2), a);
# define WRITE(s, x)		printf("^%ld (`%s`:%ld)\n", ft_write(STDOUT_FILENO, s, x), s, x);
# define READ(b, x)			r = ft_read(STDIN_FILENO, buffer, x); printf("`%s`:%ld\n", buffer, r);
# define STRDUP(s)			tmp = ft_strdup(s); printf("`%s` (`%s`)\n", tmp, s); free(tmp); tmp = NULL;

/*
** Function prototypes
*/
size_t	ft_strlen(char const *s);
int		ft_strcmp(char const *s1, char const *s2);
char	*ft_strcpy(char *dst, char const *src);
ssize_t	ft_write(int fildes, void const *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strdup(char const *s1);

void	reset_str(char *str1, char *str2);

int main(void)
{
	char	*str1 = (char*)malloc(sizeof(char) * 50);
    char	*str2 = (char*)malloc(sizeof(char) * 50);
	char	*tmp;

	/*
	** TEST STRLEN
	*/
	printf("\nTEST ft_strlen\n");
    STRLEN("0123456789");
	STRLEN("mbkonuhivreanvjranbrjaeobnajnvreaonbjiapbvnhaobehaov");
	STRLEN("1");
	STRLEN("");
	printf("\n");

	/*
	** TEST STRCMP
	*/
	printf("TEST ft_strcmp\n");
    STRCMP("0123456789", "0123456789");
	STRCMP("", "0132456789");
	STRCMP("012456789", "0123456789");
	STRCMP("0123456789", "012345789");
	STRCMP("0123456789", "");
	STRCMP("0000", "0000000000");
	STRCMP("00001", "00000");
	printf("\n");
	
	/*
	** TEST STRCPY
	*/
	printf("TEST ft_strcpy\n");
	STRCPY("TOTO");
	STRCPY("");
	STRCPY("g nriuwhgr eubhjakbvhdjvb fdna,v beahjk");
	printf("\n");

	/*
	** TEST STRDUP
	*/
	printf("TEST ft_strcpy\n");
	STRDUP("TOTO");
	STRDUP("");
	STRDUP("g nriuwhgr eubhjakbvhdjvb fdna,v beahjk");
	printf("\n");

    // fd = open("test", O_WRONLY|O_APPEND);
	// if (fd < 0)
    // {
    //     err2 = errno;
    //     printf("%d %s\n", fd, strerror(err2));
    // }
    // else
    //     printf("Success fd = %d\n", fd);
    // err = ft_write(fd, "test_write\n", 11);
	// printf("%d %d write\n", err, fd);
    // if (err == -1)
    // {
    //     err2 = errno;
    //     printf("%d %s\n", err2, strerror(err2));
    // }
    // else
    //     printf("Success\n");
    // close(fd);
//     fd = open("test", O_RDONLY);
//     err = ft_read(fd, str2, 11);
//     if(err < 0)
//     {
//         err2 = errno;
//         printf("%d\n", err);
//         printf("%d %s\n", err2, strerror(err2));
//     }
//     else
//         printf("%d %s\n", err, str2);
//     if(fd != -1)
//         close(fd);
	free(str1);
	free(str2);
    return (0);
}

void	reset_str(char *str1, char *str2)
{
	bzero(str1, 50);
    bzero(str2, 50);
}