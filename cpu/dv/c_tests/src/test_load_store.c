#include <stdint.h>
#include "common.h"



int test_main(uint32_t *inp_data){

    // Test lb, lh, lw, lbu, lhu, sb, sh, sw

    // Init data
    // Replicate the low byte of i into all 4 lanes via shifts, not multiply
    // (RV32I has no hardware multiplier)
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        uint32_t b = (uint32_t)i & 0xFF;
        uint32_t rep = b | (b << 8) | (b << 16) | (b << 24);
        inp_data[i] = rep - 0x40404040;
    }

    uint8_t  *byte_ptr  = (uint8_t  *)inp_data;
    int8_t   *sbyte_ptr = (int8_t   *)inp_data;
    uint16_t *half_ptr  = (uint16_t *)inp_data;
    int16_t  *shalf_ptr = (int16_t  *)inp_data;

    uint32_t num_bytes = TEST_SIZE_W * 4;
    uint32_t num_halfs = TEST_SIZE_W * 2;

    // Lbu / sb (zero-extend byte load, byte store)
    for(uint32_t i = 0; i < num_bytes; i += 1){
        uint8_t b = byte_ptr[i];
        byte_ptr[i] = b + 1;
    }

    // Lb / sb (sign-extend byte load, byte store)
    for(uint32_t i = 0; i < num_bytes; i += 1){
        int8_t b = sbyte_ptr[i];
        sbyte_ptr[i] = -b;
    }

    // Lhu / sh (zero-extend halfword load, halfword store)
    for(uint32_t i = 0; i < num_halfs; i += 1){
        uint16_t h = half_ptr[i];
        half_ptr[i] = h + 1;
    }

    // Lh / sh (sign-extend halfword load, halfword store)
    for(uint32_t i = 0; i < num_halfs; i += 1){
        int16_t h = shalf_ptr[i];
        shalf_ptr[i] = -h;
    }

    // Lw / sw (word load and store)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = inp_data[i] + 0x11111111;
    }

    return 0;
}
