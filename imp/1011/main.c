#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//#5
//int guessing(int, int);

//#6
int isArmsrong(int);
int power(int, int);

int main() {
    int i;
    //#1
    /*
    int n = 0, szam = 0;
    scanf("%d", &n);
    //n = (n * (n+1)) / 2;
    for (i = 1; i <= n; i++){
        szam = szam + i;
    }
    printf ("szam: %d, i: %d\n", szam,i);*/

    //#2
    /*int szam = 0, elso = 0, utolso = 0;
    scanf ("%d", &szam);
    elso = szam % 10;
    int ten = 10;
    while (szam > szam%ten){
        ten *= 10;
    }
    ten = ten / 10;
    utolso = (szam - (szam % ten)) / ten;
    szam = szam-(utolso * ten);
    szam = szam + (elso * ten);
    szam = szam - elso;
    szam = szam + utolso;
    printf ("elso: %d   utolso: %d    szam: %d\n\n", elso, utolso, szam);*/

    //#3
    /*int szam, n;
    scanf ("%d %d", &szam, &n);
    printf("1\n");
    printf("%d\n", szam);
    int alap = szam;
    for ( i = 1; i < n; i++){
        szam = szam * alap;
        printf ("%d\n", szam);
    }*/

    //#5
    /*time_t t;
    srand((unsigned) time(&t));
    int rnd = rand() % 20;
    int res = 0;
    res = guessing(rnd, res);
    printf("%d tippelésből találtad ki!\n", res);*/

    //#6

    /*int ten = 10, szam, ossz = 0, n = 0;
    scanf ("%d", &szam);
    while (szam != szam%ten){
        n++;
        ten *= 10;
    }

    ten = 10;
    while ( szam != szam%ten){
        int most = ((szam % ten) -(szam % (ten /10)));
        for (i = 1; i < n-1; i++){
            most *= most;
        }
        ossz += most;
        ten *= 10;
    }

    printf("%d", ossz);*/

    int n;
    scanf("%d", &n);
    n++;
    for(i = 0; i <n; i++){
        if(isArmsrong(i)){
            printf("%d\n", i);
        }
    }

    return 0;
}


//#6
int isArmsrong(int k){
    int length = 1, original = k, sum =0;
    while ( 0 < (k /=10)){
        length++;
    }

    k = original;
    while ( 0 < k){
        sum += power( k%10, length);
        k /=10;
    }
    return (sum == original);
}

int power(int a, int b){
    int res = 1;
    for ( int i = 0 ; i < b; i++){
        res *=a;
    }
    return res;
}

//#5
/*int guessing(int rnd, int res){
    int guess;
    scanf("%d", &guess);
    res++;
    if (guess < rnd){
        printf("A szám nagyobb\n");
        res = guessing(rnd, res);
    }else if (guess > rnd){
        printf("A szám kisebb\n");
        res = guessing(rnd, res);
    }
    else{
        printf("Ez az a szám\n");
    }
    return res;
}*/