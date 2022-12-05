#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define BUFSIZE 80
#define PROMPT "PB> " 
#define MAXARGS 2

void add(char*, char*);
void del(char*);
void quit(void);
void help(void);

typedef void (*comm)();

typedef struct COMMAND
{
    char* name;
    int npar;
    comm func;
}
command_t;

command_t commands[] = {
    {"add", 2, add},
    {"del", 1, del},
    {"quit", 0, quit},
    {"help", 0, help}
};

int nCommands = sizeof(commands)/sizeof(commands[0]);

int findCommand(char *buffer);
int findParams(char *buffer, char**, char**);


int main(){
    char buffer[BUFSIZE];
    char* args[MAXARGS];

    printf(PROMPT);
    while (fgets(buffer, BUFSIZE, stdin)){
        int i;
        if( -1 != (i = findCommand(buffer))){
            int npars = findParams(buffer, &args[0], &args[1]);
            if ( npars != commands[i].npar){
                fprintf(stderr, "command %s requires %d parameters\n", commands[i].name, commands[i].npar);
            }
            //printf("%d par1 = %s, par2 = %s\n", npars, args[0] ? args[0] : "none", args[1] ? args[1] : "none");
            switch (commands[i].npar)
            {
            case 0:
                commands[i].func();
                break;
            case 1:
                commands[i].func(args[0]);
                break;
            case 2:
                commands[i].func(args[0], args[1]);
                break;
            
            default:
                fprintf(stderr, "maximum pars: %d", MAXARGS);
                break;
            }
        }
        printf(PROMPT);
    }
    return 0;
}

int findCommand (char *buffer){
    char command[BUFSIZE];
    if ( 1 == sscanf(buffer, "%s", command)){
        for (int i = 0; i <nCommands; i++){
            if( 0 == strcmp(commands[i].name, command)){
                printf("execute %s at %d \n", command, i);
                return i;
            }
        }
        fprintf(stderr, "Unkown command: %s\n", command);
    }
    return -1;
}

int findParams(char *buffer, char** par1, char** par2){
    strtok(buffer, " \n\t");

    *par1 = strtok( NULL, " \n\t");
    *par2 = strtok( NULL, " \n\t");

    return (NULL != *par1) + (NULL != *par2);
}

void quit(void){
    printf("quiting...");
    exit(0);
}
void help(void){
    printf("add\ndel\nquit\nhelp\n");
}
void add (char* name, char* num){
    printf("addin %s %s\n", name, num);
}
void del (char* name){
    printf("addin %s", name);
}
