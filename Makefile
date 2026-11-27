CC = gcc
FLEX = flex
PROGS = wordcount replace_abc recognize_verbs

.PHONY: all clean

all: $(PROGS)

%: %.l
	$(FLEX) -o $@.yy.c $<
	$(CC) -Wall $@.yy.c -o $@

clean:
	rm -f $(PROGS) *.yy.c lex.yy.c
