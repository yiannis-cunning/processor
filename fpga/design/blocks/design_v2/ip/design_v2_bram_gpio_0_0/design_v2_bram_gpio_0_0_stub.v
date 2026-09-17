// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Sep 17 05:44:08 2026
// Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode synth_stub
//               /home/cunningy/Desktop/gits/processor/fpga/design/blocks/design_v2/ip/design_v2_bram_gpio_0_0/design_v2_bram_gpio_0_0_stub.v
// Design      : design_v2_bram_gpio_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bram_gpio,Vivado 2023.2" *)
module design_v2_bram_gpio_0_0(clk_i, resetn_i, bram_en_i, bram_rdata_o, 
  bram_wdata_i, bram_byte_wr_en_i, bram_addr_i, bram_clk_i, gpio_i, gpio_o)
/* synthesis syn_black_box black_box_pad_pin="resetn_i,bram_en_i,bram_rdata_o[31:0],bram_wdata_i[31:0],bram_byte_wr_en_i[3:0],bram_addr_i[4:0],bram_clk_i,gpio_i[31:0],gpio_o[31:0]" */
/* synthesis syn_force_seq_prim="clk_i" */;
  input clk_i /* synthesis syn_isclock = 1 */;
  input resetn_i;
  input bram_en_i;
  output [31:0]bram_rdata_o;
  input [31:0]bram_wdata_i;
  input [3:0]bram_byte_wr_en_i;
  input [4:0]bram_addr_i;
  input bram_clk_i;
  input [31:0]gpio_i;
  output [31:0]gpio_o;
endmodule
