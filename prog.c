#include <stdio.h>
//#include <string.h>
#include "my_rules.h"
#define N 101

int check (char * s);


int main()
{
    char text[N];
    int flag;
    //int n=strlen(text);
    scanf("%s", text);
    printf("YOUR string:\n%s\n", text);
    flag=check(text);
    
    
    if (flag) {printf("Rule 1 (V2 - replace all numbers with letters ):\n"); first_rule(text);}
    else {printf("Rule 2 (V1 - all number must be at the begining of string in their original order):\n"); second_rule(text);}
    
    printf("%s\n", text);
    

    return 0;
}

//the first and last symbols are Latin letters
int check (char * s)
{
    char * c;
    if ((*s>='a' && *s<='z') || (*s>='A' && *s<='Z')) while (c=s++,*s!='\0');
    else return 0;
    return ((*c>='a' && *c<='z') || (*c>='A' && *c<='Z'))?1:0;
}

