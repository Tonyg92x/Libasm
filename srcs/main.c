#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "libasm.h"
#include "color.h"

int	main(void)
{
	//	--------------		Welcome message		---------------	//
	printf("%sWelcome into TonyG libasm tester.\n\n%sFeel free to upgrade missing tests via the github repository.\nHappy Hacking!%s\n\n", BLUE, GREEN, NORMAL);

	//	---------------		ft_strlen tests		---------------	//
	printf("%sStarting ft_strlen tests%s\n\n", BLUE, NORMAL);
	size_t		tgt_result;
	size_t		act_result;
	const char 	*str0="Hello World!";
	const char	*str1="TeST1Ta%#!@\n";
	const char	*str2="AEygsagadsrhgwsrt1345213rg2135531235";
	
	//	ft_strlen test0
	printf("ft_strlen test0: ");
	tgt_result = strlen(str0);
	act_result = ft_strlen(str0);
	if (tgt_result != act_result)
		printf("%sERROR%s - strlen == %i vs ft_strlen == %i on %s\n", RED, NORMAL, tgt_result, act_result, str0);
	else
		printf("%sOK%s\n", GREEN, NORMAL);

	//	ft_strlen test1
	printf("ft_strlen test1: ");
	tgt_result = strlen(str1);
	act_result = ft_strlen(str1);
	if (tgt_result != act_result)
		printf("%sERROR%s - strlen == %i vs ft_strlen == %i on %s\n", RED, NORMAL, tgt_result, act_result, str0);
	else
		printf("%sOK%s\n", GREEN, NORMAL);
	
	//	ft_strlen test2
	printf("ft_strlen test2: ");
	tgt_result = strlen(str2);
	act_result = ft_strlen(str2);
	if (tgt_result != act_result)
		printf("%sERROR%s - strlen == %i vs ft_strlen == %i on %s\n", RED, NORMAL, tgt_result, act_result, str0);
	else
		printf("%sOK%s\n", GREEN, NORMAL);
	
	exit(0);
}
