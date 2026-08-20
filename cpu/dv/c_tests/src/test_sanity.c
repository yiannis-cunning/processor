#include <stdint.h>
#include "common.h"




int test_main(uint32_t *inp_data){

    // Test add, sub, xor, or and, shift, set lt/gt

    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        inp_data[i] = 7;
    }


    return 0;
}
