#include <stdio.h>

int main () {
	
	float farenheit = -20;
	
	while (farenheit <= 200){
		printf("k: %f, c: %f\n", farenheit, (farenheit-32)/ 1.8);
		farenheit += 10;
	}
	
	printf("\" Hello \n World \"\n");
	
	//3
	int i;
	scanf("%d", &i);
	
	int res = 0;
	while (i != 0){
		res = res * 10 + (i % 10);
		i = i / 10;
		printf("%d\n", res);
	}
	printf("\n%d\n osztrói:\n", res);
	
	//4
	i = 1;
	while(i <= (res/2))
	{
		if (res % i ==0)
		{
			printf("%d, ", i); 
		}
		i++;
	}		
	printf("\n");
	printf("\n");
	
	//6
	for(int j = 1; j <= 10 ; j++){
		for (int k = 1; k <= 10 ; k++){
			printf("%d\t", j * k);
		}
		printf("\n");
	}
	printf("\n");
	
	float f = 0;
	while (f <= 1){
		printf("%f\t", f);
		f += 0.1;
	}
	
	return 0;
}
