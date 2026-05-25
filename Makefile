CC =		cc
CFLAGS =	-Wall -Wextra -I./get_next_line

TARGETS =	test_get_next_line \
			test_get_next_line_bonus

# Explicitly list the GNL sources and convert them to .o targets
GNL_SRC =	get_next_line/get_next_line.c \
			get_next_line/get_next_line_utils.c
GNL_OBJ =	$(GNL_SRC:.c=.o)

# Test source files
SRC =		test_get_next_line.c \
			test_get_next_line_bonus.c

# Combine all object files for the clean rule
OBJ =		$(SRC:.c=.o) $(GNL_OBJ)

HEADERS =	get_next_line/get_next_line.h

all: $(TARGETS)

# Individual rules for the targets ensuring they link the GNL objects explicitly
test_get_next_line: test_get_next_line.o $(GNL_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

test_get_next_line_bonus: test_get_next_line_bonus.o $(GNL_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

set-buffer-size: CFLAGS += -D BUFFER_SIZE=$(BUFFER_SIZE)
set-buffer-size: re

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(TARGETS)

re: fclean all

.PHONY: all clean fclean re set-buffer-size