#include <stdint.h>
#include "common.h"



int test_main(uint32_t *inp_data){

    // Test slt, sltu

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = i - 511;
    }

    // Slt (signed compare between neighbouring elements)
    for(int i = 0; i < TEST_SIZE_W - 1; i += 1){
        int32_t a = (int32_t)inp_data[i];
        int32_t b = (int32_t)inp_data[i + 1];
        inp_data[i] = (a < b) ? 1u : 0u;
    }

    // Re-init with a pattern that exercises values with the msb set
    // (xorshift mix -- avoids multiply since RV32I has no hardware multiplier)
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        uint32_t x = (uint32_t)i;
        x ^= x << 13;
        x ^= x >> 7;
        x ^= x << 5;
        inp_data[i] = x ^ 0x80000000u;
    }

    // Sltu (unsigned compare between neighbouring elements)
    for(int i = 0; i < TEST_SIZE_W - 1; i += 1){
        inp_data[i] = (inp_data[i] < inp_data[i + 1]) ? 1u : 0u;
    }

    return 0;
}
