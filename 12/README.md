## Assignment 12

### Run
To compile the lex and yacc and run the code
```bash
./run.sh <name>
ex:
name: 3ac,ast,dag
```
If the code is compiled.
```bash
./a.out
```

### Working

#### Three Address Code
The three address code is printed.  
```
MadbookAir 12 ❯ ./run.sh 3ac
Enter the expression: 2+3
A = 2 + 3
B = A
```

#### Abstract Syntax Tree
Preorder of AST is printed.  
```
MadbookAir 12 ❯ ./run.sh ast
Enter Any Arithmetic Expression with +,-,* and / only: 2+3*4

Result
+ 2 * 3 4
```

#### Directed Acyclic Graph
Post order of DAG is printed.
```
MadbookAir 12 ❯ ./run.sh dag
Enter Any Arithmetic Expression with +,-,* and / only: a*b+a*b

Result
node: a
node: b
node: *
node: a * b (done)
node: +
```