

#ifdef FOR_x86_SIM
#include <stdio.h>
#include <stdint.h>
#endif







static char arr[31] = "Hello World from inside a arr";

#ifdef FOR_x86_SIM
int main(){
#else
int _start(){
#endif

    int a = 0;
    int b = 1;

    for(int i = 9; i < 13; i += 4){
        a += b;
        b = (b << 1) ^ b;

        arr[i & 0x1F] = (char) (b & 0xff);
    }

    #ifdef FOR_x86_SIM
    printf("Printing result of random sequence\n");
    for(int i = 0; i < 31; i += 1){
        printf("Byte %d = %x\n", i, (uint8_t)arr[i]);
    }
    #endif

    return a + b; //printf("a = %d, b = %d\n");

}
