%{
#include <stdio.h>
%}

%%

[0-9]+          {yylval =(char)(yytext[0]);return NUMBER;}
[a-z]           {yylval = (char)(yytext[0]);return LETTER;}
[" "|"\t"] 		{}
[\n]			{return 0;}
.               {return yytext[0];}

%%

int yywrap()  {return 1;}