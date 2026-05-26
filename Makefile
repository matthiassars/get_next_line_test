# --- Compiler and Flags ---
CC        = cc
CFLAGS    = -Wall -Wextra
INCLUDES  = -I ./get_next_line

# --- Optional Buffer Size ---
# If BUFFER_SIZE is provided via command line (e.g., make BUFFER_SIZE=42),
# it appends the -D flag to CFLAGS.
ifdef BUFFER_SIZE
    CFLAGS += -D BUFFER_SIZE=$(BUFFER_SIZE)
endif

# --- Source Files and Outputs ---
# Mandatory
NAME      = test_get_next_line
SRCS      = test_get_next_line.c \
            get_next_line/get_next_line.c \
            get_next_line/get_next_line_utils.c

# Bonus
NAME_B    = test_get_next_line_bonus
SRCS_B    = test_get_next_line_bonus.c \
            get_next_line/get_next_line_bonus.c \
            get_next_line/get_next_line_utils_bonus.c

# --- Rules ---

# Default target compiles both the mandatory and the bonus part
all: mandatory bonus

mandatory: $(NAME)

# Compiles mandatory binary
$(NAME): $(SRCS)
	$(CC) $(CFLAGS) $(INCLUDES) $(SRCS) -o $(NAME)

# Compiles bonus binary
bonus: $(NAME_B)

$(NAME_B): $(SRCS_B)
	$(CC) $(CFLAGS) $(INCLUDES) $(SRCS_B) -o $(NAME_B)

# Clean up binaries
clean:
	rm -f $(NAME) $(NAME_B)

fclean: clean

re: fclean all

.PHONY: all bonus clean fclean re