#lex lex.l && gcc lex.yy.c && ./a.out
lex assign7.l
yacc assign7.y -d -v
gcc y.tab.c
./a.out
rm a.out lex.yy.c y.output y.tab.c y.tab.h
