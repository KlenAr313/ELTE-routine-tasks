#ifndef FUNCS
#define FUNCS

#include <stdio.h>

FILE* openFile(const char *filename);
char* readLines(int lineMaxLength, FILE* file, char* data, int* arrayLength, int* currentLength);
void reverseWriteWithNum(int lineMaxLength, char* data, int currentLength);
void reverseWriteWithoutNum(int lineMaxLength, char* data, int currentLength);

#endif