#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_file(const char* filename) {
	FILE* fp;
	fp = fopen(filename, "r");
	if (!fp) {
		fwrite("Error, cannot read file\n", sizeof(char), 24, stdout);
		return;
	}
	char buff[10];
	size_t i;
	do {
		i = fread(buff, sizeof(char), 10, fp);
		fwrite(buff, sizeof(char), i, stdout);
	} while(i == 10);
	fclose(fp);
}

int int_from_file(const char* filename) {
	FILE* fp;
	fp = fopen(filename, "r");
	if (!fp) {
		fwrite("Error, cannot read file\n", sizeof(char), 24, stdout);
		return -1;
	}
	char buff[10];
	int s = fread(buff, sizeof(char), 10, fp);
	if (s > 10-1)
		fwrite("Warning: better increase the buffer's size\n", sizeof(char), 43, stdout);
#ifdef DEBUG
	printf("%d bytes read from %s\n", s, filename);
	printf("Read %s", buff);
#endif
	int a = atoi(buff);
#ifdef DEBUG
	printf("Parsed %d\n", a);
#endif
	fclose(fp);
	return a;
}

// /sys/class/power_supply/BATC/charge_now 
// /sys/class/power_supply/BATC/charge_full
// /sys/class/power_supply/BATC/capacity
//  
// /sys/class/power_supply/BATC/voltage_min_design 
// /sys/class/power_supply/BATC/voltage_now

int main(int argc, char** argv)
{
	int a = int_from_file("/sys/class/power_supply/BATC/charge_now");
	int b = int_from_file("/sys/class/power_supply/BATC/charge_full");
	printf("Charge: %d / %d ", a, b);
	int c = (100*a)/b;
	printf(" %d% \n", c);
	int d = int_from_file("/sys/class/power_supply/BATC/capacity");
	printf("Capacity: %d - ", d);
	print_file("/sys/class/power_supply/BATC/capacity_level");

	int e = int_from_file("/sys/class/power_supply/BATC/voltage_now");
	int f = int_from_file("/sys/class/power_supply/BATC/voltage_min_design");
	printf("Voltage: %d, min: %d\n", e, f);

	return 0;
}
