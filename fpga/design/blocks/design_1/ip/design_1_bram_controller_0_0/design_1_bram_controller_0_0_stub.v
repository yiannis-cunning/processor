// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Sep 17 00:48:23 2026
// Host        : Yiannis-XPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/yiann/Desktop/gits/processor/fpga/design/blocks/design_1/ip/design_1_bram_controller_0_0/design_1_bram_controller_0_0_stub.v
// Design      : design_1_bram_controller_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bram_controller,Vivado 2023.2" *)
module design_1_bram_controller_0_0(clk_i, resetn_i, addr_i, wdata_i, rdata_o, wr_en_i, 
  rd_en_i, wr_byte_en_i, bram_en_o, bram_rdata_i, bram_wdata_o, bram_byte_wr_en_o, bram_addr_o, 
  bram_clk_o)
/* synthesis syn_black_box black_box_pad_pin="resetn_i,addr_i[31:0],wdata_i[31:0],rdata_o[31:0],wr_en_i,rd_en_i,wr_byte_en_i[3:0],bram_en_o,bram_rdata_i[31:0],bram_wdata_o[31:0],bram_byte_wr_en_o[3:0],bram_addr_o[12:0]" */
/* synthesis syn_force_seq_prim="clk_i" */
/* synthesis syn_force_seq_prim="bram_clk_o" */;
  input clk_i /* synthesis syn_isclock = 1 */;
  input resetn_i;
  input [31:0]addr_i;
  input [31:0]wdata_i;
  output [31:0]rdata_o;
  input wr_en_i;
  input rd_en_i;
  input [3:0]wr_byte_en_i;
  output bram_en_o;
  input [31:0]bram_rdata_i;
  output [31:0]bram_wdata_o;
  output [3:0]bram_byte_wr_en_o;
  output [12:0]bram_addr_o;
  output bram_clk_o /* synthesis syn_isclock = 1 */;
endmodule
