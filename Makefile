# ───────────────────────────────────────────
# Makefile for CobolLib — manual temp move + move .o
# ───────────────────────────────────────────

COBC       := cobc
COBCFLAGS  := -Wall -g -O0 --save-temps

OBJDIR     := objs

SOURCES    := main.cob strcmp.cob strleft.cob strlen.cob strpos.cob \
              strright.cob strtrim.cob tolower.cob toupper.cob
OBJS       := $(SOURCES:%.cob=$(OBJDIR)/%.o)
TEMPS      := $(SOURCES:%.cob=%.c) \
              $(SOURCES:%.cob=%.c.h) \
              $(SOURCES:%.cob=%.c.l.h) \
              $(SOURCES:%.cob=%.i)
STRAY_OBJS := $(SOURCES:%.cob=%.o)

EXEC       := program

.PHONY: all clean re

all: $(EXEC) move-temps move-objs

# (keeps your current linking-by-sources; this is what creates stray .o)
$(EXEC): $(OBJS)
	@echo "Linking $@..."
	@$(COBC) -x $(COBCFLAGS) -o $@ $(SOURCES)

$(OBJDIR)/%.o: %.cob | $(OBJDIR)
	@echo "Compiling $<..."
	@$(COBC) -c $(COBCFLAGS) -o $@ $<

move-temps:
	@echo "Moving generated C/H/I to $(OBJDIR)..."
	@mv -f $(TEMPS) $(OBJDIR) 2>/dev/null || true

move-objs:
	@echo "Moving stray .o to $(OBJDIR)..."
	@mv -f $(STRAY_OBJS) $(OBJDIR) 2>/dev/null || true

$(OBJDIR):
	@mkdir -p $@

clean:
	@echo "Cleaning..."
	@rm -rf $(OBJDIR) $(EXEC) $(TEMPS) $(STRAY_OBJS)

re: clean all
