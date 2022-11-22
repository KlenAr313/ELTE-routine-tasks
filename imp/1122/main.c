#include <stdio.h>
#include <string.h>
#define BUFFERSIZE 40
#include "cpy.h"

int strchar(char* txt);
int countWords(char* txt);
int strcompare(char* txt, char* txt2);

int main (){
    char txt[BUFFERSIZE];
    fgets(txt, BUFFERSIZE, stdin);
    printf("%d\n",strchar(txt));
    printf("%d\n", countWords(txt));
    fflush(stdout);
    char txt2[BUFFERSIZE];
    fgets(txt2, BUFFERSIZE, stdin);
    if(strcmp(txt, txt2) == 0){
        printf("same\n");
    }
    else{
        printf("not\n");
    }

    if(strcompare(txt, txt2) == 0){
        printf("same\n");
    }
    else{
        printf("not\n");
    }

    char txt3[BUFFERSIZE];
    strcpy(txt3, txt2);
    printf("%s", txt3);

    strcopy(txt3, txt2);
    printf("%s", txt3);

    //FILE *fp = fopen();
    return 0;
}

int strchar(char* txt){
    int sum = 0;
    int i = 0;
    while ( txt[i] != '\0' && txt[i] != '\n' && txt[i] != '\r' ){
        if(txt[i] != ' '){
            sum++;
        }
        i++;
    }
    return sum;
}

int countWords(char* txt){
    int sum = 0;
    int i = 0;
    while ( txt[i] != '\0' && txt[i] != '\n' && txt[i] != '\r' ){
        if (txt[i] == ' ' || txt[i] == '\0' || txt[i] == '\n' || txt[i] == '\r'){
            sum++;
        }
        i++;
    }
    if (txt[i] == ' ' || txt[i] == '\0' || txt[i] == '\n' || txt[i] == '\r'){
        sum++;
    }
    return sum;
}

int strcompare(char* txt, char* txt2){
    int i = 0;
    while ( txt[i] != '\0' && txt[i] != '\n' && txt[i] != '\r' 
    && txt2[i] != '\0' && txt2[i] != '\n' && txt2[i] != '\r'
    && txt2[i] == txt[i]){
        i++;
    }

    return txt[i] - txt2[i];
}

