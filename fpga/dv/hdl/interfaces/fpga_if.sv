`include "fpga_mem_map.svh"


interface fpga_if ();
    logic resetn;
    logic clk;
    logic run_req;
    logic [1:0] switches;
    logic [31:0] instr_raddr;

    logic [31:0] iccm_mem_r [(`ICCM_SIZE_B >> 2) - 1: 0];
    logic [31:0] dccm_mem_r [(`DCCM_SIZE_B >> 2) - 1: 0];

endinterface