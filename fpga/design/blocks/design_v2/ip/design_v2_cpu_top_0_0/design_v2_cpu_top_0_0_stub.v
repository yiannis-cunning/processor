// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Sep 17 05:37:11 2026
// Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode synth_stub
//               /home/cunningy/Desktop/gits/processor/fpga/design/blocks/design_v2/ip/design_v2_cpu_top_0_0/design_v2_cpu_top_0_0_stub.v
// Design      : design_v2_cpu_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "cpu_top,Vivado 2023.2" *)
module design_v2_cpu_top_0_0(resetn_i, clk_i, run_req_i, done_state, 
  iccm_word_raddr_o, iccm_wdata_o, iccm_data_i, iccm_wr_en_o, iccm_rd_en_o, 
  iccm_wr_byte_en_i, dccm_addr_o, dccm_wdata_o, dccm_rdata_i, dccm_wr_en_o, dccm_rd_en_o, 
  dccm_wr_byte_en_i)
/* synthesis syn_black_box black_box_pad_pin="resetn_i,run_req_i,done_state,iccm_word_raddr_o[31:0],iccm_wdata_o[31:0],iccm_data_i[31:0],iccm_wr_en_o,iccm_rd_en_o,iccm_wr_byte_en_i[3:0],dccm_addr_o[31:0],dccm_wdata_o[31:0],dccm_rdata_i[31:0],dccm_wr_en_o,dccm_rd_en_o,dccm_wr_byte_en_i[3:0]" */
/* synthesis syn_force_seq_prim="clk_i" */;
  input resetn_i;
  input clk_i /* synthesis syn_isclock = 1 */;
  input run_req_i;
  output done_state;
  output [31:0]iccm_word_raddr_o;
  output [31:0]iccm_wdata_o;
  input [31:0]iccm_data_i;
  output iccm_wr_en_o;
  output iccm_rd_en_o;
  output [3:0]iccm_wr_byte_en_i;
  output [31:0]dccm_addr_o;
  output [31:0]dccm_wdata_o;
  input [31:0]dccm_rdata_i;
  output dccm_wr_en_o;
  output dccm_rd_en_o;
  output [3:0]dccm_wr_byte_en_i;
endmodule
