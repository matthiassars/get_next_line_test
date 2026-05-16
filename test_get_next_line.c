#include <stdio.h>
#include <fcntl.h>
#include "get_next_line.h"

void	test_file(char *filename)
{
	int		fd;
	char	*line;

	fd = open(filename, O_RDONLY);
	while ((line = get_next_line(fd)))
	{
		write(1, "{ ", 2);
		write(1, line, BUFFER_SIZE);
		write(1, " }\n", 3);
	}
	close(fd);
}

int	main(void)
{
	test_file("robots.txt");
}
