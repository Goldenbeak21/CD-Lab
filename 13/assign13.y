%{

#include <stdio.h>
#include <string.h>

int yylex();

int success = 1;
int num_count = 0;

void yyerror(const char *s);
extern int yylineno;

int label = 0;
int else_label = 0;
int while_label = 0;

#include "y.tab.h"
#include "lex.yy.c"

%}

%locations
%token AND ASSIGN COLON COMMA DEF DIV DOT ELSE END EQ EXITLOOP FLOAT FLOAT_CONST FORMAT FROM FUN GE GLOBAL GT IF INT LEFT_PAREN LEFT_SQ_BKT LE LT MINUS MOD MULT NE NOT NUL OR PLUS PRINT PRODUCT READ RETURN RETURNS RIGHT_PAREN RIGHT_SQ_BKT SEMICOLON SKIP STEP STRING TO WHILE

%left PLUS MINUS
%left MULT DIV MOD
%left AND OR 
%nonassoc NOT
%left LEFT_SQ_BKT RIGHT_SQ_BKT
%left LEFT_PAREN RIGHT_PAREN
%nonassoc IF
%nonassoc ELSE

%start prog
%union{ char val[100];}
   
%type<val> exp relOP bExp
%token<val> ID INT_CONST

%%
prog
  : GLOBAL stmtListO END 
  ;

stmtListO
  : stmtList
  |
  ;
stmtList
  : stmtList SEMICOLON stmt
  | stmt
  ;

stmt
  : assignmentStmt 
  | readStmt
  | printStmt
  | ifStmt
  | whileStmt
  ;

assignmentStmt
  : ID ASSIGN exp {printf("%s = %s\n",$1,$3);}
  ;

readStmt
  : READ ID {printf("t_%d = Read %s\n",num_count++,$2);}
  ;

printStmt
  : PRINT ID {printf("print %s\n",$2);}
  ;

ifStmt
  : IF bExp 
  {
    printf("t_%d = %s\n",num_count,$2);
    printf("If !t_%d goto L_%d\n",num_count,label);
    else_label = label;
    num_count++;
    label++;
  }

  COLON stmtList elsePart END
  ;

elsePart
  : ELSE 
  {
    printf("goto L_%d\n",label);
    printf("L_%d : ",else_label);
    else_label--;
    label++;
  }

  stmtList {printf("L_%d : ",label-1);}

  | {printf("L_%d : ",label);}
  ;

whileStmt
  : WHILE {
            printf("L_%d : ",label);
            while_label = label;
            label++;
          }
    bExp {  printf("If !%s goto L_%d\n",$3,while_label+1); label++;}

    COLON stmtList {
            printf("goto L_%d\n",while_label); 
            printf("L_%d : ",while_label+1);
            while_label--;
            while_label--;
          }
    END
  ;

bExp
  : bExp OR bExp 
  {
    printf("t_%d = %s or %s\n",num_count,$1,$3); 
    sprintf($$, "t_%d", num_count++);
  }

  | bExp AND bExp
  {
    printf("t_%d = %s and %s\n",num_count,$1,$3); 
    sprintf($$, "t_%d", num_count++);
  }

  | NOT bExp 
  {
    printf("t_%d = !%s\n",num_count,$2);
    sprintf($$, "t_%d", num_count++);
  }  
  | LEFT_PAREN bExp RIGHT_PAREN 
  {
    printf("t_%d = %s\n",num_count,$2);
    sprintf($$, "t_%d", num_count++);
  }

  | exp relOP exp 
  {
    printf("t_%d = %s %s %s\n",num_count,$1,$2,$3);
    sprintf($$, "t_%d", num_count++);
  }
  ;

relOP
  : EQ {strcpy($$, "==");}
  | LE {strcpy($$, "<=");}
  | LT {strcpy($$, "<");}
  | GE {strcpy($$, ">=");}
  | GT {strcpy($$, ">");}
  | NE {strcpy($$, "!=");}
  ;

exp
  : exp PLUS exp  
  {
    printf("t_%d = %s + %s\n",num_count,$1,$3);
    sprintf($$, "t_%d", num_count++);
  }

  | exp MINUS exp 
  {
    printf("t_%d = %s - %s\n",num_count,$1,$3);
    sprintf($$, "t_%d", num_count++);
  }

  | exp MULT exp 
  {
    printf("t_%d = %s * %s\n",num_count,$1,$3);
    sprintf($$, "t_%d", num_count++);
  }  

  | exp DIV exp
  {
    printf("t_%d = %s / %s\n",num_count,$1,$3);
    sprintf($$, "t_%d", num_count++);
  }  
  | exp MOD exp
  {
    printf("t_%d = %s mod %s\n",num_count,$1,$3);
    sprintf($$, "t_%d", num_count++);
  }  

  | MINUS exp
  {
    printf("t_%d = -%s\n",num_count,$2); 
    sprintf($$, "t_%d", num_count++);
  }

  | PLUS exp
  {
    printf("t_%d = +%s\n",num_count,$2);
    sprintf($$, "t_%d", num_count++);
  }

  | LEFT_PAREN exp RIGHT_PAREN 
  {
    printf("t_%d = %s\n",num_count,$2);
    sprintf($$, "t_%d", num_count++);
  }
  | ID                         
  | INT_CONST                     
  ;

%%

int main() 
{ 
  extern FILE *yyin;  
  yyin = fopen("input.txt","r");
  printf("\n3 Address Code:\n\n");
  yyparse(); 
  if(success == 1) printf("Program End\n\n");
} 

void yyerror(const char *s) 
{  
  fprintf(stderr,"Error @ Line: %d\n%s\n",yylineno,s); 
  success = 0; 
} 
