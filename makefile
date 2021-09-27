myshell: lex.o myshell.o
	gcc myshell.o lex.o -o myshell -lfl

test.o: lex.yy.c test.c
	gcc -c test.c -o test.o
 
myshell.o: lex.yy.c myshell.c
	gcc -c myshell.c -o myshell.o
 
lex.yy.c: lex.c
	flex lex.c 

lex.o: lex.yy.c
	gcc -c lex.yy.c -o lex.o

test: lex.o test.o
	gcc test.o lex.o -o test -lfl

clean:
	rm lex.yy.c test myshell *.o 2> /dev/null

