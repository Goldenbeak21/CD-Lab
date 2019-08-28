code = input("Input Code: ")
token_list = code.split()

def isfloat(num):
    try:
        float(num)
        return True
    except ValueError:
        return False

def isId(item):
    if not item[0].isalpha():
        return False
    
    for i in item:
        if i.isdigit() or i.isalpha():
            continue
        else:
            return False
    return True

for item in token_list:
    if isfloat(item): print("number", end=' '), print(item)
    elif item == "if": print("if", end=' '), print(item)
    elif item == "then": print("then", end=' '), print(item)
    elif item == "else": print("else", end=' '), print(item)
    elif item == "<" or item == ">" or item == "<=" or item == ">=" or item == "=":
        print("relop", end=' '), print(item)
    elif isId(item): print("id", end=' '), print(item)
    else: print("unidentified", end=' '), print(item)