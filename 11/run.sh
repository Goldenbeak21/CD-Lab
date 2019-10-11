lex assign11.l
yacc assign11.y
cc y.tab.c -ly -ll -lm

./a.out