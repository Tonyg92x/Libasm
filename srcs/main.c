#include <stdio.h>
#include <stdlib.h>
#include "libasm.h"

int	main(void)
{
	char	*str1;
	char	*str2;

	str1	= malloc(sizeof(char) * 4);
	str2	= malloc(sizeof(char) * 4);

	str1	= "oko";
	str2	= "okn";
	ft_strdup(str1);
	printf("ok, %d\n", ft_strcmp(str1, str2));
	
	free(str1);
	free(str2);
	exit(0);
}
