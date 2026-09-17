// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Sep 17 06:42:35 2026
// Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode synth_stub
//               /home/cunningy/Desktop/gits/processor/fpga/design/blocks/design_v2/ip/design_v2_bram_prim_1_0/design_v2_bram_prim_1_0_stub.v
// Design      : design_v2_bram_prim_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bram_prim,Vivado 2023.2" *)
module design_v2_bram_prim_1_0(en_i, rdata_o, wdata_i, byte_wr_en_i, addr_i, 
  clk_i)
/* synthesis syn_black_box black_box_pad_pin="en_i,rdata_o[31:0],wdata_i[31:0],byte_wr_en_i[3:0],addr_i[12:0]" */
/* synthesis syn_force_seq_prim="clk_i" */;
  input en_i;
  output [31:0]rdata_o;
  input [31:0]wdata_i;
  input [3:0]byte_wr_en_i;
  input [12:0]addr_i;
  input clk_i /* synthesis syn_isclock = 1 */;
endmodule
