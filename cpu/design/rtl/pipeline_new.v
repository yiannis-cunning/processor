


module pipeline_top(

    input wire resetn_i,
    input wire clk_i,

    input wire run_req_i,
    output wire done_state,
    //output wire [7:0] gpo,

    // Instruction mem RO interface
    output wire [31:0]      instr_raddr_o,
    input wire  [31:0]      instr_data_i,
    output wire             instr_rd_en_o,
    input wire              instr_rd_wait_i,
    input wire              instr_rd_ready_i,

    // Data memory interface
    output wire [31:0]  mem_addr_o,
    input wire [31:0]   mem_rdata_i,
    output wire [31:0]  mem_wdata_o,
    output reg [3:0]    mem_strb_en_o,
    output wire         mem_rd_en_o,
    output wire         mem_wr_en_o,
    input wire          mem_ready_i,
    input wire          mem_wait_i

);

    fetch1_new I_fetch1(
        .clk_i(clk_i),
        .resetn_i(resetn_i),

        .stall_en_i(run_req_i),
        .hold_next_i(fetch2_fetch1_hold),
        .branch_enable_i(execute_branch_enable_int),
        .branch_dest_i(execute_decode_pc_dest_int),

        .instr_raddr_o(instr_raddr_o),
        .instr_rd_en_o(instr_rd_en_o),
        
        // To Fetch 1
        .f1f2_pcp4_reg_o(f1f2_instr_valid_o),
        .f1f2_instr_valid_o(f1f2_instr_valid_o)
    );

    fetch2_new I_fetch2(
        .clk_i(clk_i),
        .resetn_i(resetn_i),

        .stall_en_i(),
        .hold_next_i(),
        .hold_prev_o(fetch2_fetch1_hold),
        .instr_invalidate_i(),

        .f2_mem_wait_o(),

        // From Fetch 1
        .instr_rdata_i(instr_data_i),
        .instr_rd_wait_i(instr_rd_wait_i),
        .instr_rd_ready_i(instr_rd_ready_i),
        
        // To Decode
        .f2d_instr_reg_o(f1f2_instr_valid_o),
        .f2d_pcp4_reg_o(f1f2_instr_valid_o),
        .f2d_instr_valid_reg_o(f2d_instr_valid_reg_o)

    );


endmodule