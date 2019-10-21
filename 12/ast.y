%{ 
  #include<stdio.h>
  #include<stdlib.h>

  typedef struct node{
      int isOp;
      int type;
      struct node *left;
      struct node *right;
  }node;

  #define YYSTYPE node*
  
  void yyerror(char *s);
  void preorder(node *x);
  int yylex();
  
  int flag=0; 
%} 
  
%token NUMBER 
  
%left '+' '-'
%left '*' '/'
  
%% 
  
ArithmeticExpression: NUMBER '\n'
{ 
    printf("\nResult:\n");
    preorder($1); 
    return 0; 
};
  
%% 

void preorder(node *x)
{
    if (x==NULL)
        return;
    if(x->isOp)
    {
        switch(x->type)
        {
            case 0:
                printf("+ ");
            break;
            case 1:
                printf("- ");
            break;
            case 2:
                printf("* ");
            break;
            case 3:
                printf("/ ");
            break;
            default:
                yyerror("Unknown symbol");
            break;
        }
    }
    else
    {
        printf("%d ",x->type);
    }
    preorder(x->left);
    preorder(x->right);
}

void yyerror(char *s) 
{ 
   printf("Entered arithmetic expression is Invalid\n"); 
   flag=1; 
} 

int main(){

    extern FILE *yyin;
    yyin = fopen("input.txt", "r");
    yylex();

    return 0;
}
