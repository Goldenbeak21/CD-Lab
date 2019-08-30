%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	#include "lex.yy.c"
	int yylex();
	void yyerror(char *s);
%}

%token DING DONG DELL
%start rhyme

%%

rhyme 
	:	sound place '\n' {printf("string valid\n");}
	;
	
sound
	:	DING DONG
	;
place: DELL;

%%

extern int yylex();
extern int yyparse();
extern int line_num;

void yyerror(char *s){
	printf("Error: %s at line %d\n",s, line_num);
	exit(-1);
}

int main(){
	yyparse();
	printf("Accepted\n");
	return 0;
}
