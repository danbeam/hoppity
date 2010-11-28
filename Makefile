# compilers
CC=gcc
CPP=g++
JAVAC=javac

# command-line runners
FILE=filename.txt
NO_FILE=doesntexist.txt
NO_READ=unreadable.txt
JAVA=java
PHP=php
PERL=perl
PY=python
SH=sh

# delete command for clean target
DEL=rm -f

# default target is build
build: c cpp java

# compile the C code
c: hoppity.c
	$(CC)    hoppity.c -o hoppity.c.o

# compile the C++ code
cpp: hoppity.cc
	$(CPP)   hoppity.cc -o hoppity.cc.o

# compile the Java
java: hoppity.java
	$(JAVAC) hoppity.java

# compile and run all the examples
run:
	./hoppity.c.o       $(FILE)
	./hoppity.cc.o      $(FILE)
	$(JAVA) hoppity     $(FILE)
	$(PHP)  hoppity.php $(FILE)
	$(PERL) hoppity.pl  $(FILE)
	$(PY)   hoppity.py  $(FILE)
	$(SH)   hoppity.sh  $(FILE)

# check when no arguments are passed
no_arg:
	./hoppity.c.o
	./hoppity.cc.o
	$(JAVA) hoppity
	$(PHP)  hoppity.php
	$(PERL) hoppity.pl
	$(PY)   hoppity.py
	$(SH)   hoppity.sh

# check when the file doesn't exist
no_file:
	./hoppity.c.o       $(NO_FILE)
	./hoppity.cc.o      $(NO_FILE)
	$(JAVA) hoppity     $(NO_FILE)
	$(PHP)  hoppity.php $(NO_FILE)
	$(PERL) hoppity.pl  $(NO_FILE)
	$(PY)   hoppity.py  $(NO_FILE)
	$(SH)   hoppity.sh  $(NO_FILE)

# check when the file's no readable
no_read:
	./hoppity.c.o       $(NO_READ)
	./hoppity.cc.o      $(NO_READ)
	$(JAVA) hoppity     $(NO_READ)
	$(PHP)  hoppity.php $(NO_READ)
	$(PERL) hoppity.pl  $(NO_READ)
	$(PY)   hoppity.py  $(NO_READ)
	$(SH)   hoppity.sh  $(NO_READ)

# remove any compiled files
clean:
	$(DEL)  hoppity.c.o
	$(DEL)  hoppity.cc.o
	$(DEL)  hoppity.class
