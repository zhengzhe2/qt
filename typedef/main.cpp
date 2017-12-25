#include <stdio.h>

typedef int (*FP_CALC)(int, int);

int add(int a, int b)
{
    return a + b;
}

int sub(int a, int b)
{
    return a - b;
}

int mul(int a, int b)
{
    return a * b;
}

int div(int a, int b)
{
    return b ? a / b : -1;
}

FP_CALC calc_func(char op)
{
    switch (op)
    {
    case '+':
        return add;
    case '-':
        return sub;
    case '*':
        return mul;
    case '/':
        return div;
    default:
        return NULL;
    }

    return NULL;
}

int (*s_calc_func(char op))(int, int)
{
    return calc_func(op);
}

int calc(int a, int b, char op)
{
    FP_CALC fp = calc_func(op);
    int (*s_fp)(int, int) = s_calc_func(op);
    if (fp == s_fp) {
        printf("fp == s_fp\n");
    }
    if (fp) {
        return fp(a, b);
    }
    else {
        return -1;
    }
}


//char (*pFun)(int);

typedef char (*pFun)(int);
char glFun(int a);

pFun gl_pFun()
{
    return glFun;
}

char glFun(int a)
{
    switch (a)
    {
    case 1:
        return 'A';
    default:
        return 'E';
    }
}



int main()
{

    pFun pf = gl_pFun();
    printf("--------- %c \n", pf(2));

//    pFun = glFun;
//    printf("-------  %c\n", (*pFun)(2));


    int a = 100, b = 20;

    printf("calc(%d, %d, %c) = %d\n", a, b, '+', calc(a, b, '+'));
    printf("calc(%d, %d, %c) = %d\n", a, b, '-', calc(a, b, '-'));
    printf("calc(%d, %d, %c) = %d\n", a, b, '*', calc(a, b, '*'));
    printf("calc(%d, %d, %c) = %d\n", a, b, '/', calc(a, b, '/'));
    return 1;
}
