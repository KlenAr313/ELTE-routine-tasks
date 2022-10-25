#include <stdio.h>

int sum (int*, int);
int sum2 (int*, int*);
int avg (int*, int*);
int* err();
int* minInd(int *, int *);
int strlenM(char[]);
int strcmpM(char[], char []);
int* max(int*, int);

int main () {
    //1
    int i = 0;
    int* ptrI = &i;

    *ptrI = 30;
    printf("%d\n", i);

    //2
    int j = 0;
    int **ptrPtr = &ptrI;
    *ptrPtr = &j;
    *ptrI = 20;
    printf("%d\n", j);

    //3
    void* pointrPointer = &pointrPointer;
    printf("%p\n", pointrPointer);

    //4
    int* nP ;
    nP = NULL;
    printf("%p\n", nP);

    //5
    int t[] = {1,2,3,4,5,6,7,8,9};
    int* tP = t;
    int l = sizeof(t)/sizeof(t[0]);
    printf("%d\n", sum(tP, l));

    //6
    int* teP = tP;
    teP = &t[8];
    printf("%d\n", sum2(tP, teP));

    //7
    printf("%d\n", avg(tP, teP));

    //8
    printf("%d\n", *(err()));

    //9
    /*
    Mert a scanf függvény nem visszatérési értéked ad, 
    hanem egy paraméterét szeretné megváltoztatni, 
    és ehhez a változó memóriacímére van szükség.
    */

    //10
    teP = &(t[4]);
    tP = &(t[0]);
    printf("%d\n", *(minInd(tP, teP)));

    //11
    char a[20];
    fgets(a, 20, stdin);
    printf("%d\n", strlenM(a));

    //11 b
    char b[20];
    fgets(b, 20, stdin);
    printf("%d\n", strcmpM(a, b));

    //12
    int x[] = {5,4,3,2,8,5,1};
    int xl = sizeof(x)/sizeof(x[0]);
    printf("%d", *(max(x, xl)));

    //13
    printf("%d", *(max((x + (xl/2)), xl/2)));


    return 0;
}

int sum(int* p, int l){
    int sum = 0;
    for (int i = 0; i < l; i++){
        sum += *(p + i);
    }
    return sum;
}

int sum2(int* p, int* e){
    int sum = 0;
    while ( p <= e ){
        sum += *p;
        p++;
    }
    return sum;
}

int avg(int* p, int* e){
    int avg = 0;
    int* b = p;
    while ( p <= e ){
        avg += *p;
        p++;
    }
    return avg / (e - b);
}

int* err(){
    int a = 99;
    int* p = &a;
    return p;
}

int* minInd(int* a, int* b){
    if ( a < b ){
        return a;
    }
    return b;
}


int strlenM(char ch[]){
    int count = 0;
    while(*ch != '\0'){
        count++;
        ch++;
    }
    return count - 1;
}

int strcmpM(char a[], char b[]){
    while ( *a == *b && *a != '\0' && *b != '\0'){
        a++;
        b++;
    }
    if (*a == '\0' && *b == '\0'){
        return 0;
    }
    return 1;
}

int* max(int* a, int l){
    int* maxP = a;
    for (int i = 1 ; i < l; i++){
        if (*maxP < *(a + i)){
            maxP = (a + i);
        }
    }
    return maxP;
}
