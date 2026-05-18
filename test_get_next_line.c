#include <stdio.h>
#include <fcntl.h>
#include "get_next_line.h"

void	test_file(char *filename)
{
	int		fd;
	char	*line;

	fd = open(filename, O_RDONLY);
	//line = get_next_line(fd);
	//printf("%s\n", line);
	while ((line = get_next_line(fd)))
	{
		printf("> %s", line);
	}
	close(fd);
}

int	main(int argc, char **argv)
{
	if (argc > 1)
	{
		test_file(argv[1]);
	}
}
