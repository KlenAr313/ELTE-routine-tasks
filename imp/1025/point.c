#include <stdio.h>

void getValue(int*);

int main () {
    int j = 0;


    printf("%d\n", j);
    getValue(&j);
    printf("%d\n", j);

    return 0;
}

void getValue(int* k){
    scanf("%d", k);
}
