// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Sep 17 07:15:07 2026
// Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode synth_stub
//               /home/cunningy/Desktop/gits/processor/fpga/design/blocks/design_v2/ip/design_v2_lmb_mux_0_0/design_v2_lmb_mux_0_0_stub.v
// Design      : design_v2_lmb_mux_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "lmb_mux,Vivado 2023.2" *)
module design_v2_lmb_mux_0_0(clk_i, resetn_i, addr_i, wdata_i, rdata_o, wr_en_i, 
  rd_en_i, wr_byte_en_i, dccm_addr_a_o, dccm_wdata_a_o, dccm_rdata_a_i, dccm_wr_en_a_o, 
  dccm_rd_en_a_o, dccm_wr_byte_en_a_i, dccm_addr_b_o, dccm_wdata_b_o, dccm_rdata_b_i, 
  dccm_wr_en_b_o, dccm_rd_en_b_o, dccm_wr_byte_en_b_i)
/* synthesis syn_black_box black_box_pad_pin="resetn_i,addr_i[31:0],wdata_i[31:0],rdata_o[31:0],wr_en_i,rd_en_i,wr_byte_en_i[3:0],dccm_addr_a_o[31:0],dccm_wdata_a_o[31:0],dccm_rdata_a_i[31:0],dccm_wr_en_a_o,dccm_rd_en_a_o,dccm_wr_byte_en_a_i[3:0],dccm_addr_b_o[31:0],dccm_wdata_b_o[31:0],dccm_rdata_b_i[31:0],dccm_wr_en_b_o,dccm_rd_en_b_o,dccm_wr_byte_en_b_i[3:0]" */
/* synthesis syn_force_seq_prim="clk_i" */;
  input clk_i /* synthesis syn_isclock = 1 */;
  input resetn_i;
  input [31:0]addr_i;
  input [31:0]wdata_i;
  output [31:0]rdata_o;
  input wr_en_i;
  input rd_en_i;
  input [3:0]wr_byte_en_i;
  output [31:0]dccm_addr_a_o;
  output [31:0]dccm_wdata_a_o;
  input [31:0]dccm_rdata_a_i;
  output dccm_wr_en_a_o;
  output dccm_rd_en_a_o;
  output [3:0]dccm_wr_byte_en_a_i;
  output [31:0]dccm_addr_b_o;
  output [31:0]dccm_wdata_b_o;
  input [31:0]dccm_rdata_b_i;
  output dccm_wr_en_b_o;
  output dccm_rd_en_b_o;
  output [3:0]dccm_wr_byte_en_b_i;
endmodule
