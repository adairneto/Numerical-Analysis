#include <stdio.h>

/* exercício 10 do cap. 1 do livro da Ruggiero */

double soma (x, n) {
    double s = 0;
    int i;

    for (i = 0; i <= n; i++) {
        s = s + x;
    }

    return s;
}

int main () {
    double S, s, x;
    int n;

    scanf("%lf", &x);
    scanf("%d", &n);
    s = soma(x, n);
    S = 10000 - s;
    printf("O resultado é: %f\n", S);
}