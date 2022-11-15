#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define BUFFERSIZE 21
#define WORDS 5

char* reverse(char*, int);

int main(int argc, char** argv){
    int n = 5;
    if ( argc > 1){
        n = atoi(argv[1]);
    }
    /*
    
    char s[BUFFERSIZE];
    fgets(s, BUFFERSIZE, stdin);
    int len = strlen(s);
    char* c;
    c = (char*)malloc(sizeof(char)* (len + 1 ));
    
    if(!c){
        fprintf(stderr, "No memory\n");
        return 0;
    }

    int i = 0;
    while (s[i] != '\0'){
        *(c + i) = *(s + i);
        i++;
    }
    *(c + i) = '\0';

    printf("%s", c);

    free(c);

    reverse(s, len);

    free(c);
    */
    char tomb[n][BUFFERSIZE];
    for (int i = 0; i < n; i++){
        fgets(*(tomb+i), BUFFERSIZE, stdin);
    }

    for ( int i = 0; i < n; i++){
        printf("%s", *(tomb + n - 1 - i));
    }

    return 0;
}

char* reverse(char* s, int len){
    char* c;
    c = (char*)malloc(sizeof(char)* (len + 1));
    
    if(!c){
        fprintf(stderr, "No memory\n");
        return 0;
    }

    int j;
    for(j = 0; j < len; j++){
        *(c + j) = *(s + (len - j - 1));
    }
    *(c + j) = '\0';

    printf("%s", c);

    return c;
}
