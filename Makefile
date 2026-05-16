CC =		cc
CFLAGS =	-Wall -Wextra -I./get_next_line
NAME = 		test_get_next_line

SRC =		test_get_next_line.c \
			get_next_line/get_next_line.c \
			get_next_line/get_next_line_utils.c

OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

define: CFLAGS += "-DBUFFER_SIZE=$(BUFFER_SIZE)"
define: re

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re define
