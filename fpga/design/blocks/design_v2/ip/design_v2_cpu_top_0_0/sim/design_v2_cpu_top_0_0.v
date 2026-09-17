// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:cpu_top:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_v2_cpu_top_0_0 (
  resetn_i,
  clk_i,
  run_req_i,
  done_state,
  iccm_word_raddr_o,
  iccm_wdata_o,
  iccm_data_i,
  iccm_wr_en_o,
  iccm_rd_en_o,
  iccm_wr_byte_en_i,
  dccm_addr_o,
  dccm_wdata_o,
  dccm_rdata_i,
  dccm_wr_en_o,
  dccm_rd_en_o,
  dccm_wr_byte_en_i
);

input wire resetn_i;
input wire clk_i;
input wire run_req_i;
output wire done_state;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M ABUS" *)
output wire [31 : 0] iccm_word_raddr_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M WRITEDBUS" *)
output wire [31 : 0] iccm_wdata_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M READDBUS" *)
input wire [31 : 0] iccm_data_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M WRITESTROBE" *)
output wire iccm_wr_en_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M READSTROBE" *)
output wire iccm_rd_en_o;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ICCM_LMB_M, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 ICCM_LMB_M BE" *)
output wire [3 : 0] iccm_wr_byte_en_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M ABUS" *)
output wire [31 : 0] dccm_addr_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M WRITEDBUS" *)
output wire [31 : 0] dccm_wdata_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M READDBUS" *)
input wire [31 : 0] dccm_rdata_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M WRITESTROBE" *)
output wire dccm_wr_en_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M READSTROBE" *)
output wire dccm_rd_en_o;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DCCM_LMB_M, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 DCCM_LMB_M BE" *)
output wire [3 : 0] dccm_wr_byte_en_i;

  cpu_top inst (
    .resetn_i(resetn_i),
    .clk_i(clk_i),
    .run_req_i(run_req_i),
    .done_state(done_state),
    .iccm_word_raddr_o(iccm_word_raddr_o),
    .iccm_wdata_o(iccm_wdata_o),
    .iccm_data_i(iccm_data_i),
    .iccm_wr_en_o(iccm_wr_en_o),
    .iccm_rd_en_o(iccm_rd_en_o),
    .iccm_wr_byte_en_i(iccm_wr_byte_en_i),
    .dccm_addr_o(dccm_addr_o),
    .dccm_wdata_o(dccm_wdata_o),
    .dccm_rdata_i(dccm_rdata_i),
    .dccm_wr_en_o(dccm_wr_en_o),
    .dccm_rd_en_o(dccm_rd_en_o),
    .dccm_wr_byte_en_i(dccm_wr_byte_en_i)
  );
endmodule
