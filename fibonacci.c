// fibonacci.c

#include <stdlib.h>
#include <stdio.h>
#define syscall_print_int(arg)      printf("%i",(arg))
#define syscall_print_string(arg)   fputs((arg),stdout)
static char syscall_buf[256];
#define syscall_read_int()          atoi(fgets(syscall_buf,256,stdin))
#define syscall_exit()              exit(0)
#define syscall_print_char(arg)     putchar(arg)
#define syscall_read_char(arg)      getchar()

void print(int data[], int how_many);

int
main()
{
    int fibs[19];
    int limit = 19;

    int how_many;
    do {
        syscall_print_string(
            "How many Fibonacci numbers to generate? (2 <= x <= 19) "
            );
        how_many = syscall_read_int();
        }
      while ( how_many > limit  ||  how_many < 0 );

    int next_value = 1;
    fibs[0] = next_value;
    fibs[1] = next_value;
    int index_mark = 0;
    for ( int repetitions = how_many - 2 ;  repetitions > 0 ;  repetitions-- ) {
        int f_n_minus_2 = fibs[index_mark];
        int f_n_minus_1 = fibs[index_mark + 1];
        int f_n = f_n_minus_2 + f_n_minus_1;
        fibs[index_mark + 2] = f_n;
        index_mark++;
        }

    print(fibs, how_many);

    syscall_exit();
}


void
print(int data[], int how_many)
{
    syscall_print_string("The Fibonacci numbers are:\n");
    int index = 0;
    while ( how_many > 0 ) {
        syscall_print_int(data[index]);
        syscall_print_string("\n");
        index++;
        how_many--;
        }
}
