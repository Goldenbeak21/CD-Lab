rm a.out

lex assign13.l
yacc assign13.y -d
gcc y.tab.c

rm lex.yy.c y.tab.c y.tab.h

./a.out
