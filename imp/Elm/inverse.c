#include <stdio.h>

int main (){
    int prev, curr;
    scanf("%d", &prev);
    while ( 1 == scanf("%d", &curr) ){
        if ( curr < prev ){
            fprintf(stderr, "Something wrong here: %d %d\n", prev, curr );
        }
        prev = curr;
    }
}
