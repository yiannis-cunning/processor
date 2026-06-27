

`define ICCM_MEM_SIZE



module iccm_mem(
    input wire clk,
    input wire resetn,

    // ICCM I/F
    input wire [31:0] instr_raddr_i,
    output wire  [31:0] instr_data_o,
);



endmodule