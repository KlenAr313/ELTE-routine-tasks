#include <stdio.h>
#include <stdlib.h>

struct Impfaktor{
    double publics;
    int erdosNum;
};

typedef struct Impfaktor Impfaktor;

union Data{
    int subjects;
    double kki;
    Impfaktor impfaktor;
};

typedef union Data Data;

enum Type{
    BSc,
    MSc,
    PhD
};

typedef enum Type Type;

struct Student{
    double avg;
    int age;
    Type type;
    char id[7];
    Data data;
};

typedef struct Student Student;

char* best (Student* students, int length);
Student* init(Type type);

int main(){
    printf("%lu\n", (long unsigned int)sizeof(Student));

    Data data1;
    data1.subjects = 7;
    Data data2;
    data2.kki = 4.2;
    Data data3;
    data3.impfaktor.publics = 20;
    data3.impfaktor.erdosNum = 4;

    Student students[] = {
        {4.2,19,BSc,"h9mrbv",data1}, {4,20,MSc,"abcdef", data2},{4.5,19,PhD,"at7k48", data3}
    };
    char* bestId = best(students, sizeof(students)/sizeof(Student));
    printf("%s\n", bestId);

    Student* first = init(BSc);
    printf("%f, %d, %s, %d", first->avg, first->age, first->id, first->data.subjects);
    free(first);
}

char* best (Student* students, int length){
    int bestI = 0;
    for (int i = 1; i < length; i++){
        if (students[i].avg > students[bestI].avg){
            bestI = i;
        }
    }
    return students[bestI].id;

}

Student* init(Type type){
    Student* student = (Student *)malloc(sizeof(Student));
    student->avg = 3.2;
    student->age = 22;
    student->type = type;
    *(student->id + 0) = 's';
    *(student->id + 1) = '8';
    *(student->id + 2) = 'g';
    *(student->id + 3) = '3';
    *(student->id + 4) = 'd';
    *(student->id + 5) = 's';
    *(student->id + 6) = '\0';
    switch(type){
        case BSc: 
            student->data.subjects = 8;
            break;
        case MSc: 
            student->data.kki = 3.7;
            break;
        case PhD: 
            student->data.impfaktor.publics = 21;
            student->data.impfaktor.erdosNum = 5;
            break;
        default:
            break;
    }
    return student;
}
