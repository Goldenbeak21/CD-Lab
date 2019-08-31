%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
%}

%%

"and"						{printf("AND");}
":="						{printf("ASSIGN");}
":"							{printf("COLON");}
","							{printf("COMMA");}
"def"						{printf("DEF");}
"/"							{printf("DIV");}
"."							{printf("DOT");}
"else"						{printf("ELSE");}
"end"						{printf("END");}
"="							{printf("EQ");}
"exit"						{printf("EXITLOOP");}
"float"						{printf("FLOAT");}
"from"						{printf("FROM");}
"fun"						{printf("FUN");}
">="						{printf("GE");}
"global"					{printf("GLOBAL");}
">"							{printf("GT");}
"if"						{printf("IF");}
"int"						{printf("INT");}
"["							{printf("LEFT_SQ_BKT");}
"("							{printf("LEFT_PAREN");}
"<="						{printf("LE");}
"<"							{printf("LT");}
"-"							{printf("MINUS");}
"mod"						{printf("MOD");}
"*"							{printf("MULT");}
"<>"						{printf("NE");}
"not"						{printf("NOT");}
"null"						{printf("NUL");}
"or"						{printf("OR");}
"+"							{printf("PLUS");}
"print"						{printf("PRINT");}
"product"					{printf("PRODUCT");}
"read"						{printf("READ");}
"return"					{printf("RETURN");}
"->"						{printf("RETURNS");}
")"							{printf("RIGHT_PAREN");}
"]"							{printf("RIGHT_SQ_BKT");}
";"							{printf("SEMICOLON");}
"skip"						{printf("SKIP");}
"step"						{printf("STEP");}
"to"						{printf("TO");}
"while"						{printf("WHILE");}
[a-zA-Z][a-zA-Z0-9]+		{printf("ID");}
\".*\"						{printf("STRING");}
[0-9]+						{printf("INT_CONST");}
[0-9]+[.][0-9]+				{printf("FLOAT_CONST");}
"%d"|"%f"|"%s"				{printf("FORMAT");}
"//".*						{}
[" ""\n""\t"]				{printf("%s",yytext);}

%%

int yywrap(void) {return 1;}

int main(){

    extern FILE *yyin, *yyout;

    yyin = fopen("input.txt", "r");

	yylex();

	return 0;
}
