%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	int line_num = 1;
%}

DING ding
DONG dong
DELL dell

%%

ding {return DING;}
dong {return DONG;}
dell {return DELL;}
[ ]* {}
\n|. {return yytext[0];}

%%

int yywrap(void) {return 1;}