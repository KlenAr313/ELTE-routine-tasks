#include <stdio.h>
#include <stdlib.h>

struct Node{
    int value;
    struct Node *left;
    struct Node *right;
};

typedef struct Node node_t;

void print(node_t* root);
void insert(node_t** pRoot, int v);

int main() {
    int i;
    node_t *head = NULL;

    while ( 1 == scanf("%d", &i)){
        insert(&head, i);
    }

    print(head);

    // need free

    return 0;
}

void print(node_t* root){
    if ( root ){ //NULL == False(0)
        print(root->left);
        printf("%d ", root->value );
        print(root-> right);
    }
}

void insert(node_t** pRoot, int v){
    if ( *pRoot ){
        node_t *root = *pRoot;
        if( v < root->value ){
            insert( &root->left, v);
        }
        else{
            insert( &root-> right, v);
        }
    }
    else{
        *pRoot = (node_t *)malloc( sizeof(node_t));
        if ( NULL == *pRoot ){
            fprintf(stderr, "Out of memory\n");
            exit(1);
        }
        node_t *root = *pRoot;
        root->left = NULL;
        root->right = NULL;
        root->value = v;       
    }
}    
