lex assign10.l
yacc assign10.y
cc y.tab.c -ly -ll -lm

./a.out
