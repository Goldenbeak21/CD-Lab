## Assignment 7
### Using LEX and YACC together

|||
| --- | --- |
| lex.l | Prints the identified tokens in the sample input |
| assign7.l | Returns tokens to the yacc file |
| assign7.y | Creates the parser using the grammar |


The input has been set to `input.txt` in the main function of `assign7.y`.  
All the intermediate files are deleted by `run.sh`.  

### Running
Compiles, runs the parser and prints if the sample input is valid and the line number where it went wrong, in case its not valid.
```
./run.sh 
```
Compiles, produces the tokenised form of the sample input, runs the parser, produces the state information in `y.output` and prints the complete information of steps taken by parser while parsing the input string.
```
./run.sh debug
```
