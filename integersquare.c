#include <stdlib.h>
#include <stdio.h>

#define syscall_print_int(arg)      printf("%i",(arg))
#define syscall_print_string(arg)   fputs((arg),stdout)
static char syscall_buf[256];
#define syscall_read_int()          atoi(fgets(syscall_buf,256,stdin))

main()
{
    int input;
    syscall_print_string("Please enter a non-negative integer: ");
    input = syscall_read_int();
    if (input < 0){
        printf("The integer you entered is negative.\n");
        exit(1);
    }
    int result = 0;
    for (int i = 1; i * i < input || i * i == input; i++){
        result = i;
    }
    printf("%i\n", result);

}

/*
import java.util.Scanner;

public class IntegerSquare {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Please enter a non-negative integer: ");
		Integer input = Integer.parseInt(scanner.nextLine());
		if (input < 0) {
			System.out.println("The integer you entered is negative.");
			System.exit(1);
		}
		int result = 0;
		for (int i = 0; i * i < input || i * i == input; i++) {
			result = i;
		}
		System.out.println("The integer square root of " + input + " is "
				+ result);
	}

}*/
