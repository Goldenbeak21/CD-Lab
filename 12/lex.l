%{ 
  typedef struct node{
      int isOp;
      int type;
      struct node *left;
      struct node *right;
  }node;
%}

%% 

[0-9]+	 		{ 
					node *newnode=(node *)malloc(sizeof(node));
					newnode->isOp=0;
					newnode->left=NULL;
					newnode->right=NULL;
					newnode->type=atoi(yytext);
					printf("NUMBER\n");
				}		 
[" "|"\t"|"\n"]	{} 
. 				{printf("%s\n",yytext);}

%% 

int yywrap() {return 1;}

int main(){

    extern FILE *yyin, *yyout;

    yyin = fopen("input.txt", "r");

    yylex();

    return 0;
}