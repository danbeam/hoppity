# compilers
WHICH=which
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
RUBY=ruby
SH=sh

# delete command for clean target
DEL=rm -f

# default target builds and runs
main: build run

# makes sure we have CLI executables
# and compiles the necessary files
build: deps c cpp java

# test what happens when we forget arguments
# the file doesn't exist, or isn't readable
tests: no_arg no_file make_unreadable no_read

# dependencies
deps:
	@$(WHICH) $(CC) >/dev/null
	@$(WHICH) $(CPP) >/dev/null
	@$(WHICH) $(JAVAC) >/dev/null
	@$(WHICH) $(JAVA) >/dev/null
	@$(WHICH) $(PHP) >/dev/null
	@$(WHICH) $(PERL) >/dev/null
	@$(WHICH) $(PY) >/dev/null
	@$(WHICH) $(RUBY) >/dev/null
	@$(WHICH) $(SH) >/dev/null

# make an unreadable file (git can't handle these)
make_unreadable:
	@touch $(NO_READ) && chmod 000 $(NO_READ)

# compile the C code
c: hoppity.c
	@$(CC) hoppity.c -o hoppity.c.o

# compile the C++ code
cpp: hoppity.cc
	@$(CPP) hoppity.cc -o hoppity.cc.o

# compile the Java
java: hoppity.java
	@$(JAVAC) hoppity.java

# run all
run: hoppity.c.o hoppity.cc.o hoppity.class
	@./hoppity.c.o $(FILE)
	@./hoppity.cc.o $(FILE)
	@$(JAVA) hoppity $(FILE)
	@$(PHP) hoppity.php $(FILE)
	@$(PERL) hoppity.pl $(FILE)
	@$(PY) hoppity.py $(FILE)
	@$(RUBY) hoppity.rb $(FILE)
	@$(SH) hoppity.sh $(FILE)

# check when no arguments are passed
no_arg: hoppity.c.o hoppity.cc.o hoppity.class
	@./hoppity.c.o
	@./hoppity.cc.o
	@$(JAVA) hoppity
	@$(PHP) hoppity.php
	@$(PERL) hoppity.pl
	@$(PY) hoppity.py
	@$(RUBY) hoppity.rb
	@$(SH) hoppity.sh

# check when the file doesn't exist
no_file: hoppity.c.o hoppity.cc.o hoppity.class
	@./hoppity.c.o $(NO_FILE)
	@./hoppity.cc.o $(NO_FILE)
	@$(JAVA) hoppity $(NO_FILE)
	@$(PHP) hoppity.php $(NO_FILE)
	@$(PERL) hoppity.pl $(NO_FILE)
	@$(PY) hoppity.py $(NO_FILE)
	@$(RUBY) hoppity.rb $(NO_FILE)
	@$(SH) hoppity.sh $(NO_FILE)

# check when the file's no readable
no_read: hoppity.c.o hoppity.cc.o hoppity.class $(NO_READ)
	@./hoppity.c.o $(NO_READ)
	@./hoppity.cc.o $(NO_READ)
	@$(JAVA) hoppity $(NO_READ)
	@$(PHP) hoppity.php $(NO_READ)
	@$(PERL) hoppity.pl $(NO_READ)
	@$(PY) hoppity.py $(NO_READ)
	@$(RUBY) hoppity.rb $(NO_READ)
	@$(SH) hoppity.sh $(NO_READ)

# remove any compiled files
clean:
	@$(DEL) hoppity.c.o
	@$(DEL) hoppity.cc.o
	@$(DEL) hoppity.class

# none of these require files
.PHONY : clean
.PHONY : deps
.PHONY : make_unreadable