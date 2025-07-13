# Detect OS environment
ifeq ($(OS),Windows_NT)
	detected_OS := Windows
else
	detected_OS := $(shell uname -s)
endif

# Compiler settings
COBC    := cobc
CFLAGS  := -Wall
LDFLAGS :=

# On Windows, define WIN32 and guard against duplicate typedefs
ifeq ($(detected_OS),Windows)
	# Prevent MinGW corecrt.h typedef conflicts by injecting semicolons
	CFLAGS += -DWIN32 \
	          -D__MINGW_EXTENSION=";" \
	          -DHAVE_SIZE_T \
	          -DHAVE_SSIZE_T \
	          -DHAVE_INTPTR_T \
	          -DHAVE_UINTPTR_T \
	          -DHAVE_PTRDIFF_T \
	          -DHAVE___TIME64_T
endif

# Sources and outputs
SRCS      := $(filter-out main.cob,$(wildcard *.cob))
EXEC      := library.so
TEST_EXEC := test_program

.PHONY: all test clean fclean re print-flags

all: $(EXEC)

test: $(TEST_EXEC)

$(TEST_EXEC): main.cob $(SRCS)
	$(COBC) $(CFLAGS) -x -o $@ $^

$(EXEC): $(SRCS)
	$(COBC) $(CFLAGS) -b -o $@ $^

clean:
	rm -f *.o $(TEST_EXEC)

fclean: clean
	rm -f $(EXEC)

re: fclean all

# Debug target to inspect flags
default: print-flags

print-flags:
	@echo "Detected OS: $(detected_OS)"
	@echo "COBC flags: $(CFLAGS)"
