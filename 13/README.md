## Assignment 13

The input has been set to `input.txt` in the main function of `assign13.y`.
All the intermediate files are deleted by `run.sh`.

### Running
```bash
chmod +x run.sh
./run.sh
```

### Working
- Intermediate variables are named as `t_<num>`
- Labels named as `L_<num>`
- There is a global count for label and sub count for while and else label to maintain some label information

#### If Statement logic
For every fail of an if condition, we jump to its corresponding label or continue.
```
if !<cond1> goto L_<n0>
...
...
if !<cond2> goto L_<n1>
...
L_n1:
...
...
goto L<n2>
L_n0:
...
...
L_n2:
rest of the program
```
- So, for and if block, both label variable (holding the next availiable label variable) and if_label variable (holding the label no of block from which the if block part is done). If the statement has an else part, then before entering the if_label, we goto `L_<label>` and then go into the if_label block, else directly proceed. This is because, you don't want to execute the else block and directly go to the code after entire if-else block.</br>
- The if_label is incremented, as we go into nested ifs and decremented as we come out of them. So, the correspondence between labels is maintained.  

#### While Statement logic
A while statement uses two labels.  
A label at the begenning of the while loop and a label at the condition to go out of the while loop. Let us set them as while_label and while_label+1 for a variable while_label.  
```
L_<while_label>:
...
if !<cond> goto L<while_label+1>
...
...
goto L<while_label>
L<while_lable+1>:
...
rest of the program
```
- As we go in the nested while loop, we increment the label variable by 2 (because we are consuming two labels) and while_label variable by 2.  
- As we come out of nested while loops, we decrement the while_label by 2 to come into correspondence with the outer while loop.   

### Contributors
[Venu Madhav](https://github.com/venu22499)</br>
[Tummala Madhav](https://github.com/MadhavChoudhary)
