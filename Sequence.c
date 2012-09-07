#include <stdlib.h>
#include <stdio.h>

#define syscall_print_int(arg)      printf("%i",(arg))
#define syscall_print_string(arg)   fputs((arg),stdout)
static char syscall_buf[256];
#define syscall_read_int()          atoi(fgets(syscall_buf,256,stdin))

int
main()
{
    int input;
    syscall_print_string("Please enter a positive integer: ");
    input = syscall_read_int();
    if (input < 0){
        printf("The integer you entered is not positive.\n");
        exit(1);
    }
    int result = 0;
    for (int i = 0; i < input; i++){
        result += 2 * i + 1;
        printf("(2*%i + 1)",i);
        if (i < input-1){
            printf(" + ");
        } else {
            printf(" = ");
        }
    }
    printf("%i\n", result);

}
