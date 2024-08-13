#include<stdio.h>
#include<stdlib.h>

int main() {
    FILE *file = fopen("generated_unit_prices.csv", "w");
    if (!file) {
        perror("Error opening file");
        return 1;
    }
    fprintf(file, "Product,Unit Price\n");
    for(int i =1 ; i <= 8; i++) {
        fprintf(file, "%d,%.2f\n", i, (double)rand() / RAND_MAX * 1000);
    }

    fclose(file);
    return 0;

}