#include <stdio.h>
#define BUFFERSIZE 30

void f();

void g(int asd);

void k();

void counter(char);

void swap(int* a, int* b);

int* deam(int* a, int* b);

void printAll(char* chp, int strCount, int buf);

int i = 5;
int main() {
    printf("%d", i);
    f();
    printf("%d", i);
    g(8);
    
    char buffer[BUFFERSIZE];
    char* cp = buffer;
    fgets(buffer, BUFFERSIZE, stdin);

    while (*cp != '\0'){
        counter(*cp);
        cp++;
    }

    counter('\0');

    k();
    k();
    k();
    k();

    int a = 7;
    int b = 88;

    swap(&a, &b);
    printf("\na:%d\nb:%d", a, b);

    printf("\n%d\n", *(deam(&a, &b)));

    char nations[4][BUFFERSIZE] = {"Hungary","Gerany","France","Greak"};
    printf("%I64d\n", sizeof(nations)/(sizeof(nations)/sizeof(nations[0])));
    printAll(nations[0], sizeof(nations)/sizeof(nations[0]), sizeof(nations)/(sizeof(nations)/sizeof(nations[0])));

    return 0;
}

void f(void){
    int i = 0;
    if(1){
        printf("%d", i);
    }
    {
        extern int i;
        i = 7;
        printf("%d", i);
    }
}

void g(int dsdsds){
    printf("\n%d\n",dsdsds);
}

void counter(char ch){
    static int count = 0;
    if(ch == '\0'){
        printf("Number of char: %d", count);
    }
    else{
        if ((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z')){
            count++;
        }
    }
}

void k(){
    static int h = 0;
    h++;
    printf("\n%d", h);
}

void swap(int* a, int* b){
    int cs = *a;
    *a = *b;
    *b = cs;
}

int* deam(int* a, int* b){
    if ( *a < *b ){
        return b;
    }
    return a;
}

void printAll(char* chp, int strCount, int buf){
    for(int i = 0; i < strCount * buf; i += buf){
        printf("%s\n", (chp + i));
    }
}
//4 nop
//7 nop