#include <stdio.h>

void WriteArray(int*, int);
void Permutation(int*, int, int*, int, int*, int, int*);
void Subtract(int*, int, int*, int*, int*);
int Include(int, int*, int);

int main () {
    int fullLength;
    scanf("%d", &fullLength);
    int original[fullLength];
    int starter[fullLength];
    int help[fullLength];
    int* base = help;

    for (int i = 0; i < fullLength; i++){
        scanf("%d", &(original[i]));
        starter[i] = original[i];
    }

    Permutation(original, fullLength, starter, fullLength, help, fullLength, base);

    //WriteArray(original, fullLength);
}

void Permutation(int* original, int originalLength, int* left, int leftL, int* current, int fullLength, int* base){

    if (leftL == 1){
        *current = left[0];
        WriteArray(base, fullLength);
    }
    else {
        for (int i = 0; i < leftL; i++){
            *current = left[i];
            Subtract(original, originalLength, base, current, left);
            Permutation(original, originalLength, left, (leftL - 1), (current + 1), fullLength, base);
            for ( int j = leftL; j > i; j--){
                left[j] = left [ j - 1 ];
            }
            left[i] = *current;
        }
    }
}

void Subtract(int* original, int originalLength, int* base, int* current, int* left){
    int index = 0;
    for (int i = 0; i < originalLength; i++){
        if(!Include(original[i], base, ((current - base) + 1))){
            left[index] = original[i];
            index++;
        }
    }
}

int Include(int element, int* arr, int length){
    int i = 0;
    while ( arr[i] != element && i < length){
        i++;
    }
    if (i == length){
        return 0;
    }
    else{
        return 1;
    }
}

void WriteArray(int* arr, int length){
    for (int i = 0; i < length; i++){
        printf("%d ", *arr);
        arr++;
    }
    printf("\n");
}
