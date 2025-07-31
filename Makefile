# ───────────────────────────────────────────
# Makefile for CobolLib — temps in objs/, clean root
# ───────────────────────────────────────────

# Compiler settings
COBC       := cobc
COBCFLAGS  := -Wall -g

# Build directories
OBJDIR     := objs

# Your COBOL sources
SOURCES    := \
    main.cob \
    strcmp.cob \
    strleft.cob \
    strlen.cob \
    strpos.cob \
    strright.cob \
    strtrim.cob \
    tolower.cob \
    toupper.cob

# Corresponding object files
OBJS       := $(SOURCES:%.cob=$(OBJDIR)/%.o)

# Final executable
EXEC       := program

.PHONY: all clean re

# Default: build the program
all: $(EXEC)

# Link step: generate temps into OBJDIR, then move any strays
$(EXEC): $(OBJS)
	@echo "Linking $@..."
	@TMPDIR=$(OBJDIR) $(COBC) -x $(COBCFLAGS) -o $@ $(SOURCES)
	@mv ./*.c ./*.h ./*.i $(OBJDIR)/ 2>/dev/null || true

# Compile each .cob → .o; temps go in OBJDIR, then move any strays
$(OBJDIR)/%.o: %.cob | $(OBJDIR)
	@echo "Compiling $<..."
	@TMPDIR=$(OBJDIR) $(COBC) -c $(COBCFLAGS) -o $@ $<
	@mv $(basename $<).c \
	    $(basename $<).h \
	    $(basename $<).i \
	    $(OBJDIR)/ 2>/dev/null || true

# Ensure the output dir exists
$(OBJDIR):
	@mkdir -p $@

# Remove everything
clean:
	@echo "Cleaning..."
	@rm -rf $(OBJDIR) $(EXEC)

# Rebuild from scratch
re: clean all
