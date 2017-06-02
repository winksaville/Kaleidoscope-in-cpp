# Kaleidoscope: A toy language LLVM front end in cpp
From [Kaleidoscope: Implementing a Language with LLVM](http://llvm.org/docs/tutorial/)
and the code is from [Chapter 8 "Kaleidoscope: Compiling to Object Code"](http://llvm.org/docs/tutorial/LangImpl08.html).

# Prerequisites
```
clang++ 4.0
make
```

# Validate that the precompiled version of main works
```
$ ./main
average of 3.0 and 4.0: 3.5
```
# Clean removing main and output.o
```
$ make clean
```
# Build the `toy` compiler
```
$ make toy
```
# Create output.o, a Kaleidoscope routine called average
Since `toy` is interactive execute it:
```
$ ./toy
ready>
```
# Enter the `average` routine:
``` 
ready> def average(x y) (x + y) * 0.5;
```
The output is 
```
Read function definition:
define double @average(double %x, double %y) {
entry:
  %y2 = alloca double
  %x1 = alloca double
  store double %x, double* %x1
  store double %y, double* %y2
  %x3 = load double, double* %x1
  %y4 = load double, double* %y2
  %addtmp = fadd double %x3, %y4
  %multmp = fmul double %addtmp, 5.000000e-01
  ret double %multmp
}
```
Now type Ctrl-D and `output.o` will be created and you'll be back at the prompt:
```
Wrote output.o
$
```
# Compile main and link with output.o
```
$ make main
```
# Run main
```
$ ./main
average of 3.0 and 4.0: 3.5
```
