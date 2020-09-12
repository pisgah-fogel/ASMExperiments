#include <stdio.h>
#include <inttypes.h>

int64_t test_asm();

int64_t max_of_three(int64_t, int64_t, int64_t);

int64_t max_of_array(int64_t*, int64_t);

int64_t str_to_int64(char*, int64_t);

double sum_doubles(double*, int64_t);

void add_16_uchar(uint8_t*, uint8_t*, uint8_t*);

int main(int argc, char** argv) {
	printf("test_asm: %d\n", test_asm());
	printf("max_of_three: %d\n", max_of_three(-64, -12, -33));
	int64_t ptr[] = {1, 2, 6, 12};
	printf("max_of_array: %d\n", max_of_array(ptr, 4));
	printf("str_to_int64(\"123456\"): %d\n", str_to_int64("123456", 6));
	double ptr2[] = {1.4, 1.7};
	printf("sum double: %f\n", sum_doubles(ptr2, 2));

	size_t i;
	uint8_t a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
	uint8_t b[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160};
	uint8_t result[16];
	add_16_uchar(result, a, b);
	printf("add_16_uchar ");
	for (i=0; i<16; i++)
		printf("%d ", result[i]);
	printf("\n");
	return 0;
}
