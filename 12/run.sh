rm a.out

lex $1.l
yacc -d $1.y
gcc y.tab.c

rm y.tab.c y.tab.h lex.yy.c

./a.out
