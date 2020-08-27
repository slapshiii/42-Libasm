/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/08 08:21:16 by phnguyen          #+#    #+#             */
/*   Updated: 2020/08/28 01:45:39 by phnguyen         ###   ########.fr       */
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
#include <errno.h>
#include <fcntl.h>

/*
** Useful macros
*/
#define BUFFER_SIZE 		100
#define STRLEN(x)			printf("\"%s\" = %ld (%ld)\n", x, ft_strlen(x), strlen(x));
#define STRCMP(a, b)		printf("\"%s\":\"%s\" = %d (%d)\n", a, b, ft_strcmp(a, b), strcmp(a, b));
#define STRCPY(a)			reset_str(str1, str2); ft_strcpy(str1, a); strcpy(str2, a); printf("strcmp : %d \"%s\"\n", strcmp(str1, str2), a);
#define WRITE(f, s, x)			errno = 0; printf(":%ld (\'%s\':%d)", ft_write(f, s, x), s, x); printf(" err -> %s\n", strerror(errno));
#define READ(f, b, x)			errno = 0; bzero(buffer, 100); r = ft_read(f, buffer, x); printf("`%s`:%ld", buffer, r); printf(" err -> %s\n", strerror(errno));
#define STRDUP(s)			tmp = ft_strdup(s); if(tmp){printf("strcmp : %d \'%s\'\n", strcmp(tmp, s), tmp); free(tmp);}else{printf("%s %s\n", tmp, strerror(errno));}tmp = NULL;

/*
** Function prototypes
*/
size_t	ft_strlen(char const *s);
int		ft_strcmp(char const *s1, char const *s2);
char	*ft_strcpy(char *dst, char const *src);
ssize_t	ft_write(int fildes, void const *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strdup(char const *s1);

// static char	str1[50];
// static char	str2[50];

void	reset_str(char *str1, char *str2);

int main(void)
{
	char	*str1 = (char*)malloc(sizeof(char) * 50);
    char	*str2 = (char*)malloc(sizeof(char) * 50);
	char	*buffer = (char*)malloc(sizeof(char) * BUFFER_SIZE);
	char	*tmp;
	long	r = 0;
	//int res = strlen(NULL);
	//char *res = strdup(NULL);
	//printf("%d strlen null\n", res);

	/*
	** TEST STRLEN
	*/
	printf("\nTEST ft_strlen\n");
    STRLEN("0123456789")
	STRLEN("mbkonuhivreanvjranbrjaeobnajnvreaonbjiapbvnhaobehaov")
	STRLEN("1")
	STRLEN("")
	printf("\n");

	/*
	** TEST STRCMP
	*/
	printf("TEST ft_strcmp\n");
    STRCMP("0123456789", "0123456789")
	STRCMP("", "0132456789")
	STRCMP("012456789", "0123456789")
	STRCMP("0123456789", "012345789")
	STRCMP("0123456789", "")
	STRCMP("0000", "0000000000")
	STRCMP("00001", "00000")
	printf("\n");
	
	/*
	** TEST STRCPY
	*/
	printf("TEST ft_strcpy\n");
	STRCPY("TOTO")
	STRCPY("")
	STRCPY("g nriuwhgr eubhjakbvhdjvb fdna,v beahjk")
	STRCPY("1234567890123456789012345678901234567890123456789")
	STRCPY("1234567890123456789012345678901234567890123456789\0")
	printf("\n");

	/*
	** TEST STRDUP
	*/
	printf("TEST ft_strdup\n");
	STRDUP("TOTO")
	STRDUP("")
	STRDUP("g nriuwhgr eubhjakbvhdjvb fdna,v beahjk")
	STRDUP("gmjreiognjuighuingisiugjnsthbnstonbtonbsnbdiunbdunduibpsoiudejoiujodibiufdn j hsohgu vuh bhreu obhhruei ge")
	printf("\n");

	int fd_RD = open("./Makefile", O_RDONLY);
	int fd_WR = open("./test", O_WRONLY|O_APPEND);

	/*
	** TEST WRITE
	*/
	printf("TEST ft_write\n");
	WRITE(1, "toto", 4)
	WRITE(1, "totototo", 4)
	WRITE(1, "totototo", 8)
	WRITE(1, "toto", 2)
	WRITE(1, "toto", 3)
	WRITE(1, "", 3)
	WRITE(-1, "not writable", 5)
	WRITE(fd_RD, "only read", 10)
	WRITE(fd_WR, "Write success", 13)
	printf("\n");

	/*
	** TEST READ
	*/
	printf("TEST ft_read\n");
	READ(0, buffer, 4)
	READ(0, buffer, 14)
	READ(0, buffer, 0)
	READ(-1, buffer, 50)
	READ(fd_RD, buffer, BUFFER_SIZE - 1)
	READ(fd_WR, buffer, 50)
	printf("\n");	

	free(str1);
	free(str2);
	free(buffer);
	close(fd_RD);
	close(fd_WR);
    return (0);
}

void	reset_str(char *str1, char *str2)
{
	bzero(str1, 50);
    bzero(str2, 50);
}