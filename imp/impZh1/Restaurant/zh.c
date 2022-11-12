#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int dailyDiscountMenu(void);
double modifiedPrice(int ind, double mul);
int generateReview(void);
void printMenuData(int ord);

double prices[] = {40.5, 30.15, 55.3, 24.65, 29.43};

int main() {
    int orders[] = {1, 3, 4, 2, 2, 1, 5, 4, 4, 3, 5};
    printMenuData(3);
}

int dailyDiscountMenu(void){
    time_t t;
    srand((unsigned) time(&t));
    int rnd = rand() % 5 + 1;
    return rnd;
}

double modifiedPrice(int ind, double mul){
    double modified = prices[ind] * mul;
    return modified;
}

int generateReview(void){
    time_t t;
    srand((unsigned) time(&t));
    int rnd = rand() % 10 + 1;
    return rnd;
}

void printMenuData(int ord){
    printf("Menu #%d\n", ord);
    int rnd = dailyDiscountMenu();
    printf("Net price: %.2f\n", rnd == ord ? modifiedPrice(ord - 1, 0.8) : prices[ord-1]);
    printf("Gross price: %.2f\n", rnd == ord ? modifiedPrice(ord - 1, 0.8 * 1.27) : modifiedPrice(ord - 1, 1.27));
    printf("Customer review: %d", generateReview());
}
