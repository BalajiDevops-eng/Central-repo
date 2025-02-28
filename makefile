ABC.exe : add.o fact.o
	gcc -o ABC.exe add.o fact.o
add.o : add.c
	gcc -c add.c
fact.o : fact.c
	gcc -c fact.c
