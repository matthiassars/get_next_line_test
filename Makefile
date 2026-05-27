# --- Compiler and Flags ---
CC		= cc
CFLAGS	= -Wall -Wextra
INCLUDES  = -I ./get_next_line

# --- Track BUFFER_SIZE changes ---
BUFFER_SIZE_FILE = .buffer_size

# --- Optional Buffer Size ---
ifdef BUFFER_SIZE
	CFLAGS += -D BUFFER_SIZE=$(BUFFER_SIZE)
endif

# Check if BUFFER_SIZE changed and clean objects if needed
$(shell \
	current="$(BUFFER_SIZE)"; \
	cached=$$(cat $(BUFFER_SIZE_FILE) 2>/dev/null); \
	if [ "$$current" != "$$cached" ]; then \
		echo "$(BUFFER_SIZE)" > $(BUFFER_SIZE_FILE); \
		rm -f *.o get_next_line/*.o; \
	fi \
)

# --- Source and Object Files ---
# Mandatory
NAME	  = test_get_next_line
SRCS	  = test_get_next_line.c \
			get_next_line/get_next_line.c \
			get_next_line/get_next_line_utils.c
OBJS	  = $(SRCS:.c=.o)

# Bonus
NAME_B	= test_get_next_line_bonus
SRCS_B	= test_get_next_line_bonus.c \
			get_next_line/get_next_line_bonus.c \
			get_next_line/get_next_line_utils_bonus.c
OBJS_B	= $(SRCS_B:.c=.o)

# --- Rules ---

# Default target: builds both mandatory and bonus
all: mandatory bonus

# Explicit rule for mandatory part
mandatory: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJS) -o $(NAME)

# Rule for bonus part
bonus: $(NAME_B)

$(NAME_B): $(OBJS_B)
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJS_B) -o $(NAME_B)

# Implicit rule to compile .c files into .o files
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Clean up object files only
clean:
	rm -f $(OBJS) $(OBJS_B)

# Clean up object files AND the final executables
fclean: clean
	rm -f $(NAME) $(NAME_B) $(BUFFER_SIZE_FILE)

# Rebuild everything from scratch
re: fclean all

.PHONY: all mandatory bonus clean fclean re