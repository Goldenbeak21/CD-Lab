# -*- coding: utf-8 -*-

handler = open('temp.txt', 'r')

print "digraph finite_state_machine {"
print "\trankdir=LR;"
print "\tsize=\"15,10\""
print "\tlabelloc=\"b\";"
print "\tcolor=white;"
print "\tfontcolor=white;"
print "\tbgcolor=transparent;"
print "\trankdir=LR;"

line = handler.readline()
start = handler.readline()
end = handler.readline()
print "\tlabel=\"Regex : {}\";".format(line[:-1])
print "\tnode [color=white fontcolor=white shape = doublecircle label=\"\"]; addr_{}".format(end[:-1])
print "\tnode [color=white fontcolor=white shape = circle]"
line = handler.readline()
while line:
	lhs,rhs = line[:-2].split(' : ')
	lhs = lhs.split(' ')
	rhs = rhs.split(' ')
	line = handler.readline()
	for value in rhs:
		print "\taddr_{} -> addr_{} [color=white fontcolor=white  label = \"{}\" ];".format(lhs[0],value,lhs[1])

print "\tnode [color=white fontcolor=white shape = none label=\"\"]; start"
print "\tstart -> addr_{} [color=white fontcolor=white  label = \"start\" ]".format(start[:-1])
print "}"

handler.close()
