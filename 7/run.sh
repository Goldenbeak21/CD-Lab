lex $1.l
yacc $1.y -d -v
gcc y.tab.c
./a.out
