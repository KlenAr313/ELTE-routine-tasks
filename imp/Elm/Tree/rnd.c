#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char* argv[]){
    int max = 1000;
    if (argc > 1){
        int max2 = atoi(argv[1]);
        max = max2 == 0 ? max : max2;
    }

    srand(time(0));
    for (int i = 0; i < max; i++){
        printf("%d ", rand());
    }
    return 0;
}
