# Assignment 8

## Commands
For saving the temporary files

```
gcc -S file.c
```
For compiling with gdb support, to check line by line source to assembly translation
```
gcc -g -S file.c
```
Then use
```
gdb or lldb a.out
```

## Explanation
We have to first understand the some keywords in assembly language.
```
addl $42, %edi
```  
The `l` in `addl` means long.  
`$` in operands means an immediate value.  
The instruction adds `42` to `edi`.  
```
movq %rsp, %rbp
```
The `q` in `movq` means quad.  
`%` in operands means a register.  
The instruction moves content of `rsp` to `rbp`.  

If we run the code in gdb(or lldb) with a break point set, we can run `register read` to see the contents of register at any given point.
[lldb example](./images/lldb.png)

### Registers
* rax, rbx, rcx and rdx are general purpose registers used to hold on to intermediate values loaded from memory or used during a calculation of some kind.  
* rsp is the stack pointer, which holds the memory location of the top of the stack.  
* rbp is the base pointer, which holds the memory location of the base of the current stack frame.  
* rip is the instruction pointer, which holds the memory location of the next instruction to execute.  
* and rflags holds a series of flags, used by comparison instructions for example.

### Code Explanation
Let us consider the output of a simple line of code `int i = 10` as in `ex1.s`.  
`.cfi_* ` are assembler directives.  
| Line No | Instruction | Meaning |
| ------ | ------- | ------ |
| 5 | _main: | Start of the main function section |
| 8 | pushq %rbp | Setting up stack frame |
| 11 | movq	%rsp, %rbp | For local variables of function |
| 13 | xorl	%eax, %eax | To set %eax to zero |
| 14 | movl	$0, -4(%rbp) | Moving 0 to %rbp |
| 15 | movl	$10, -8(%rbp) | Moving 42 to %rbp |
| 16 | popq %rbp | Clean up the stack frame |
| 17 | retq | Clean up the stack frame |
Adding the line `i = i + 42` to the code, the assembly code has some more lines in `ex2.s`.  
| Line No | Instruction | Meaning |
| --- | --- | --- |
| 16 | movl	-8(%rbp), %ecx | Move the value of `i` into %ecx |
| 17 | addl	$42, %ecx | Add 42 to the value in %ecx |
| 18 | movl	%ecx, -8(%rbp) | Move the value in %ecx to %rbp |
Changing it to a conditional statement `if(i==10) i = i + 10;`, we a new section `LBB0_2` as in `ex3.s`.  
| Line No | Instruction | Meaning |
| --- | --- | --- |
| 15 | cmpl $10, -8(%rbp) | Compare the value in %rbp with 10 |
| 16 | jne LBB0_2 | If not equal jump to that section |
If the value is equal, similar code for adding 42 exists in the next lines of the main section. On the other hand, in `LBB0_2` section: 
| Line No | Instruction | Meaning |
| --- | --- | --- |
| 22 | xorl %eax, %eax | To set %eax to zero |
| 23 | popq %rbp | Clean up the stack frame |
| 24 | retq | Clean up the stack frame |
Now, we add a loop statement replacing the entire conditional statement. The loop statement is `while(i<20) i+=5;`. `i` is initially set to 10. We have two sections other the main section now as seen in `ex4.s`.  So, till the beginning of `LBB0_1` is before loop part, `LBB0_1` is loop section and `LBB0_3` is after loop section.  
| Line No | Instruction | Meaning |
| --- | --- | --- |
| 16 | cmpl	$20, -8(%rbp) | Compare the value in %rbp with 20 |
| 17 | jge	LBB0_3 | Jump if greater than or equal to LBB0_3 |
| 19 | movl	-8(%rbp), %eax | Move the value in %rbp to %eax |
| 20 | addl	$5, %eax | Add 5 to the value in %eax |
| 21 | movl	%eax, -8(%rbp) | Move the value of %eax to %rbp |
| 22 | jmp	LBB0_1 | Jump to LBB0_1 |
After loop section `LBB0_3` is just cleaning up like the `LBB0_2` section of the previous case with conditional statement example.