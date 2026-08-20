#include <stdint.h>
#include "common.h"



int test_main(uint32_t *inp_data){

    // Test and, or, xor (register-register)

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = i - 511;
    }

    // Xor (combine each element with its neighbour)
    for(int i = 0; i < TEST_SIZE_W - 1; i += 1){
        inp_data[i] = inp_data[i] ^ inp_data[i + 1];
    }

    // Or (combine each element with its neighbour)
    for(int i = 0; i < TEST_SIZE_W - 1; i += 1){
        inp_data[i] = inp_data[i] | inp_data[i + 1];
    }

    // And (combine each element with its neighbour)
    for(int i = 1; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] & inp_data[i - 1];
    }

    return 0;
}
