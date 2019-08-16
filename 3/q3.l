%{ 
    #include<stdio.h>
	#include<string.h>

	int i=0;
	char *arr[100];
	void check(char *str);
%} 

%% 

[0-9] 									{printf("digit ");}
[0-9]+ 									{printf("digits ");}
[0-9]+([.][0-9]+)?([E][+-]?[0-9]+)? 	{printf("numbers ");}
[a-zA-z]([a-zA-z]|[0-9])* 				{check(yytext);}
([<]|[>]|[<][=]|[>][=]|[<][>]|[=]) 		{printf("relop ");}
["\n"" ""\t"] 							{printf("%s",yytext);}
[{|}|(|);]								{}

%% 

int yywrap(){ return 0;}  

int main(int argc, char*argv[]) 
{ 
    extern FILE *yyin, *yyout;

    yyin = fopen("input1.txt", "r");
    yyout = fopen("ouput1.txt", "w");

	yylex(); 
	return 0; 
} 

void check(char *str)
{
	if(strcmp(str,"if")==0) printf("if ");
	else if(strcmp(str,"else")==0) printf("else");
	else if(strcmp(str,"then")==0) printf("then");
	else if(strcmp(str,"main")==0) printf("main");
	else if(strcmp(str,"INT")==0) printf("datatype");
	else if(strcmp(str,"for")==0) printf("for");
	else if(strcmp(str,"while")==0) printf("while");
	else if(strcmp(str,"read")==0) printf("read");
	else if(strcmp(str,"print")==0) printf("print");
	else {printf("id");}
}