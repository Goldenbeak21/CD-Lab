%{
#include<stdio.h> 
#include<string.h>  
%} 
  
%s A B
  
%% 
<INITIAL>0 BEGIN INITIAL; 
<INITIAL>1 BEGIN A;
<INITIAL>\n BEGIN INITIAL; printf("Accepted\n"); 
<A>0 BEGIN B; 
<A>1 BEGIN INITIAL;
<A>\n BEGIN INITIAL; printf("Not Accepted\n"); 
<B>0 BEGIN A; 
<B>1 BEGIN B; 
<B>\n {BEGIN INITIAL; printf("Not Accepted\n");} 
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