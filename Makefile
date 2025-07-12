COBC=cobc
SRCS=$(filter-out main.cob,$(wildcard *.cob))
EXEC=library.so
TEST_EXEC=test_program

all: $(EXEC)

test: $(TEST_EXEC)

$(TEST_EXEC): main.cob $(SRCS)
	$(COBC) -Wall -Wextra -Werror -x -o $@ $^

$(EXEC): $(SRCS)
	$(COBC) -Wall -Wextra -Werror -b -o $@ $^

clean:
	rm -f *.o $(TEST_EXEC)

fclean: clean
	rm -f $(EXEC)

re: fclean all

.PHONY: all clean fclean re test

