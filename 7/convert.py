file = open("test.txt", "r")

lines = file.readlines()

for line in lines:
	print line.split("]")[0].split("[")[1]+' ',
