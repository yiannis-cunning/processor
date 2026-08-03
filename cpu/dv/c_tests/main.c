
#ifdef COMPILE_X86
#include <stdio.h>
#endif
#include <stdint.h>


#include "common.h"


static uint32_t g_inp_data[TEST_SIZE_W] = {0x1000, 0x2000};

#ifndef COMPILE_X86
/*
For RISC:
    - Run test
    - Return to supervisor
*/
void _start(){
    // We could set stack pointer here?


    // Run test
    test_main(g_inp_data);

    return;
}

#else
/*
For x86:
    - Run test
    - Print results
    - exit
*/
int main(){

    // Run test
    test_main(g_inp_data);

    // Print output data
    for(int i = 0; i < TEST_SIZE_W; i += 1){

        if( (i % 16) != 0){
            printf("-");
        }
        printf("%08x", g_inp_data[i]);

        if( ( (i + 1) % 16) == 0){
            printf("\n");
        }
        
    }
}
#endif