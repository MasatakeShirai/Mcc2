CFLAGS=-std=c11 -g -static

Mcc2: Mcc2.c

test: Mcc2.c
	./test.sh

clean:
	rm -f Mcc2 *.o *~ tmp*

.PHONY: test clean
