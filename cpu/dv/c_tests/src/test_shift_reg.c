#include <stdint.h>
#include "common.h"



int test_main(uint32_t *inp_data){

    // Test sll, srl, sra

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = i - 511;
    }

    // Sll (shift left by a variable/register amount)
    // Shift amounts derived with a power-of-2 mask, not %, since RV32I has no divider
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        uint32_t shamt = (uint32_t)i & 0x1F;
        inp_data[i] = inp_data[i] << shamt;
    }

    // Srl (logical shift right by a variable amount, unsigned operand)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        uint32_t shamt = (uint32_t)i & 0x0F;
        inp_data[i] = inp_data[i] >> shamt;
    }

    // Sra (arithmetic shift right by a variable amount, signed operand)
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        int32_t val = (int32_t)inp_data[i];
        uint32_t shamt = (uint32_t)i & 0x07;
        val = val >> shamt;
        inp_data[i] = (uint32_t)val;
    }

    return 0;
}
