%{
#include <stdio.h>
%}

%%

[0-9]+          {printf("NUMBER");}
[a-z]           {printf("LETTER");}
[" "|"\n"|"\t"] {}
.               {printf("%c",yytext[0]);}

%%

int yywrap()  {return 1;}

int main(){
    printf("Enter the expression: ");
    yylex();
    return 1;
}