#RA 221525
#paths do ligador trocados para funcionar no UBUNTU
prog.x: main.o math.o log.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o -L/usr/lib64 main.o math.o log.o -lc //usr/lib/x86_64-linux-gnu/crtn.o -o prog.x
main.s: main.c
	gcc -S main.c -o main.s
main.o: main.s
	as main.s -o main.o
math.s: math.c
	gcc -S math.c -o math.s
math.o: math.s
	as math.s -o math.o
log.s: log.c
	gcc -S log.c -o log.s
log.o: log.s
	as log.s -o log.o
clean:
	rm -f main.s math.s log.s main.o math.o log.o prog.x
