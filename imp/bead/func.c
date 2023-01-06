#include <stdio.h>
#include <stdlib.h>
#include "func.h"

FILE* openFile(const char *filename){
    FILE *fp = fopen(filename, "r");

    if (fp != NULL){
        return fp;
    }
    else{
        fprintf(stderr, "File opening unsuccessful: %s", filename);
        return NULL;
    }
}

char* readLines(int lineMaxLength, FILE* file, char* data, int* arrayLength, int* currentLength){
    char c;
    while ((c = fgetc(file)) != EOF){
        *(data + lineMaxLength * (*currentLength)) = c;
        int i = 1;
        while( (c = fgetc(file)) != EOF && c != '\n' && i < lineMaxLength - 1){
            //putchar(c);
            //printf("%s", *(data + lineMaxLength * (*currentLength)));
            *(data + lineMaxLength * (*currentLength) + i) = c;
            i++;
        }
        //printf("%d", i);
        *(data + lineMaxLength * (*currentLength) + i) = '\0';
        if(c != '\n'){
            while((c = fgetc(file)) != '\n' && c != EOF);
        }
        //printf("You: %s, len: %d\n", data + lineMaxLength * (*currentLength), *currentLength);
        
        *currentLength = *currentLength + 1;
        if (*currentLength > (*arrayLength - 1))
        {
            //printf("DOUBLE!");
            *arrayLength = *arrayLength * 2;
            //printf("%d",*arrayLength);
            data = (char*)realloc(data, lineMaxLength*sizeof(char)*(*arrayLength));
            if(!data){
                printf("Memory allocation failed!");
                exit(-1);
            }
        }
    }
    return data;
}

void reverseWriteWithNum(int lineMaxLength, char* data, int currentLength){
    for(int i = currentLength; i > 0; i--){
        int j = 0;
        while (*(data + lineMaxLength * (i - 1) + j) != '\0')
        {
            j++;
        }
        printf("%d ", i);
        for(int k = j; k >= 0; k--){
            putchar(*(data + lineMaxLength * (i - 1) + k));
        }
        printf("\n");
    }

}
void reverseWriteWithoutNum(int lineMaxLength, char* data, int currentLength){
    for(int i = currentLength; i > 0; i--){
        int j = 0;
        while (*(data + lineMaxLength * (i - 1) + j) != '\0')
        {
            j++;
        }
        for(int k = j - 1; k >= 0; k--){
            putchar(*(data + lineMaxLength * (i - 1) + k));
        }
        printf("\n");
    }
}
