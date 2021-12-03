#include <stdio.h>
#include <math.h>

double factorial(int n){
    if (n == 0){
        return 1;
    }else{
        return(n * factorial(n-1));
    }
}

double taylor (double x, int n){
    double serie = 0;
    int i;

    for (i = 0; i <= n; i++) {
        serie = serie + (pow(x,i)/factorial(i));
    }
    return serie;
}

int main () {
    int n;
    double x, resultado;

    scanf("%lf", &x);
    scanf("%d", &n);

    resultado = taylor(x, n);
    printf("%lf \n", resultado);
}