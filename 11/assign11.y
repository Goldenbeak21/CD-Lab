%{

#include<stdio.h>
#include <alloca.h>
#include <math.h>
#include <stdlib.h>
#include <stddef.h>
#include <ctype.h>
#include <string.h>

#define YYSTYPE double

%}

%token NUMBER MOD
%token PLUS MINUS DIV MUL POW SQRT OPBRCK CLBRCK
%token ASIN ACOS ATAN SIN SINH COS COSH TAN TANH LOG CEIL FLOOR ABS

%%

calc	:	calc expr '\n'	{ printf("%g\n", $2); }
	|	calc '\n'
	|
	;
expr: pow
      ;
pow: add
        | pow POW add { $$ = pow($1,$3); }
        ;
add: mul
        | add PLUS mul  { $$ = $1 + $3;}
        | add MINUS mul { $$ = $1 - $3; }
        ;
mul: primary
        | mul MUL primary { $$ = $1 * $3; }
        | mul DIV primary { $$ = $1 / $3; }
        | mul MOD primary { $$ = fmod($1,$3); }
        ;
primary: OPBRCK expr CLBRCK { $$ = $2; }
        | function
        ;
function: SIN OPBRCK expr CLBRCK
               { $$ = sin($3); }
        | COS OPBRCK expr CLBRCK
               { $$ = cos($3); }
        | ABS OPBRCK expr CLBRCK
               { $$ = abs($3);}
        | LOG OPBRCK expr CLBRCK
               { $$ = log($3);}
        | SQRT OPBRCK expr CLBRCK 
               { $$ = sqrt($3); }               
	      | SINH OPBRCK expr CLBRCK
		           { $$ = sinh($3); }
        | ASIN OPBRCK expr CLBRCK
               { $$ = asin($3); }
        | ACOS OPBRCK expr CLBRCK
               { $$ = acos($3); }
        | ATAN OPBRCK expr CLBRCK
               { $$ = atan($3);}
        | TAN OPBRCK expr CLBRCK
               { $$ = tan($3);}
        | COSH OPBRCK expr CLBRCK
               { $$ = cosh($3);}
        | TANH OPBRCK expr CLBRCK
               { $$ = tanh($3);}
	      | CEIL OPBRCK expr CLBRCK
		           { $$ = ceil($3);}
	      | FLOOR OPBRCK expr CLBRCK
		           { $$ = floor($3);}              
	      | NUMBER 
        ;
%%

#include <stdio.h>
#include <ctype.h>
#include "lex.yy.c"
#include <string.h>
char *progname;

yyerror( s )
char *s;
{
  warning( s , ( char * )0 );
  yyparse();
}

warning( s , t )
char *s , *t;
{
  fprintf( stderr ,"%s: %s\n" , progname , s );
  if ( t )
  fprintf( stderr , " %s\n" , t );
}

int main(){

  extern FILE *yyin, *yyout;

  yyin = fopen("input.txt", "r");

  yyparse();

  return 0;
}
