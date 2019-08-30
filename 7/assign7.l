%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	int line_num = 1;
%}

AND				[and]
ASSIGN			[:=]
COLON			[:]
COMMA			[,]
DEF				[def]
DIV				[/]
DOT				[.]
ELSE			[else]
END				[end]
EQ				[=]
EXITLOOP		[exit]
FLOAT			[float]
FROM			[from]
FUN				[fun]
GE				[>=]
GLOBAL			[global]
GT				[>]
IF				[if]
INT				[int]
LEFT_PAREN		[(]
LEFT_SQ_BKT		[[]
LE				[<=]
LT				[<]
MINUS			[-]
MOD				[mod]
MULT			[*]
NE				[<>]
NOT				[not]
NUL				[null]
OR				[or]
PLUS			[+]
PRINT			[print]
PRODUCT			[product]
READ			[read]
RETURN			[return]
RIGHT_PAREN		[)]
RIGHT_SQ_BKT	[]]
SEMICOLON		[;]
SKIP			[skip]
STEP			[step]
TO				[to]
WHILE			[while]
ID				[a-zA-z]([a-zA-z]|[0-9])*
STRING			["][a-zA-z]+["]
INT_CONST		[0-9]+
FLOAT_CONST		[0-9]+[.][0-9]+
FORMAT			[%d|%f|%s]

%%

AND				{return AND;}
ASSIGN			{return ASSIGN;}
COLON			{return COLON;}
COMMA			{return COMMA;}
DEF				{return DEF;}
DIV				{return DIV;}
DOT				{return DOT;}
ELSE			{return ELSE;}
END				{return END;}
EQ				{return EQ;}
EXITLOOP		{return EXITLOOP;}
FLOAT			{return FLOAT;}
FROM			{return FROM;}
FUN				{return FUN;}
GE				{return GE;}
GLOBAL			{return GLOBAL;}
GT				{return GT;}
IF				{return IF;}
INT				{return INT;}
LEFT_PAREN		{return LEFT_PAREN;}
LEFT_SQ_BKT		{return LEFT_SQ_BKT;}
LE				{return LE;}
LT				{return LT;}
MINUS			{return MINUS;}
MOD				{return MOD;}
MULT			{return MULT;}
NE				{return NE;}
NOT				{return NOT;}
NUL				{return NUL;}
OR				{return OR;}
PLUS			{return PLUS;}
PRINT			{return PRINT;}
PRODUCT			{return PRODUCT;}
READ			{return READ;}
RETURN			{return RETURN;}
RIGHT_PAREN		{return RIGHT_PAREN;}
RIGHT_SQ_BKT	{return RIGHT_SQ_BKT;}
SEMICOLON		{return SEMICOLON;}
SKIP			{return SKIP;}
STEP			{return STEP;}
TO				{return TO;}
WHILE			{return WHILE;}
ID				{return ID;}
STRING			{return STRING;}
INT_CONST		{return INT_CONST;}
FLOAT_CONST		{return FLOAT_CONST;}
FORMAT			{return FORMAT;}

%%

int yywrap(void) {return 1;}