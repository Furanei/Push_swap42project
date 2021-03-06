/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parsing.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mbriffau <mbriffau@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/09/30 19:25:33 by mbriffau          #+#    #+#             */
/*   Updated: 2017/10/02 03:45:34 by mbriffau         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/push_swap.h"

t_ps	*init_p(int ac)
{
	t_ps	*p;

	if (!(p = (t_ps*)malloc(sizeof(t_ps))))
		ft_error("error_malloc");
	p->a = 0;
	p->b = 0;
	p->oa = 0;
	p->ob = ((ac - 1) * 2) - 1;
	p->size_a = ac - 1;
	p->size_b = 0;
	return (p);

}

int 	*parsing_array(int nac, char **av)
{
	int		*array;
	
	if (!(array = (int*)malloc(sizeof(int) * ((nac) * 2))))
		return (0);
	while (nac > 0)
	{
		array[nac - 1] = ft_atoi(av[nac]);
		nac --;
	}
	return (array);
}
