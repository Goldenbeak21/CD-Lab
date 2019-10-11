%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
%}

number [0-9]+\.?|[0-9]*\.[0-9]+

%%

[ \t]   { ; }
log     return LOG;
sin     return SIN;
cos     return COS;
tan     return TAN;
sinh    return SINH;
cosh    return COSH;
tanh    return TANH;
asin    return ASIN;
acos    return ACOS;
atan    return ATAN;
ceil    return CEIL;
floor   return FLOOR;
abs     return ABS;
{number} { yylval=atof(yytext);return NUMBER;}
"+"     return PLUS;
"-"     return MINUS;
"/"     return DIV;
"*"     return MUL;
"^"     return POW;
sqrt    return SQRT;
"("     return OPBRCK;
")"     return CLBRCK;
"%"     return MOD;
\n|. 	{return yytext[0];}

%%

int yywrap(void) {return 1;}