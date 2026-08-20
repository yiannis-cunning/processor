#include <stdint.h>
#include "common.h"



// Test jal, jalr

static uint32_t add_const(uint32_t val, uint32_t k){
    return val + k;
}

static uint32_t sub_const(uint32_t val, uint32_t k){
    return val - k;
}

typedef uint32_t (*op_fn)(uint32_t, uint32_t);

int test_main(uint32_t *inp_data){

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = i - 511;
    }

    // Direct calls -> jal
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        inp_data[i] = add_const(inp_data[i], 3);
    }

    // Indirect calls through a function pointer -> jalr
    // (index masked with & 1, not %, since RV32I has no divider)
    op_fn ops[2] = { add_const, sub_const };
    for(int i = 0; i < TEST_SIZE_W; i += 1){
        op_fn f = ops[i & 1];
        inp_data[i] = f(inp_data[i], 5);
    }

    return 0;
}
