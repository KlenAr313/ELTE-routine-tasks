#include <stdio.h>
#include <ctype.h>
#define BUFSIZE 16

void hexdump(FILE* fp);
void print (long , unsigned char b[], int);

int main(int argc, char* argv[]){
    if (argc == 1){
        hexdump(stdin);
    }
    else{
        for (int i = 1; i< argc; i++){
            FILE *fp = fopen(argv[i], "r");
            if (fp != NULL){
                hexdump(fp);
                fclose(fp);
            }
            else{
                fprintf(stderr, "Cannot open %s file\n", argv[i]);
            }
            
        }
    }


    return 0;
}

void hexdump(FILE* fp){
    static long address = 0L;
    int cnt = 0;
    unsigned char buffer[BUFSIZE];
    int ch;

    while ( EOF != (ch = fgetc(fp))){
        buffer[cnt] = ch;
        cnt++;
        if ( BUFSIZE == cnt){
            print(address, buffer, cnt);
            cnt = 0;
            address += BUFSIZE;
        }
    }
    if (cnt != 0){
        print(address, buffer,cnt);
    }
}

void print (long address, unsigned char b[], int cnt){
    printf("\n%08lx  ", address);
    for (int i = 0; i < cnt; i++){
        printf(" %02x",b[i]);
        if( (i + 1) % 4 == 0 && (i + 1) != BUFSIZE){
            printf(" |");
        }
    }
    for(int i = cnt ; i < BUFSIZE; i++){
        printf("   ");
        if( (i + 1) % 4 == 0 && (i + 1) != BUFSIZE){
            printf("  ");
        }
    }
    printf(" | ");
    for (int i = 0; i < cnt; i++){
        printf("%c", isprint(b[i]) ? b[i] : '.');
    }
}
