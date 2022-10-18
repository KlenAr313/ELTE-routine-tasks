#include <stdio.h>
#include <string.h>
#define BUFFERSIZE 100

int sum(int a[], int);
int max(int a[], int);
int min(int a[], int);
int min2(int a[], int);
void mul(int a[], int b[], int);
float avg(int a[], int);
void conv (char a[], int l);
int abc(char a[], char b[], int al, int bl);

int main () {
    //int i = 0;
    //int t[] = {1,2,3,4,5,13};
    //int s[] = {1,2,3,4,5,6};
    //int result;
    //int l = sizeof(t)/sizeof(t[0]);
    // result = sum(t, l);
    // printf("%d\n", result);

    // result = max (t,l);
    // printf("%d\n", t[result]);

    //result = min2 (t,l);
    //printf("%d\n", t[result]);

    // mul(t,s,l);
    // result = sum(t, l);
    // printf("%d\n", result);

    //float average = avg (t,l);
    //printf("%f\n", average);

    char chara[BUFFERSIZE], charb[BUFFERSIZE];
    fgets(chara, BUFFERSIZE, stdin);
    fgets(charb, BUFFERSIZE, stdin);

    //char chara[] = "akc\0";
    //char charb[] = "abC\n";
    int a = strlen(chara);
    conv(chara, a);
    int b = strlen(charb);
    conv(charb, b);

    int res = abc (chara, charb, a, b);
    printf("%d\n", res);

    return 0;
}

int sum(int a[], int l){
    int s = 0;
    for (int i = 0; i < l; i++){
        s += a[i];
    }
    return s;
}

int max(int a[], int l){
    int m = 0; 
    for (int i = 1; i < l; i++){
        if (a[i] > a[m]){
            m = i;
        }
    }
    return m;
}

int min(int a[], int l){
    int min =  0;
    for (int i = 1; i < l; i++){
        if (a[min] > a[i]){
            min = i;
        }
    }
    return min;
}

int min2(int a[], int l){
    int mi = min(a,l) ;
    int min2 = max (a,l);
    for (int i = 1; i < l; i++){
        if (a[min2] > a[i] && a[i] != a[mi]){
            min2 = i;
        }
    }
    return min2;
}

void mul(int a[], int b[], int l){
    for(int i = 0; i < l ; i++){
        a[i] = a[i] *  b[i];
    }
}

float avg (int a[], int l){
    return (float)sum(a,l) / l;
}

void conv (char a[], int l){
    for (int i = 0; i < l ; i++){
        if ((a[i] == '\r') || (a[i] == '\n') || (a[i] == '\0')){
            a[i] = '\0';
        }else if (a[i] < 'a'){
            a[i] = a[i] - 'A' + 'a';
        }
    }
}

int abc (char a[], char b[], int al, int bl){
    int l = al <= bl ? al : bl;
    //l -= 2;
    int i = 0;
    while ( i < l ) {
        if ( a[i] == b[i]){
            i++;
        }
        else if ( a[i] < b[i]){
            return 1;
        }
        else{
            return 2;
        }
    }
    
    if (al == bl ){
        return (0);
    }
    return al < bl ? 1 : 2;
}
