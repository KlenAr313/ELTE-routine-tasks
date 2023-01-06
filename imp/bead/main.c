#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "structs.h"
#include "func.h"


int main(int argc, char* argv[]){

    if(argc < 3){
        printf("Usage:\n\trev [SHOW LINE NUMBERS] [MAX LINE LENGTH] files...\n");
        return 0;
    }
    else if(argc >= 3){
        args_t args;
        int lineMaxLength = atoi(argv[2]);
        char* isNumbered = argv[1];

        if(strcmp("linenums", isNumbered) == 0 || strcmp("nolinenums", isNumbered) == 0){
            args.lineMaxLength = lineMaxLength + 1;
            if(strcmp("linenums", isNumbered) == 0){
                args.isNumbererd = 1;
            }
            else{
                args.isNumbererd = 0;
            }

            int arrayLength = 2;
            int currentLength = 0;
            char* data = (char*)malloc(args.lineMaxLength*sizeof(char)*arrayLength);

            if(!data){
                printf("Memory allocation failed!");
                exit(-1);
            }

            if (argc == 3){
                data = readLines(args.lineMaxLength, stdin, data, &arrayLength, &currentLength);
            }
            else{
                for(int i = 3; i < argc; i++){
                    //printf("asd\n");
                    FILE* file = openFile(argv[i]);
                    if(file != NULL){
                        //printf("%s", argv[i]);
                        data = readLines(args.lineMaxLength, file, data, &arrayLength, &currentLength);
                        fclose(file);
                    }
                }
            }

            if(args.isNumbererd){
                reverseWriteWithNum(args.lineMaxLength, data, currentLength);
            }
            else{
                reverseWriteWithoutNum(args.lineMaxLength, data, currentLength);
            }

            if(!data){
                free(data);
            }
        }
    }
    
    return 0;
}