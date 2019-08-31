if [ "$1" == "debug" ]
then
	lex lex.l && gcc lex.yy.c && ./a.out
	lex assign7.l
	yacc assign7.y -d -v
	gcc y.tab.c -DYYDEBUG=1
else
	lex assign7.l
	yacc assign7.y -d
	gcc y.tab.c
fi

./a.out

rm a.out lex.yy.c y.tab.c y.tab.h
