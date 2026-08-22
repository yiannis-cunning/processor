`timescale 1ns/1ps


`include "risc_mem_cfg.svh"

import main_seq_pkg::*;

module tb_top;


    logic clk_i = 0;
    logic done_state;

    // Instruction memory interface
    logic [31:0] instr_raddr_o;
    logic [31:0] instr_data_i;

    // Data memory interface
    logic [31:0] data_rd_addr_o;
    logic [31:0] data_rd_data_i;
    logic        data_rd_en_o;
    logic [31:0] data_wr_addr_o;
    logic [31:0] data_wr_data_o;
    logic [3:0] data_mem_strb_en_o;
    logic        data_wr_en_o;

    cpu_if cpu_sigs();
    assign cpu_sigs.clk = clk_i;
    assign cpu_sigs.instr_raddr_o = instr_raddr_o;

    // -----------------------------
    // DUT Instance
    // -----------------------------
    pipeline_top dut (
        .resetn_i(cpu_sigs.resetn),
        .clk_i(clk_i),
        .run_req_i(cpu_sigs.run_req_i),
        .done_state(done_state),

        .instr_raddr_o(instr_raddr_o),
        .instr_data_i(instr_data_i),

        .data_rd_addr_o(data_rd_addr_o),
        .data_rd_data_i(data_rd_data_i),
        .data_rd_en_o(data_rd_en_o),

        .data_wr_addr_o(data_wr_addr_o),
        .data_wr_data_o(data_wr_data_o),
        .data_mem_strb_en_o(data_mem_strb_en_o),
        .data_wr_en_o(data_wr_en_o)
    );


    memory_top I_mem(
        .clk_i(clk_i),
        .resetn_i(cpu_sigs.resetn),

        .instr_raddr_i(instr_raddr_o),
        .instr_data_o(instr_data_i),

        .data_rd_addr_i(data_rd_addr_o),
        .data_rd_data_o(data_rd_data_i),
        .data_rd_en_i(data_rd_en_o),
        .data_wr_addr_i(data_wr_addr_o),
        .data_wr_data_i(data_wr_data_o),
        .data_mem_strb_en_i(data_mem_strb_en_o),
        .data_wr_en_i(data_wr_en_o)

    );

    initial forever #5ns clk_i = ~clk_i;  // 100 MHz

    main_seq seq;

    sram_dbg_if dbg_if();
    assign dbg_if.mem_r = tb_top.I_mem.I_dccm.mem_r;


    //bind sram sram_dbg_if dbg_if; // Bind dbg_if into every sram instance

    initial begin
        seq = new(cpu_sigs, dbg_if);

        seq.reset_cpu();

        
        seq.run();
        $finish;


    end

    mem_assertions I_mem_assert();

endmodule