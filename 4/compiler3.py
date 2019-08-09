import re
import os
import sys

new_lhs_buck = ['X','Y','Z','U','V','W']
ptr=0

recurse_flag = False
def consume(str,dict,form):
	# print form
	start=''
	compare = form
	if(len(compare)==0):
		return

	if(recurse_flag and len(compare)>len(str)):
		return

	l=0
	i=0
	while(i<len(compare)):
		if l>=len(str):
			string=''
		else:
			string=str[l]

		if string==compare[i] or string.isalpha() and compare[i]=='i':
			l=l+1
			i=i+1
		elif compare[i].isalpha():
			start=compare[i]
			break
		else:
			return

	if l==len(str) and i==len(compare):
		return True
	elif l==len(str):
		start=compare[l]

	for value in dict[start]:
		if value == 'e':
			value = ''
		# form = form.replace(start,value,1)
		print "replacing {} with {} to get ({})".format(start,value,form.replace(start,value,1))
		if consume(str,dict,form.replace(start,value,1)):
			return True
		# form = form.replace(value,start,1)
		print "backtracking to ({})".format(form)

	return False

handler = open('in3.txt', 'r')

lines = handler.readlines()

dict = {}

symbol = ''
for line in lines:
	lhs,rhs = line.split('->')
	if not symbol:
		symbol=lhs
	rhs_set = rhs[:-1].split('|')
	dict[lhs] = rhs_set

str = raw_input('Enter the string: ')
str = re.split('(\W)',str)

try:
	if consume(str,dict,symbol):
		print "accepted\n";
	else:
		print "rejected\n";
except:
	recurse_flag=True
	os.system("clear")
	if consume(str,dict,symbol):
		print "accepted\n";
	else:
		print "rejected\n";	
