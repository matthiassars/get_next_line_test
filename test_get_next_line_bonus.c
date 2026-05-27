#include <stdio.h>
#include <fcntl.h>
#include "get_next_line.h"

void	print_rep(char c, int n)
{
	while (n > 0)
	{
		putchar(c);
		n--;
	}
}

int	main(int argc, char **argv)
{
	int		fd[1024];
	char	*line;
	int		not_done_yet;

	not_done_yet = 1;
	for (int i = 1; i < argc; i++)
		fd[i] = open(argv[i], O_RDONLY);
	putchar(' ');
	while (not_done_yet)
	{
		not_done_yet = 0;
		for (int i = 1; i < argc; i++)
		{
			line = get_next_line(fd[i]);
			if (line)
			{
				not_done_yet = 1;
				print_rep(' ', (i - 1) * 4);
				printf("\33[0m%d>\33[1;3%dm", fd[i], (fd[i] - 2) % 8);
				printf("%s", line);
				printf("\33[0m>");
				free(line);
			}
		}
	}
	for (int i = 1; i < argc; i++)
		close(fd[i]);
	putchar('\n');
}
