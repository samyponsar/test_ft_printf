#include <stddef.h>
#ifdef FT
# include "ft_printf.h"
# define PRINTF ft_printf
#else
# include <stdio.h>
# define PRINTF printf
#endif

#define T(...) { \
    int r = PRINTF(__VA_ARGS__); \
    PRINTF("|ret=%d\n", r); \
}

int main(void)
{
    T("%c", 'x');
    T("%s", "hello world");
    T("%p", (void *)4561564651);
    T("%d", -123);
    T("%i", 456);
    T("%u", 789);
    T("%x", -50);
    T("%X", 4845646);
    T("%%");
    return (0);
}
