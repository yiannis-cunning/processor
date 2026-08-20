#include <stdint.h>
#include "common.h"



int test_main(uint32_t *inp_data){

    // Test addi, slti, sltiu

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = i - 511;
    }

    // Addi (add small immediate constant)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] + 123;
    }

    // Slti (signed compare against immediate)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        int32_t val = (int32_t)inp_data[i];
        inp_data[i] = (val < 200) ? 1u : 0u;
    }

    // Re-init with a different pattern for sltiu
    // (i * 37 built from shifts/adds -- RV32I has no hardware multiplier)
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        uint32_t iv = (uint32_t)i;
        inp_data[i] = (iv << 5) + (iv << 2) + iv;
    }

    // Sltiu (unsigned compare against immediate)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = (inp_data[i] < 2000u) ? 1u : 0u;
    }

    return 0;
}
