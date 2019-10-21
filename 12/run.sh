lex $1.l
yacc -d $1.y
gcc y.tab.c lex.yy.c -ll

./a.out
