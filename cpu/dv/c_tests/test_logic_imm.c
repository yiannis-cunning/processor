#include <stdint.h>
#include "common.h"



int test_main(uint32_t *inp_data){

    // Test xori, ori, andi

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = i - 511;
    }

    // Xori
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] ^ 0x555;
    }

    // Ori
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] | 0x0F0;
    }

    // Andi
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] & 0x7FF;
    }

    return 0;
}
