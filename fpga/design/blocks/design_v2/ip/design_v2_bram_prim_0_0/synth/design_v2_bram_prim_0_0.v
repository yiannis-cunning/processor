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


// IP VLNV: xilinx.com:module_ref:bram_prim:1.0
// IP Revision: 1

(* X_CORE_INFO = "bram_prim,Vivado 2023.2" *)
(* CHECK_LICENSE_TYPE = "design_v2_bram_prim_0_0,bram_prim,{}" *)
(* CORE_GENERATION_INFO = "design_v2_bram_prim_0_0,bram_prim,{x_ipProduct=Vivado 2023.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=bram_prim,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,DATA_WIDTH=32,ADDR_WIDTH=13,MEM_INIT_FILENAME=iccm.hex}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_v2_bram_prim_0_0 (
  en_i,
  rdata_o,
  wdata_i,
  byte_wr_en_i,
  addr_i,
  clk_i
);

(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A EN" *)
input wire en_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *)
output wire [31 : 0] rdata_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DIN" *)
input wire [31 : 0] wdata_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A WE" *)
input wire [3 : 0] byte_wr_en_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A ADDR" *)
input wire [12 : 0] addr_i;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORT_A, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A CLK" *)
input wire clk_i;

  bram_prim #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(13),
    .MEM_INIT_FILENAME("iccm.hex")
  ) inst (
    .en_i(en_i),
    .rdata_o(rdata_o),
    .wdata_i(wdata_i),
    .byte_wr_en_i(byte_wr_en_i),
    .addr_i(addr_i),
    .clk_i(clk_i)
  );
endmodule
