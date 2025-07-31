# Simplified Makefile for CobolLib
# Compiler and linker settings
COBC    := cobc
CC      := cc
CFLAGS  := -Wall -g

# Build directories
OBJDIR := objs
# Hardcoded source files
SOURCES := \
    main.cob \
    strcmp.cob \
    strleft.cob \
    strlen.cob \
    strpos.cob \
    strright.cob \
    strtrim.cob \
    tolower.cob \
    toupper.cob

# Derived object files
OBJS := $(patsubst %.cob,$(OBJDIR)/%.o,$(SOURCES))

# Final executable name
EXEC := program

.PHONY: all clean re

# Default target: build the executable
all: $(EXEC)

# Link step using cobc to include the COBOL runtime
$(EXEC): $(OBJS)
	$(COBC) -x $^ -o $@

# Compile main program with -x to generate a C file containing 'main'
$(OBJDIR)/main.o: main.cob | $(OBJDIR)
	$(COBC) -x -C -o $(OBJDIR)/main.c $<
	$(CC) $(CFLAGS) -c $(OBJDIR)/main.c -o $@

# Compile other modules to C and then to objects
$(OBJDIR)/%.o: %.cob | $(OBJDIR)
	$(COBC) -m -C -o $(OBJDIR)/$*.c $<
	$(CC) $(CFLAGS) -c $(OBJDIR)/$*.c -o $@

# Ensure the objs directory exists
$(OBJDIR):
	mkdir -p $@

# Remove objects and executable
clean:
	rm -rf $(OBJDIR) $(EXEC)

# Rebuild from scratch
re: clean all

