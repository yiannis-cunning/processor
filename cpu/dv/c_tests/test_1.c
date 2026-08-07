#include <stdint.h>
#include "common.h"




int test_main(uint32_t *inp_data){

    // Test add, sub, xor, or and, shift, set lt/gt

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = i - 511;
    }

    // Add
    for(int i = 0; i < TEST_SIZE_W - 1; i += 1){
        inp_data[i] = inp_data[i] + inp_data[i + 1];
    }

    // Sub
    for(int i = 1; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] - inp_data[i - 1];
    }

    // x should = x + 2
    for(int i = 0; i < TEST_SIZE_W - 1; i += 1){
        inp_data[i] = inp_data[i] ^ inp_data[i + 1];
    }

    return 0;
}
