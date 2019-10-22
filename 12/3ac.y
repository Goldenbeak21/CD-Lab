%{

  #include<stdio.h>

  #define YYSTYPE char

  void yyerror(char *s);
  char temp = 'A'-1;

  #include "y.tab.h"
  #include "lex.yy.c"

%}


%token LETTER NUMBER

%left '+' '-'
%left '/' '*'

%%

statement: exp {printf("%c = %c\n", ++temp,(char)$1);return 0;};
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

int main(){
    printf("Enter the expression: ");
    yyparse();
    return 1;
}