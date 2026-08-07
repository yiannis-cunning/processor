#include <stdint.h>
#include "common.h"



int test_main(uint32_t *inp_data){

    // Test slli, srli, srai

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = i - 511;
    }

    // Slli (shift left by a constant amount)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] << 3;
    }

    // Srli (logical shift right by a constant amount, unsigned operand)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] >> 2;
    }

    // Srai (arithmetic shift right by a constant amount, signed operand)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        int32_t val = (int32_t)inp_data[i];
        val = val >> 4;
        inp_data[i] = (uint32_t)val;
    }

    return 0;
}
