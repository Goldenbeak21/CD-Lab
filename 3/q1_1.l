%{ 
#include<stdio.h> 
#include<string.h> 
%} 

%%
(1*|01*0)*		{printf("Accepted\n");}
.*				{printf("Rejected\n");}
%%

int yywrap(void){} 

int main() 
{    
    extern FILE *yyin, *yyout;

    yyin = fopen("i.txt", "r");
    yyout = fopen("o.txt", "w");
	
    yylex(); 
  
    return 0; 
}
