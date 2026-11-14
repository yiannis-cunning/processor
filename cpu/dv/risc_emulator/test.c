#include <stdio.h>
#include <stdint.h>

typedef union
{
    uint32_t raw;
    struct {
        uint32_t a : 1;
        uint32_t b : 30;
        uint32_t c : 1;
    };
} newtype;



int main(){
    newtype x = {0};
    x.raw = 0x1;
    printf("value of a = %d, b = %d, c = %d\n", x.a, x.b, x.c);
    x.c = 1;
    printf("value of raw: %x\n", x.raw);

}