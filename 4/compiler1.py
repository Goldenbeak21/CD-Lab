import re

new_lhs_buck = ['X','Y','Z','U','V','W']
ptr=0

handler = open('in1.txt', 'r');

productions = handler.readlines();

for production in productions:
	lhs,rhs = production.split('->');
	#print lhs,rhs;
	rhs_set = rhs[:-1].split('|');
	#print rhs_set;
	left_recur_rhs = [rhs for rhs in rhs_set if lhs==rhs[0]];
	other_rhs = [rhs for rhs in rhs_set if lhs!=rhs[0]];
	#print left_recur_rhs,other_rhs;
	i=0;
	if(len(left_recur_rhs)==0):
		print production;
		continue;
	new_lhs = new_lhs_buck[ptr]
	ptr = ptr + 1
	new_1 = ''
	new_2 = ''
	for normal in other_rhs:
		new_1 = new_1 + normal + new_lhs + '|';
	new_1 = lhs+'->'+new_1[:-1];
	for recur in left_recur_rhs:
		new_2 = new_2 + recur[1:] + new_lhs + '|';
	new_2 = new_lhs+'->'+new_2+'e';
	print new_1;
	print new_2;