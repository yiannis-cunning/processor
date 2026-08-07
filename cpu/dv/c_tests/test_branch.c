#include <stdint.h>
#include "common.h"



int test_main(uint32_t *inp_data){

    // Test beq, bne, blt, bge, bltu, bgeu

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = i - 511;
    }

    // Beq / bne
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        if(inp_data[i] == 0){
            inp_data[i] = 0xdeadbeef;
        } else {
            inp_data[i] = ~inp_data[i];
        }
    }

    // Blt / bge (signed compare against a threshold)
    int32_t threshold = 0;
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        int32_t val = (int32_t)inp_data[i];
        if(val < threshold){
            inp_data[i] = (uint32_t)(val + 1000);
        } else {
            inp_data[i] = (uint32_t)(val - 1000);
        }
    }

    // Bltu / bgeu (unsigned compare against a threshold)
    uint32_t uthreshold = 0x80000000;
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        if(inp_data[i] < uthreshold){
            inp_data[i] = inp_data[i] + 1;
        } else {
            inp_data[i] = inp_data[i] - 1;
        }
    }

    return 0;
}
