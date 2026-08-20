`timescale 1ns/1ps


`include "risc_mem_cfg.svh"

import main_seq_pkg::*;

module tb_top;

    // -----------------------------
    // Testbench Signals
    // -----------------------------
    logic resetn_i;
    logic clk_i = 0;

    logic run_req_i;
    logic done_state;

    cpu_if cpu_sigs();

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

    // -----------------------------
    // Memory Models
    // -----------------------------
    logic [31:0] main_mem  [0:1023];
    logic [31:0] iccm_mem  [0:1023];

    // -----------------------------
    // DUT Instance
    // -----------------------------
    pipeline_top dut (
        .resetn_i(resetn_i),
        .clk_i(clk_i),
        .run_req_i(run_req_i),
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
        .resetn_i(resetn_i),

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

    initial begin
        resetn_i = 0;
        run_req_i = 0;

        #40;
        resetn_i = 1;

        #40;
        run_req_i = 1;

        //#100;
        //run_req_i = 0;
    end

    main_seq seq;

    initial begin
        //wait(done_state);
        fork
            begin
                wait(instr_raddr_o == `PROGRAM_DONE_ADDRESS);
                $display("PC Reached end loop.");
            end
            begin
                #50us;
                $display("Program timed out after 50us");
            end
        join_any

        $finish;
    end

    mem_assertions I_mem_assert();

endmodule