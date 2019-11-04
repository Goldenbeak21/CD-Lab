# Assignment 9

## Running
```
python parser.py
```

## Working
- Uses the existing predictive parsing code
- Whenever the top of the stack doesn't match the input and the top of the stack is a terminal, just add that terminal to the input  
- In the above case, if the top of the stack was a non-terminal and the input cannot be derived from it, look at what terminals can be derived from it, assume you append that terminal to the input at this point and continue with each of the choices (recursively) and check which choice led to less errors for rest of the program  
- This helps in choosing the optimal changes needed to be made to the current program to fix all the errors  
- The error suggestions are returned by the recusive check function, and there is a `max_depth` variable to limit the recursive checks. The errors messages returing from branches that went to `max_depth` will not be considered  


## Example
```
prog
	int count
end
```
`error at count`</br>
|</br>
|</br>
|_______ `count;` (errors = 1)</br>
|</br>
|_______ `count := ic;` (errors = 3)</br>
|</br>
|_______ `count := fc;` (errors = 3)</br>

The optimal one is choosed, with only one error suggestion:</br>
`` Try adding ';' at line 1 ``

## Note
The program is not working as expected in some cases. </br> 
A lot of debug output is printed.  </br>
