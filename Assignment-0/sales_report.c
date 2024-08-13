#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define REGIONS 4
#define SALESMEN 6
#define PRODUCTS 8
#define MAX_LINE_LENGTH 100

typedef struct {
    int productCode;
    double unitPrice;
} UnitPrice;

void readUnitPrices(UnitPrice *unitPrices, int *priceCount, const char *filename) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Error opening file!");
        return;
    }

    char line[MAX_LINE_LENGTH];
    while (fgets(line, sizeof(line), file)) {
        sscanf(line, "%d,%lf", &unitPrices[*priceCount].productCode, &unitPrices[*priceCount].unitPrice);
        (*priceCount)++;
    }

    fclose(file);
}

double getUnitPrice(UnitPrice *unitPrices, int priceCount, int productCode) {
    for (int i = 0; i < priceCount; i++) {
        if (unitPrices[i].productCode == productCode) {
            return unitPrices[i].unitPrice;
        }
    }
    return 0.0;
}

void readSalesData(double salesData[REGIONS][SALESMEN], UnitPrice *unitPrices, int priceCount, const char *filename) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Error opening file");
        return;
    }

    char line[MAX_LINE_LENGTH];
    while (fgets(line, sizeof(line), file)) {
        int regionNo, salesmanNo, productCode, unitsSold;
        sscanf(line, "%d,%d,%d,%d", &regionNo, &salesmanNo, &productCode, &unitsSold);

        double unitPrice = getUnitPrice(unitPrices, priceCount, productCode);
        if (unitPrice != 0.0) {
            salesData[regionNo - 1][salesmanNo - 1] += unitPrice * unitsSold;
        }
    }

    fclose(file);
}

void generateReport(double salesData[REGIONS][SALESMEN], const char *outputFilename) {
    FILE *outfile = fopen(outputFilename, "w");
    if (!outfile) {
        perror("Error opening output file");
        return;
    }






    fprintf(outfile, "ABC Company\n");





    for (int region = 0; region < REGIONS; ++region) {
        fprintf(outfile, "Region %d\n", region + 1);
        double totalRegionSales = 0;

        for (int salesman = 0; salesman < SALESMEN; ++salesman) {
            double sales = salesData[region][salesman];
            totalRegionSales += sales;
            fprintf(outfile, "Salesman %d Rs. %.2f/-\n", salesman + 1, sales);
        }

        fprintf(outfile, "Total sale at Region %d Rs %.2f/-\n", region + 1, totalRegionSales);
    }

    fclose(outfile);
}

int main() {
    UnitPrice unitPrices[PRODUCTS];
    int priceCount = 0;
    double salesData[REGIONS][SALESMEN] = {0};

    readUnitPrices(unitPrices, &priceCount, "generated_unit_prices.csv");
    readSalesData(salesData, unitPrices, priceCount, "generated_sales_data.csv");
    generateReport(salesData, "sales_report.txt");

    printf("Sales report generated successfully.\n");

    return 0;
}
