#include <stdio.h>

int main(){
	int i = 2;
	
	scanf("%d", &i);
	if(i%2 == 0){
		printf("%i: páros\n", i);
	}
	else{
		printf("%i: páratlan\n", i);
	}
	return 0;
}
