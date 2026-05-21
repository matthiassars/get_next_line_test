CC =		cc
CFLAGS =	-Wall -Wextra -I./get_next_line
NAME = 		test_get_next_line

SRC =		test_get_next_line.c \
			get_next_line/get_next_line.c \
			get_next_line/get_next_line_utils.c

OBJ = $(SRC:.c=.o)

HEADERS =	get_next_line/get_next_line.h

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

set-buffer-size: CFLAGS += -D BUFFER_SIZE=$(BUFFER_SIZE)
set-buffer-size: re

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re define
