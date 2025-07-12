COBC=cobc
SRCS=$(wildcard *.cob)
EXEC=library.so

all: $(EXEC)

$(EXEC): $(SRCS)
	$(COBC) -b -o $@ $^

clean:
	rm -f *.o

fclean: clean
	rm -f $(EXEC)

re: fclean all

.PHONY: all clean fclean re
