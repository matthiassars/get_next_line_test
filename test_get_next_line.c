#include <stdio.h>
#include <fcntl.h>
#include "get_next_line.h"

void	test_get_next_line(int fd)
{
	char	*line;

	line = get_next_line(fd);
	printf("\33[1m%d", fd);
	while (line)
	{
		printf("\33[1;32m>\33[0m");
		printf("%s", line);
		printf("\33[1;31m>\33[0m");
		free(line);
		line = get_next_line(fd);
	}
	printf("\n");
}

int	main(int argc, char **argv)
{
	int	fd;

	if (argc <= 1)
		test_get_next_line(0);
	else
	{
		fd = open(argv[1], O_RDONLY);
		test_get_next_line(fd);
		close(fd);
	}
}
