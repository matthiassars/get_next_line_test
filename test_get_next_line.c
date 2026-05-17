#include <stdio.h>
#include <fcntl.h>
#include "get_next_line.h"

void	test_file(char *filename)
{
	int		fd;
	char	*line;

	fd = open(filename, O_RDONLY);
	//get_next_line(fd);
	while ((line = get_next_line(fd)))
	{
		write(1, "> ", 2);
		write(1, line, BUFFER_SIZE);
	}
	close(fd);
}

int	main(int argc, char **argv)
{
	(void)argc;
	test_file(argv[1]);
}
