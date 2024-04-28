#include <stdio.h>
#include <math.h>
#include <stdint.h>

int main() {
	printf("DEPTH = 8192;\n");
	printf("WIDTH = 16;\n");
	printf("ADDRESS_RADIX = DEC;\n");
	printf("DATA_RADIX = HEX;\n");
	printf("CONTENT;\n");
	printf("BEGIN;\n");
	printf("END;\n");
	int i;
	for (i = 0; i < 8192; i++) {
		if (i < 1024)
			printf("%d\t:\t%x;\n", i, (int) (i / 1024.0 * 32767.0));
		else if (i >= 7168)
			printf("%d\t:\t%x;\n", i, (int) ((8191 - i) / 1024.0 * 32767.0));
		else
			printf("%d\t:\t%x;\n", i, 32767);
	}
	int32_t a = 32767;
	int32_t b = 32767;
	int32_t c = a * b;
	int16_t *top = (int16_t *) (((char *) &c) + 0);
	printf("%d\n", *top);
	return 0;
}
