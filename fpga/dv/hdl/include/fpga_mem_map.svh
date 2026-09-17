

/*
ICCM: 0x0 -> 0x8000
(size = 0x8000)
ROM: 0x0 -> 0x1000
DONE addr: 0x107 ish
.text: 0x1000 -> 0x8000

DCCM: 0x9000 -> 0x11000
(size = 0x8000)
.data: 0x9000 -> 0xc000
.stack: 0x11000 -> 0xc000 (no overflow protection)


GPIO: 0x12000
(size 128)

*/

`define ICCM_SIZE_B 32'h8000
`define DCCM_SIZE_B 32'h8000

`define TEST_SIZE_WORDS 10

`define PROGRAM_DONE_ADDRESS 32'h120