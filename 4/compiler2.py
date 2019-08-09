handler = open('in2.txt' ,'r')

productions = handler.readlines()

new_lhs_buck = ['X','Y','Z','U','V','W']
ptr=0

def optim(dict):
	len=0
	flag=True
	while(flag):
		len = len+1
		for key in dict.keys():
			long = dict[key][0][:len]
			for value in dict[key]:
				if value=='' or value[:len]!=long:
					flag=False
					len=len-1
					break
	if len>0:
		dict[key+dict[key][0][:len]] = [k[len:] for k in dict[key]]
		del dict[key]

	return dict

def find_group(rhs_set):
	dict = {}
	for rhs in rhs_set:
		if rhs[0] not in dict.keys():
			dict[rhs[0]] = [k[1:] for k in rhs_set if k[0] == rhs[0]]
	#print dict
	dict = optim(dict)
	#print dict
	return dict

def check(dict):
	for key in dict:
		if len(dict[key])>1:
			return True
	return False

def func(lhs,rhs_set):
	global ptr
	dict = find_group(rhs_set)
	if check(dict):
		for key in dict.keys():
			if len(dict[key])==1:
				new_production = lhs+'->'+key+dict[key][0]
				print new_production
			else:
				new_lhs = new_lhs_buck[ptr]
				ptr=ptr+1
				new_production = lhs+'->'+key+new_lhs
				print new_production
				extra_production = func(new_lhs,dict[key])
	else:
		for key in dict.keys():
			new_production = lhs+'->'+key+dict[key][0]
			print new_production


for production in productions:
	lhs,rhs = production.split('->')
	rhs_set = rhs[:-1].split('|')
	func(lhs,rhs_set)
