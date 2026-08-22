


// ROM, ICCM, DCCM, RAM (stack)
// What is memory map:

// All of below are given in bytes, aligned to 4 byte boundry

// 4KB Rom
`define ROM_START_ADDR 32'h0000
`define ROM_SIZE 32'h1000
`define ROM_ADDRW $clog2(`ROM_SIZE)
`define ROM_PERMS 4'h5

// 64KB ICCM/DCCM
`define ICCM_START_ADDR 32'h10_000
`define ICCM_SIZE 32'h10_000
`define ICCM_ADDRW $clog2(`ICCM_SIZE)
`define ICCM_PERMS 4'h5

`define DCCM_START_ADDR 32'h30_000
`define DCCM_SIZE 32'h10_000
`define DCCM_ADDRW $clog2(`DCCM_SIZE)
`define DCCM_PERMS 4'h6

// 64KB STACK/general RAM 
`define RAM_START_ADDR 32'h50_000
`define RAM_SIZE 32'h10_000
`define RAM_ADDRW $clog2(`RAM_SIZE)
`define RAM_PERMS 4'h6


// Stack grows down
`define STACK_START_ADDR (`RAM_START_ADDR + `RAM_SIZE)
`define PROGRAM_START_ADDRESS 32'h10_1000
`define PROGRAM_DONE_ADDRESS 32'h120
`define TEST_SIZE_WORDS 20

// PC_START_ADDR = 0x100 (RTL)


