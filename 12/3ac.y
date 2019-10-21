%{
#include<stdio.h>

char temp = 'A'-1;

#define YYSTYPE char

void yyerror(char *s);
int yylex();
%}


%left '+' '-'
%left '/' '*'

%token LETTER NUMBER
%%

statement: exp '\n' {printf("%c = %c\n", ++temp,(char)$1);};
exp: exp '+' exp {printf("%c = %c + %c\n", ++temp,(char)$1,(char)$3);$$ = temp;}
    |exp '-' exp {printf("%c = %c - %c\n", ++temp,(char)$1,(char)$3);$$ = temp;}
    |exp '/' exp {printf("%c = %c / %c\n", ++temp,(char)$1,(char)$3);$$ = temp;}
    |exp '*' exp {printf("%c = %c * %c\n", ++temp,(char)$1,(char)$3);$$ = temp;}
    |'(' exp ')' {$$= (char)$2;}
    |NUMBER {$$ = (char)$1;}
    |LETTER {$$ = (char)$1;}
    ;

%%

void yyerror(char *s){
    printf("Error %s",s);
}

int main() 
{ 
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt", "r");
    yylex();
} 