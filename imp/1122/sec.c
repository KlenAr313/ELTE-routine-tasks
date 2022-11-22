#include <stdio.h>

#include "func.h"


int main (int argc, char* argv[]){
    if ( 2 < argc){
        FILE* fp1 = fileOpening(argv[1]);
        FILE* fp2 = fileOpening(argv[2]);
        FILE* fpOUT = fileWriting("output.txt");

        int eofF = 0;
        int a = 0 , b = 0;
        int res = 1;
        while (!eofF){
            res = fscanf(fp1, "%d", &a);
            eofF = eofF || (res == -1);

            res = fscanf(fp2, "%d", &b);
            eofF = eofF || (res == -1);

            if(!eofF)
                fprintf(fpOUT, "%d\n", a * b);
        }
        fclose(fp1);
        fclose(fp2);
        fclose(fpOUT);
    }
    else{
        printf("Gimmi file names %d", argc);
    }
}