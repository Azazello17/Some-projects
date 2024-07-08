#include <stdio.h>
#define n 5
#include <stdlib.h>

int s [n];
int top =0;

int pop()
{
    return s[--top];
}

int empty()
{
    return ! top;
}

void push(int x)
{
    if (top==n) {fprintf(stderr, "Stack_mem error\n"); exit(1);}
    s[top++]=x;
}

