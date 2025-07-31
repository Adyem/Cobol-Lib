### Simplified Makefile for CobolLib (Fixed Link & Warnings)

```makefile
# Compiler and linker settings
COBC    := cobc
CC      := cc
CFLAGS  := -Wall -g -U_FORTIFY_SOURCE   # Add -U to undefine duplicate _FORTIFY_SOURCE
LDFLAGS := -lcobc                     # Link against the COBOL runtime

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

# Link step: use 'cc' to ensure COBOL runtime is included
$(EXEC): $(OBJS)
	$(CC) $^ $(LDFLAGS) -o $@

# Compile each COBOL source into objs/*.o
$(OBJDIR)/%.o: %.cob | $(OBJDIR)
	$(COBC) $(CFLAGS) -c -o $@ $<

# Ensure the objs directory exists
$(OBJDIR):
	mkdir -p $@

# Remove objects and executable
clean:
	rm -rf $(OBJDIR) $(EXEC)

# Rebuild from scratch
re: clean all
