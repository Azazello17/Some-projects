res.out: my_rules.o prog.o
	gcc -Wall -m32 -o res.out my_rules.o prog.o
	
prog.o: prog.c my_rules.h
	gcc -Wall -m32 -c -o prog.o prog.c
my_rules.o: my_rules.asm
	nasm -f elf32 -o my_rules.o my_rules.asm

run: res.out
	./res.out
