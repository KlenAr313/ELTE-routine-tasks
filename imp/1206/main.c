#include <stdio.h>
#include <stdlib.h>

struct Box
{
    int weight;
    struct Box* next;
};

typedef struct Box box_t;

int isEmpty(void);
void peek(void);
void initialise (void);
void push(int);
void pop(void);
void copyTop(void);

box_t* top;

int main(){
    initialise();
    peek();
    push(2);
    peek();
    push(9);
    peek();
    copyTop();
    peek();
    pop();
    peek();
    pop();
    peek();
    copyTop();
    pop();
    pop();
    peek();
}

void initialise (void){
    top = NULL;
}

int isEmpty(void){
    if (top == NULL)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void peek(void){
    if(!isEmpty()){
        printf("%d\n", top->weight);
    }
    else{
        fprintf(stderr, "There is nothing\n");
    }
}

void push(int weight){
    box_t* new = (box_t*)malloc(sizeof(box_t));
    if(!new){
        fprintf(stderr, "Something went wrong here!");
    }
    new->weight = weight;
    new->next = top;
    top = new;
}

void pop(void){
    if(!isEmpty()){
        box_t* next = top->next;
        free(top);
        top = next;
    }
}

void copyTop(void){
    if(!isEmpty()){
        push(top->weight);
    }
    else{
        fprintf(stderr, "The stack is empty");
    }

}