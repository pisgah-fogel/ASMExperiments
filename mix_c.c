#include <stdio.h>
#include <inttypes.h>

int64_t test_asm();

int64_t max_of_three(int64_t, int64_t, int64_t);

int64_t max_of_array(int64_t*, int64_t);

int64_t str_to_int64(char*, int64_t);

double sum_doubles(double*, int64_t);

int main(int argc, char** argv) {
	printf("test_asm: %d\n", test_asm());
	printf("max_of_three: %d\n", max_of_three(-64, -12, -33));
	int64_t ptr[] = {1, 2, 6, 12};
	printf("max_of_array: %d\n", max_of_array(ptr, 4));
	printf("str_to_int64(\"123456\"): %d\n", str_to_int64("123456", 6));
	double ptr2[] = {1.4, 1.7};
	printf("sum double: %f", sum_doubles(ptr2, 2));
	return 0;
}
