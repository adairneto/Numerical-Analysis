#include <stdio.h>

float prec_float() {
	float A = 1;
	float s = 2;
	while (s > 1) {
		A = A/2;
		s = 1+A;
	}
	float prec_float = 2*A;
	return prec_float;
}

double prec_double() {
	double A = 1;
	double s = 2;
	while (s > 1) {
		A = A/2;
		s = 1 + A;
	}
	double prec_double = 2*A;
	return prec_double;
}

int main() {
	float prec_float = prec_float;
	double prec_double = prec_double;
	printf("Precisão em float: %f\n", prec_float);
	printf("Precisão em double: %lf\n", prec_double);
}
