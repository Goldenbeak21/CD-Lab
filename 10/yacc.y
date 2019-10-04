%{
#include<stdio.h>

%}

%token num

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%

F : S {printf("\nValue = %d\n",$$);
return 0; }
S : S '+' A { $$ = $1 + $3; }
| A { $$ = $1;}
;
A : A '*' B {$$ = $1 * $3; }
| B
;
B : B '-' C { $$ = $1 - $3; }
| C
;
C : C '/' D { $$ = $1 / $3; }
| D
;
D : '(' S ')' { $$ = $2; }
| num
;

%%

extern int yylex();
extern int yyparse();

int main(){
	yyparse();
	return 0;
}

void yyerror()
{
	printf("Invalid\n");

}