#include <stdio.h>

main()
{
    printf("%i",0);
    int i = 0;
    printf("%i",i);
    int result = 0;
    while (i < 10){
        result = result + i;
        i++;
    }
    printf("%i",result);
}
