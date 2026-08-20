#include <stdint.h>
#include "common.h"



// Test lui, auipc

static const uint32_t g_offsets[4] = {
    0x00000000,
    0x000000FF,
    0x0000FF00,
    0x00FF0000
};

int test_main(uint32_t *inp_data){

    // Large immediates that don't fit in 12 bits -> lui
    uint32_t big_const_1 = 0x12345000;
    uint32_t big_const_2 = 0xABCDE000;

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = big_const_1 ^ (uint32_t)i;
    }

    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] + big_const_2;
    }

    // Access to a static global's address requires pc-relative addressing -> auipc
    // (index masked with & 3, not %, since RV32I has no divider)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] ^ g_offsets[i & 3];
    }

    return 0;
}
