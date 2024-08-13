#include<stdio.h>
#include<stdlib.h>

#define REGIONS 4
#define SALESMEN 6
#define PRODUCTS 8

int main() {
    FILE *file = fopen("generated_sales_data.csv", "w");
    if (!file) {
        perror("Error opening file");
        return 1;
    }
    fprintf(file, "Region,Salesman,Product,Units Sold\n");
for(int i = 1; i <= 500; i++) {
    fprintf(file, "%d,%d,%d,%d\n", rand() % REGIONS + 1, rand() % SALESMEN + 1, rand() % PRODUCTS + 1, rand() % 100);
}


    fclose(file);




}