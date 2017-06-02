all: toy

# Create the toy interactive compiler for kaleidoscope
toy: toy.cpp
	clang++ -g -O3 -std=c++11 -L/usr/lib -lLLVM-4.0 $< -o $@

# A main routine which links to the output.o with a function call average
main: main.cpp output.o
	clang++ $^ -o $@

clean:
	rm main toy
