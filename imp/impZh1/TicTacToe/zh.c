#include <stdio.h>
#define COLS 7
#define ROWS 6

struct TableData{
    int table[ROWS][COLS];
    int top[COLS];
};
typedef struct TableData table_t;
table_t gameTable;

void init(void);
void printTable(void);
int submit(char colCh, int player);
int evaluate();
int game(char* chptr);

int main(){
    init();

    char game1[] = "AAAAAAABBBBBBBCCCCCCCDDDDDDDEEEEEEEFFFFFFFGGGGGG";
    game(game1);
    printTable();
    return 0;
}

void init(void){
    for(int i = 0; i < ROWS; i++){
        for (int j = 0; j < COLS; j++){
            gameTable.table[i][j] = 0;
        }
    }
    for(int i = 0; i < COLS; i++){
        gameTable.top[i] = 0;
    }
}

void printTable(void){
    for(int i = 0; i < ROWS; i++){
        for (int j = 0; j < COLS; j++){
            printf("%d ",gameTable.table[ROWS-(i+1)][j]); 
        }
        printf("\n");
    }
}

int submit(char colCh, int player){
    int col = colCh - 'A';
    if ( !(0 <= col && col < COLS) ){
        fprintf(stderr, "Bad column: %c\n", colCh);
        return 0;
    }
    else if (!(player == 1 || player == 2)){
        fprintf(stderr, "Bad player: %d\n", player);
        return 0;
    }
    else if (gameTable.top[col] == ROWS){
        fprintf(stderr, "Column %c is full\n", colCh);
        return 0;
    }
    else{
        gameTable.table[gameTable.top[col]][col] = player;
        gameTable.top[col]++;
        return 1;
    }
}

int evaluate(){
    for (int i = 1; i < ROWS - 1; i++){
        for (int j = 0; j < COLS; j++){
            if(gameTable.table[i][j] != 0 && gameTable.table[i][j] == gameTable.table[i-1][j] && gameTable.table[i][j] == gameTable.table[i+1][j]){
                return gameTable.table[i][j];
            }
        }
    }

    for (int i = 0; i < ROWS; i++){
        for (int j = 1; j < COLS - 1; j++){
            if(gameTable.table[i][j] != 0 && gameTable.table[i][j] == gameTable.table[i][j-1] && gameTable.table[i][j] == gameTable.table[i][j+1]){
                return gameTable.table[i][j];
            }
        }
    }

    return 0;
}

int game(char* chptr){
    int db = 0;
    int halp = 0;
    int win = 0;
    while(*chptr != '\0'){
        db++;
        halp = (db % 2) == 1 ? 1 : 2; 
        submit(*chptr, halp);
        win = evaluate();
        if (win == 1){
            printf("First player wins.\n");
            return 1;
        }
        else if( win == 2){
            printf("Second player wins.\n");
            return 2;
        }
        chptr++;
    }
    printf("Draw.\n");
    return 0;
}
