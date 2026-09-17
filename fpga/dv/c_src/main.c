#include <stdint.h>

#ifndef TEST_SIZE_W
#define TEST_SIZE_W 1024
#endif

static uint32_t g_inp_data[TEST_SIZE_W] = {0x1000, 0x2000};


void _start(){

    
    // Init data
    for (int i = 0; i < TEST_SIZE_W; i += 1)
    {
        g_inp_data[i] = 7;
    }


    uint32_t * gpio = (uint32_t *)0x12000;
    uint32_t swts = 0;
    uint32_t leds = 0;

    int i  = 0;
    while(1){
        swts = (*gpio >> 4) & 0x3;
        leds = swts + (((~swts) & 0x3) << 2);
        *gpio = leds;
        i += 1;
    }


}