#include <stdio.h>
#include <string.h>

void writeArray(int a[], int l);
void switchLimits(int a[], int l);
void Permutation(char a[], int l);

int main () {
    int t[] = {7,2,3,9,5,6,7,8};
    int l = sizeof(t)/sizeof(t[0]);
    writeArray(t, l);
    switchLimits(t, l);
    writeArray(t, l);

    char a[] = "ABC";
    //int s = sizeof(a)/sizeof(a[0]);
    strcat(a,a);
    printf("%s\n", a);
    //Permutation(a, s);

    return 0;
}

void writeArray(int a[], int l){
    for (int i = 0 ; i < l ; i++){
        printf("%d ", a[i]);
    }
    printf("\n");
}

void switchLimits(int a[], int l){
    int *min = a;
    int *max = a;
    for (int i = 0 ; i < l; i++){
        if(*min > a[i]){
            min = &(a[i]);
        }
        else if (*max < a[i]){
            max = &(a[i]);
        }
    }

    int h = *max;
    *max = *min;
    *min = h;
}

void Permutation(char a[], int l){
    for(int i = 0 ; i < l - 1; i++){
        printf("%c ", a[0]);
        Permutation(&a[i+1], l - 1);
        if (i == l - 2){
            printf("\n");
        }
    }
} 
