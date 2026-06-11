# 📜 get_next_line_test

*by Matthias Sars, <msars@student.42berlin.de>*

## Description

A simple test program with example text files for the project `get_next_line` from the 42 core curriculum (version 14.3).

## Instructions
Compile with `make`, `make mandatory` or `make bonus`. You can append `BUFFER_SIZE=<your buffer size>` to define another `BUFFER_SIZE`.

To test the mandatory part, run `test_get_next_line`. It takes the first argument as the filename; if no argument is given, the standard input is read. So, run for example with
* `./test_get_next_line <filename>`,
* `./test_get_next_line < <filename>`,
* or `cat <filename> | ./test_get_next_line`.

Run `test_get_next_line_bonus` to test the bonus part. Every argument is taken as filename, so run with
* `./test_get_next_line_bonus <filename 1> <filename 2> ...`

No guarantees; also perform your own tests!

## Resources

The text in `circles.txt` is written by Oscar Matallana, <https://github.com/oscarmatallana>.
