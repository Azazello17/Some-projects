#include <stdio.h>
#define n 100
#include <stdlib.h>
#include "stack2.h"


int main()
{
    int res=0;
    int x, elem, op1, op2;
    
    while ((x=getchar())!=EOF && x!='\n' )
    {
        if (x==' ') continue;
        
        if (x!= '+' && x!= '-' && x!= '*' && x!= '/' ) 
        {
            if ('0'<=x && x<='9') 
            {
                
                elem=x-'0';
                while ((x=getchar())!=' ')
                {
                    if ('0'<=x && x<='9') elem= elem*10 + x-'0';
                    
                    else {fprintf(stderr, "Invalid operand\n"); exit(1);}
                }
            }
            else {fprintf(stderr, "Invalid operand\n"); exit(1);}
            
            if (0 <= elem && elem<= 65535) push(elem); 
            else {fprintf(stderr, "Went out of Short\n"); exit(1);}
            
        }
        
        
        else
        {
        
        
        switch (x)
        {
            case '+':
				
                if (! empty())  op1=pop(); 
                else {fprintf(stderr, "Less operands then operations\n"); exit(1);}
                
                if (! empty()) {op2=pop(); push(op2 + op1); break;}
                else {fprintf(stderr, "Less operands then operations\n"); exit(1);}
                
            case '-':
                if (! empty()) op1=pop();
                else {fprintf(stderr, "Less operands then operations\n"); exit(1);}
                
                if (! empty()) {op2=pop(); push(op2 - op1); break;}
                else {fprintf(stderr, "Less operands then operations\n"); exit(1);}
                
            case '*':
                if (! empty()) op1=pop();
                else {fprintf(stderr, "Less operands then operations\n"); exit(1);}
                
                if (! empty()) {op1*=pop(); push(op1); break;}
                else {fprintf(stderr, "Less operands then operations\n"); exit(1);}
                
                
                
            case '/':
                if (! empty()) op1=pop();
                else {fprintf(stderr, "Less operands then operations\n"); exit(1);}
                
                if (! empty() && op1!=0) {op2=pop(); push(op2/op1); break;}
                else 
                if (op1==0)
					{fprintf(stderr, "Error del zero\n"); exit(1);}
                else
					{fprintf(stderr, "Less operands then operations\n"); exit(1);}
            
            default: 
                break;
                
        }
        
        
        }
        

    }
    
    
    
    res=pop();
    //check 
    if ((res<=32767) && (res>= -32758)) 
    {
        
        if ( empty()) printf("%d\n", res);
        
        else {fprintf(stderr, "More operands then operations\n"); exit(1);}
        
    }
    
    
    else {fprintf(stderr, "Went out of Short\n"); exit(1);}
    
    
    return 0;
}
