#include <stdio.h>
#include <stdlib.h>

int* func1(int a, int b);

int main () {
    int* p;
    p = func1(2,3);
    printf("%d", *p);
    free(p);
}

int* func1(int a, int b){
    int *resutlt = (int*)malloc(sizeof(int));
    if (resutlt != NULL){
        *resutlt = a + b;
        return resutlt;
    }
    return NULL;
}
