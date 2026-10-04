`timescale 1ns/1ps


`include "risc_mem_cfg.svh"

import main_seq_pkg::*;


import uvm_pkg::*;
import cpu_pkg::*;   // so simple_test gets registered with the factory

module tb_top;


    logic clk_i = 0;
    logic done_state;

    // Instruction memory interface
    logic [31:0] instr_raddr_o;
    logic [31:0] instr_data_i;
    logic       instr_rd_en_o;

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
    assign cpu_sigs.instr_raddr_o = dut.pipeline.instr_raddr_o;


    lmb_if iccm_lmb_if(cpu_sigs.clk, cpu_sigs.resetn);
    lmb_if dccm_lmb_if(cpu_sigs.clk, cpu_sigs.resetn);

    // -----------------------------
    // DUT Instance
    // -----------------------------
    cpu_top dut (
        .resetn_i(cpu_sigs.resetn),
        .clk_i(clk_i),
        .run_req_i(cpu_sigs.run_req_i),
        .done_state(done_state),

        .iccm_word_raddr_o(iccm_lmb_if.lmb_addr),
        .iccm_wdata_o(iccm_lmb_if.lmb_wdatabus),
        .iccm_data_i(iccm_lmb_if.lmb_rdatabus),
        .iccm_wr_en_o(iccm_lmb_if.lmb_writestrobe),
        .iccm_rd_en_o(iccm_lmb_if.lmb_readstrobe),
        .iccm_wr_byte_en_i(iccm_lmb_if.lmb_byte_en),
        .iccm_addrstrobe_o(iccm_lmb_if.lmb_addrstrobe),
        .iccm_ready_i(iccm_lmb_if.lmb_ready),
        .iccm_wait_i(iccm_lmb_if.lmb_wait),

        .dccm_addr_o(dccm_lmb_if.lmb_addr),
        .dccm_wdata_o(dccm_lmb_if.lmb_wdatabus),
        .dccm_rdata_i(dccm_lmb_if.lmb_rdatabus),
        .dccm_wr_en_o(dccm_lmb_if.lmb_writestrobe),
        .dccm_rd_en_o(dccm_lmb_if.lmb_readstrobe),
        .dccm_wr_byte_en_o(dccm_lmb_if.lmb_byte_en),
        .dccm_addrstrobe_o(dccm_lmb_if.lmb_addrstrobe),
        .dccm_ready_i(dccm_lmb_if.lmb_ready),
        .dccm_wait_i(dccm_lmb_if.lmb_wait)

    );
    assign data_wr_addr_o = data_rd_addr_o;
    


    memory_top I_mem(
        .clk_i(clk_i),
        .resetn_i(cpu_sigs.resetn),

        .instr_raddr_i(instr_raddr_o),
        .instr_data_o(instr_data_i),
        .instr_rd_en_i(instr_rd_en_o),

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


    initial begin
        // Allow access to these physical interfaces from uvm_root.uvm_test_top class, by the name given.

        uvm_config_db#(virtual lmb_if)::set(null, "uvm_test_top.env.iccm_lmb_agent*", "vif", iccm_lmb_if);
        uvm_config_db#(virtual lmb_if)::set(null, "uvm_test_top.env.dccm_lmb_agent*",  "vif", dccm_lmb_if);


        uvm_config_db#(virtual cpu_if)::set(null, "uvm_test_top", "cpu_vif", cpu_sigs);
        uvm_config_db#(virtual sram_dbg_if)::set(null, "uvm_test_top", "dccm_dbg_vif", dbg_if);
        run_test("simple_test");   // test name from +UVM_TESTNAME=cpu_test on the command line
    end

    /*
    initial begin
        seq = new(cpu_sigs, dbg_if);

        seq.reset_cpu();

        
        seq.run();
        $finish;
    end*/

    mem_assertions I_mem_assert();

endmodule