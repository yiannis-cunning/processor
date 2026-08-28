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


module vivado_tb_top(

    );
    
    
  reg [12:0]BRAM_PORTA_0_addr;
  reg BRAM_PORTA_0_clk;
  reg [31:0]BRAM_PORTA_0_din;
  wire [31:0]BRAM_PORTA_0_dout;
  reg BRAM_PORTA_0_en;
  reg [0:0]BRAM_PORTA_0_we;
  
    cpu_system_wrapper I_dut(
        .BRAM_PORTA_0_addr(BRAM_PORTA_0_addr),
        .BRAM_PORTA_0_clk(BRAM_PORTA_0_clk),
        .BRAM_PORTA_0_din(BRAM_PORTA_0_din),
        .BRAM_PORTA_0_dout(BRAM_PORTA_0_dout),
        .BRAM_PORTA_0_en(BRAM_PORTA_0_en),
        .BRAM_PORTA_0_we(BRAM_PORTA_0_we)/*,
        .a_0(BRAM_PORTA_0_addr),
        .clk_0(BRAM_PORTA_0_clk),
        .d_0(BRAM_PORTA_0_din),
        .spo_0(),
        .we_0(BRAM_PORTA_0_we)*/
    );
    
    
    initial begin
        BRAM_PORTA_0_addr = 13'b0;
        BRAM_PORTA_0_clk = 1'b0;
        BRAM_PORTA_0_din = 32'b0;
        //BRAM_PORTA_0_dout = 1'b0;
        BRAM_PORTA_0_en = 1'b0;
        BRAM_PORTA_0_we = 1'b0;
        #10;
        BRAM_PORTA_0_din = 32'd5;
        BRAM_PORTA_0_en = 1'b1;
        BRAM_PORTA_0_we = 1'b1;
        #10;
        BRAM_PORTA_0_clk = 1'b1;
        #10;
        BRAM_PORTA_0_clk = 1'b0;
        #10;
        BRAM_PORTA_0_clk = 1'b1;
        #10;
        BRAM_PORTA_0_clk = 1'b0;
        BRAM_PORTA_0_we = 1'b0;
        #10;
        BRAM_PORTA_0_addr = 13'b1;
        #10;
        BRAM_PORTA_0_clk = 1'b1;
        #10;
        BRAM_PORTA_0_addr = 13'b0;
        #10;
        BRAM_PORTA_0_en = 1'b1;
        #10;
        BRAM_PORTA_0_clk = 1'b0;
        #10;
        BRAM_PORTA_0_clk = 1'b1;
    
    end
    
endmodule
