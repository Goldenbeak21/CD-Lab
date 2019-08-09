%{ 
    #include<stdio.h>
	#include<string.h>
	void check(char *str);
%} 

%% 

[0-9] 									{printf("digit ");}
[0-9]+ 									{printf("digits ");}
[0-9]+([.][0-9]+)?([E][+-]?[0-9]+)? 	{printf("numbers ");}
[a-zA-z] 								{printf("letter ");}
[a-zA-z]([a-zA-z]|[0-9])* 				{check(yytext);}
([<]|[>]|[<][=]|[>][=]|[<][>]|[=]) 		{printf("relop ");}
["\n"" "] {}

%% 

int yywrap(){}  

int main(int argc, char*argv[]) 
{ 
	yylex(); 
	return 0; 
} 
void check(char *str)
{
	if(strcmp(str,"if")==0) printf("if ");
	else if(strcmp(str,"else")==0) printf("else ");
	else if(strcmp(str,"then")==0) printf("then ");
	else printf("id: %s\n",yytext);
}