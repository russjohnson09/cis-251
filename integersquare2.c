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
