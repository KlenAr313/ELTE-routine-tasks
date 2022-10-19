#include <stdio.h>
#include <limits.h>
#include <string.h>

int main() {
	//1
	// printf("%I64d\n", sizeof(int));
	// printf("%I64d\n", sizeof(long int));
	// printf("%I64d\n", sizeof(unsigned int));
	// printf("%I64d\n", sizeof(unsigned long int));
	// printf("%I64d\n", sizeof(char));
	// printf("%I64d\n", sizeof(0 < 1));
	// printf("%I64d\n", sizeof(float));
	// printf("%I64d\n", sizeof(double));
	// printf("%I64d\n\n", sizeof(long double));
	
	// //2
	// if (8 < 11 < 55)
		// printf("true\n\n");
	
	// //3
	// int vary;
	// vary = INT_MAX;
	// printf("%d\n", vary);
	// printf("%d\n\n", vary + 1);
	
	// //4
	// unsigned int uvary;
	// uvary = UINT_MAX;
	
	// printf("%u\n", uvary);
	// printf("%u\n\n\n", uvary + 1);
	
	//6
	// int y;
	// scanf("%i", &y);
	// int bol;
	// bol = (y % 4 == 0) && ((y % 100 != 0) || (y % 400 == 0));
	// printf("%i", bol);
	
	//Gyak
	//1
	// unsigned int hex;
	// scanf("%x", &hex);
	// printf("%i", hex);
	
	// char st[10];
	// int value[9];
	// scanf("%s", st);
	// int h = strlen(st);
	
	// for ( int i = 0; i < h; i++) {
		// if('0' <= st[i] && st[i] <= '9')
		// {
			// value[i] = st[i]-'0';
		// }
		// else if('a' <= st[i] && st[i] <= 'f')
		// {
			// value[i] = st[i]-'a'+10;
		// }
		// else {
			// printf("szar van a levesbe");
		// }
		// printf("%d ", value[i]);
	// }
	
	// printf("\n");
	
	// int val = 0;
	// for(int i = 0 ; i < h ; i++)
	// {
		// val *=16;
		// val += value[i];
	// }
	// printf("%d", val);
	
	//5
	
	int one, two;
	scanf("%d %d", &one, &two);
	
	printf("\n");
	while(one != two)
	{
		if (one < two)
		{
			two -= one;
		}
		else 
		{
			one -= two;
		}
	}
	
	printf("%d %d\n\n", one, two);
	
	//6
	
	for(int i = 0; i < 8; i++)
	{
		for (int j = 0; j < 8; j++)
		{
			if( (i + j) % 2 == 0)
			{
				printf("  ");
			}
			else 
			{
				printf("[]");
			}
		}
		printf("\n");
	}
	
	//Haladó
	//1
	
	int n;
	int pascal[n][n];
	scanf("%d", &n);
	for( int i = 0; i < n; i++)
	{
		for( int j = 0; j < n; j++)
		{
			pascal[i][j] = 0;
		}
	}
	
	pascal[0][0] = 1;
	pascal[1][0] = 1;
	pascal[1][1] = 1;
	for( int i = 2; i < n; i++)
	{
		for( int j = 0; j < n - ( n - i ); j++)
		{
			pascal[i][j] == pascal[i-1] + pascal[j];
		}
	}		
	
	
	


	return 0;
}
