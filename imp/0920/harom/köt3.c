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
	
	if( i < 0){
		printf("%i: negaatív", i);
	}
	else if ( i > 0){
		printf("%i: pozitív", i);
	}
	else{
		printf("%i: nulla", i);
	}
	
	return 0;
}
