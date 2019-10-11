### Assignment 8

#### Commands
For saving the temporary files

```
gcc -S file.c
gcc -save-temps file.c
```
For compiling with gdb support, to check line by line source to assembly translation
```
gcc -g file.c
```
Then use
```
gdb or lldb a.out
```

#### Explanation
We have to first understand the meaning of keywords in assembly language.
Like jl -> jump on less