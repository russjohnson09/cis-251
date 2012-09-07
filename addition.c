#include <stdlib.h>
#include <stdio.h>

static char syscall_buf[256];
#define syscall_read_int()          atoi(fgets(syscall_buf,256,stdin))

main()
{
    int input;
    int result = 0;

    do {
        input = syscall_read_int();
        result = result + input;
    } while(input != 0);

    printf("%i\n", result);
}

