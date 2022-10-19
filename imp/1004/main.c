#include <stdio.h>

int main()
{
	// int egy = 0, ketto = 0;
	// scanf("%d %d", &egy, &ketto);
	// printf("%d + %d = %d\n", egy, ketto, egy + ketto);
	// printf("%d - %d = %d\n", egy, ketto, egy - ketto);
	// printf("%d * %d = %d\n", egy, ketto, egy * ketto);
	// printf("%d %% %d = %d\n", egy, ketto, egy % ketto);
	// printf("%d / %d = %f\n", egy, ketto, (float)egy / (float)ketto);
	
	// int r = 0;
	// float pi = 3.14;
	// scanf("%d", &r);
	// printf("d = %d\n", r*2);
	// printf("K = %f\n", r*2*pi);
	// printf("K = %f\n", r*r*pi);
	
	//long int num, day, mon, year;
	/*
	do{
		num = 0;
		scanf("%d", &num);
		day = num % 100;
		mon = ((num % 10000) - (num % 100)) / 100;
		year = (num - (num % 10000)) / 10000;
	} while (day > 31 || mon > 12);
	printf("%d.%d.%d", year, mon, day);
	*/
	
	/*
	scanf("%ld.%ld.%ld", &year, &mon, &day);
	num = year * 10000 + mon * 100 + day;
	printf("%ld", num);
	*/
	
	/*
	int coord[2][2][2];
	scanf("%d %d %d %d", &coord[0][0][0], &coord[0][0][1], &coord[0][1][0], &coord[0][1][1]);
	scanf("%d %d %d %d", &coord[1][0][0], &coord[1][0][1], &coord[1][1][0], &coord[1][1][1]);
	
	printf("%d %d %d %d\n", coord[0][0][0], coord[0][0][1], coord[0][1][0], coord[0][1][1]);
	printf("%d %d %d %d\n", coord[1][0][0], coord[1][0][1], coord[1][1][0], coord[1][1][1]);
	
	
	int vector[2][2];
	vector[0][0] = coord[0][0][0] - coord[0][1][0];
	vector[0][1] = coord[0][0][1] - coord[0][1][1];
	vector[1][0] = coord[1][0][0] - coord[1][1][0];
	vector[1][1] = coord[1][0][1] - coord[1][1][1];
	
	if ( (vector[0][0] * vector[1][0] + vector[1][0] * vector[1][1] ) == 0){
		printf("Merőlegesek");
	}
	else{
		printf("Nem merőlegesek");
	}
	*/
	/*
	int i = 0;
	printf("%d\n", i++);
	printf("%d\n", ++i);
	*/
	
	/*
	int a = 0, b = 0;
	scanf("%d %d", &a, &b);
	
	a += b;
	b -= a;
	b *= -1;
	a -= b;
	
	printf("%d %d", a, b);
	*/
	
	/*
	int number = 0;
	scanf("%d", &number);
	int bits = number ^ -1;
	printf("%d -> %d", number, bits);
	*/
	
	char botu;
	scanf("%c", &botu);
	if ( botu >= 'a'){
		botu -= 'a';
		botu += 'A';
	}
	else if (botu <= 'Z'){
		botu += 'a';
		botu -= 'A';
	}
	
	printf("%c", botu);
	
	
	return 0;
}
