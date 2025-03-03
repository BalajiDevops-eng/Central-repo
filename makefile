CC = gcc
CFLAGS = -Wall -Werror

add: add.c
$(CC) $(CFLAGS) add.c -o add

clean:
rm -f add add.c~
