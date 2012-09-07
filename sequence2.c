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
