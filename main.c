/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: phnguyen <phnguyen@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/04/08 08:21:16 by phnguyen          #+#    #+#             */
/*   Updated: 2020/04/08 11:07:22 by phnguyen         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libasm.h>
#include <stdio.h>
#include <unistd.h>

/**
 * Check for syscalls values and os in makefile before push
 * And function name -> _function or function
 *
 */


int main(void)
{
    char str[20];

    printf("looking for: 10, res: %ld\n", ft_strlen("0123456789"));
    printf("looking for: 0, res: %d\n", ft_strcmp("0123456789", "0123456789"));
    printf("looking for: 1, res: %d\n", ft_strcmp("0123456789", "0123456788"));
    printf("looking for: -1, res: %d\n", ft_strcmp("0123456788", "0123456789"));
    printf("looking for: %s, res: %s\n", "0123456789", ft_strcpy(str, "0123456789"));
    printf("looking for: %s, res: %s\n", "abcd", ft_strcpy(str, "abcd"));

    printf("looking for: %d, res: %ld\n", 11, ft_write(2, "0123456789\n", 11));
    printf("looking for: %d, res: %ld\n", 12, ft_write(1, "0123456789\n", 12));
    
    
    return (0);
}