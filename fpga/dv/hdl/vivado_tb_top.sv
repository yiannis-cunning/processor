`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2026 01:40:12 PM
// Design Name: 
// Module Name: vivado_tb_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "fpga_mem_map.svh"

module vivado_tb_top(

    );
    
    fpga_if fpga_sigs();
    fpga_seq seq;

    logic clk_r = 0;

    cpu_system_wrapper I_dut(
        .clk_i(fpga_sigs.clk),
        .resetn_i(fpga_sigs.resetn),
        .run_req_i(fpga_sigs.run_req)
    );

    initial forever #5ns clk_r = ~clk_r;  // 100 MHz

    assign fpga_sigs.clk_i = clk_r;
    assign fpga_sigs.instr_raddr = I_dut.pipeline_top.instr_raddr_o;

    initial begin
        seq = new(fpga_sigs);
        seq.run();
        $finish;
    end

    
endmodule
