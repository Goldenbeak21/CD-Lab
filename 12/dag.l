%{ 
#include <stdio.h> 
%} 

%% 

[a-z] 		{
				char temp[100];
				sprintf(temp,"%s",yytext);

				int ret = check(temp);
				if(ret >= 0)
					yylval = list[ret];
				else
				{
					node *newnode=(node *)malloc(sizeof(node));
					newnode->isOp=0;
					newnode->left=NULL;
					newnode->right=NULL;
					newnode->type = yytext[0];
					newnode->id = index1;
					yylval = newnode;

					list[index1] = yylval;
					strcpy(expressions[index1++],temp);
				}
				return NUMBER;		
			} 
[" "|"\t"] 	; 
[\n] 		{return 0;}
. 			{return yytext[0];}

%% 

int yywrap()  {return 1;}