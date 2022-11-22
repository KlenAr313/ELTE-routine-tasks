#include <stdio.h>
#include <stdlib.h>
#include "func.h"

FILE* fileOpening(const char *filename){
    FILE *fp = fopen(filename, "r");

    if (fp){
        return fp;
    }
    else{
        fprintf(stderr, "File not exists: %s", filename);
        exit(-1);
    }
}

FILE* fileWriting(const char *filename){
    FILE *fp = fopen(filename, "w");

    if (fp){
        return fp;
    }
    else{
        fprintf(stderr, "File not exists: %s", filename);
        exit(-1);
    }
}