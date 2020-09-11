all: bat hello mix

clean:
	rm -f *.o
	rm -f bat hello mix

bat: main.c
	gcc main.c -o bat
hello.o: hello.s
	gcc -c hello.s
hello: hello.o
	ld hello.o -o hello

mix:
	gcc -std=c99 mix_c.c mix_asm.s -o mix
