// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Sep 17 05:44:09 2026
// Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode funcsim
//               /home/cunningy/Desktop/gits/processor/fpga/design/blocks/design_v2/ip/design_v2_bram_gpio_0_0/design_v2_bram_gpio_0_0_sim_netlist.v
// Design      : design_v2_bram_gpio_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_v2_bram_gpio_0_0,bram_gpio,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "bram_gpio,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module design_v2_bram_gpio_0_0
   (clk_i,
    resetn_i,
    bram_en_i,
    bram_rdata_o,
    bram_wdata_i,
    bram_byte_wr_en_i,
    bram_addr_i,
    bram_clk_i,
    gpio_i,
    gpio_o);
  input clk_i;
  input resetn_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A EN" *) input bram_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) output [31:0]bram_rdata_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DIN" *) input [31:0]bram_wdata_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A WE" *) input [3:0]bram_byte_wr_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A ADDR" *) input [4:0]bram_addr_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORT_A, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input bram_clk_i;
  input [31:0]gpio_i;
  output [31:0]gpio_o;

  wire [4:0]bram_addr_i;
  wire [3:0]bram_byte_wr_en_i;
  wire bram_en_i;
  wire [31:0]bram_rdata_o;
  wire [31:0]bram_wdata_i;
  wire clk_i;
  wire [31:0]gpio_i;
  wire [31:0]gpio_o;
  wire resetn_i;

  design_v2_bram_gpio_0_0_bram_gpio inst
       (.bram_addr_i(bram_addr_i),
        .bram_byte_wr_en_i(bram_byte_wr_en_i),
        .bram_en_i(bram_en_i),
        .bram_rdata_o(bram_rdata_o),
        .bram_wdata_i(bram_wdata_i),
        .clk_i(clk_i),
        .gpio_i(gpio_i),
        .gpio_o(gpio_o),
        .resetn_i(resetn_i));
endmodule

(* ORIG_REF_NAME = "bram_gpio" *) 
module design_v2_bram_gpio_0_0_bram_gpio
   (bram_rdata_o,
    gpio_o,
    gpio_i,
    clk_i,
    bram_wdata_i,
    bram_byte_wr_en_i,
    bram_en_i,
    bram_addr_i,
    resetn_i);
  output [31:0]bram_rdata_o;
  output [31:0]gpio_o;
  input [31:0]gpio_i;
  input clk_i;
  input [31:0]bram_wdata_i;
  input [3:0]bram_byte_wr_en_i;
  input bram_en_i;
  input [4:0]bram_addr_i;
  input resetn_i;

  wire [4:0]bram_addr_i;
  wire [3:0]bram_byte_wr_en_i;
  wire bram_en_i;
  wire [31:0]bram_rdata_o;
  wire \bram_rdata_o[31]_i_1_n_0 ;
  wire \bram_rdata_o[31]_i_2_n_0 ;
  wire [31:0]bram_wdata_i;
  wire clk_i;
  wire [31:0]gpio_i;
  wire [31:0]gpio_o;
  wire [31:7]p_0_in;
  wire resetn_i;

  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \bram_rdata_o[31]_i_1 
       (.I0(bram_en_i),
        .I1(bram_addr_i[2]),
        .I2(bram_addr_i[4]),
        .I3(bram_addr_i[0]),
        .I4(bram_addr_i[1]),
        .I5(bram_addr_i[3]),
        .O(\bram_rdata_o[31]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \bram_rdata_o[31]_i_2 
       (.I0(resetn_i),
        .O(\bram_rdata_o[31]_i_2_n_0 ));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[0] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[0]),
        .Q(bram_rdata_o[0]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[10] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[10]),
        .Q(bram_rdata_o[10]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[11] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[11]),
        .Q(bram_rdata_o[11]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[12] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[12]),
        .Q(bram_rdata_o[12]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[13] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[13]),
        .Q(bram_rdata_o[13]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[14] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[14]),
        .Q(bram_rdata_o[14]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[15] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[15]),
        .Q(bram_rdata_o[15]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[16] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[16]),
        .Q(bram_rdata_o[16]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[17] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[17]),
        .Q(bram_rdata_o[17]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[18] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[18]),
        .Q(bram_rdata_o[18]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[19] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[19]),
        .Q(bram_rdata_o[19]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[1] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[1]),
        .Q(bram_rdata_o[1]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[20] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[20]),
        .Q(bram_rdata_o[20]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[21] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[21]),
        .Q(bram_rdata_o[21]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[22] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[22]),
        .Q(bram_rdata_o[22]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[23] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[23]),
        .Q(bram_rdata_o[23]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[24] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[24]),
        .Q(bram_rdata_o[24]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[25] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[25]),
        .Q(bram_rdata_o[25]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[26] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[26]),
        .Q(bram_rdata_o[26]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[27] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[27]),
        .Q(bram_rdata_o[27]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[28] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[28]),
        .Q(bram_rdata_o[28]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[29] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[29]),
        .Q(bram_rdata_o[29]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[2] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[2]),
        .Q(bram_rdata_o[2]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[30] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[30]),
        .Q(bram_rdata_o[30]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[31] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[31]),
        .Q(bram_rdata_o[31]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[3] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[3]),
        .Q(bram_rdata_o[3]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[4] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[4]),
        .Q(bram_rdata_o[4]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[5] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[5]),
        .Q(bram_rdata_o[5]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[6] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[6]),
        .Q(bram_rdata_o[6]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[7] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[7]),
        .Q(bram_rdata_o[7]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[8] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[8]),
        .Q(bram_rdata_o[8]));
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) 
  FDCE \bram_rdata_o_reg[9] 
       (.C(clk_i),
        .CE(\bram_rdata_o[31]_i_1_n_0 ),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(gpio_i[9]),
        .Q(bram_rdata_o[9]));
  LUT2 #(
    .INIT(4'h8)) 
    \gpio_o[15]_i_1 
       (.I0(\bram_rdata_o[31]_i_1_n_0 ),
        .I1(bram_byte_wr_en_i[1]),
        .O(p_0_in[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \gpio_o[23]_i_1 
       (.I0(\bram_rdata_o[31]_i_1_n_0 ),
        .I1(bram_byte_wr_en_i[2]),
        .O(p_0_in[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \gpio_o[31]_i_1 
       (.I0(\bram_rdata_o[31]_i_1_n_0 ),
        .I1(bram_byte_wr_en_i[3]),
        .O(p_0_in[31]));
  LUT2 #(
    .INIT(4'h8)) 
    \gpio_o[7]_i_1 
       (.I0(\bram_rdata_o[31]_i_1_n_0 ),
        .I1(bram_byte_wr_en_i[0]),
        .O(p_0_in[7]));
  FDCE \gpio_o_reg[0] 
       (.C(clk_i),
        .CE(p_0_in[7]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[0]),
        .Q(gpio_o[0]));
  FDCE \gpio_o_reg[10] 
       (.C(clk_i),
        .CE(p_0_in[15]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[10]),
        .Q(gpio_o[10]));
  FDCE \gpio_o_reg[11] 
       (.C(clk_i),
        .CE(p_0_in[15]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[11]),
        .Q(gpio_o[11]));
  FDCE \gpio_o_reg[12] 
       (.C(clk_i),
        .CE(p_0_in[15]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[12]),
        .Q(gpio_o[12]));
  FDCE \gpio_o_reg[13] 
       (.C(clk_i),
        .CE(p_0_in[15]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[13]),
        .Q(gpio_o[13]));
  FDCE \gpio_o_reg[14] 
       (.C(clk_i),
        .CE(p_0_in[15]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[14]),
        .Q(gpio_o[14]));
  FDCE \gpio_o_reg[15] 
       (.C(clk_i),
        .CE(p_0_in[15]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[15]),
        .Q(gpio_o[15]));
  FDCE \gpio_o_reg[16] 
       (.C(clk_i),
        .CE(p_0_in[23]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[16]),
        .Q(gpio_o[16]));
  FDCE \gpio_o_reg[17] 
       (.C(clk_i),
        .CE(p_0_in[23]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[17]),
        .Q(gpio_o[17]));
  FDCE \gpio_o_reg[18] 
       (.C(clk_i),
        .CE(p_0_in[23]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[18]),
        .Q(gpio_o[18]));
  FDCE \gpio_o_reg[19] 
       (.C(clk_i),
        .CE(p_0_in[23]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[19]),
        .Q(gpio_o[19]));
  FDCE \gpio_o_reg[1] 
       (.C(clk_i),
        .CE(p_0_in[7]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[1]),
        .Q(gpio_o[1]));
  FDCE \gpio_o_reg[20] 
       (.C(clk_i),
        .CE(p_0_in[23]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[20]),
        .Q(gpio_o[20]));
  FDCE \gpio_o_reg[21] 
       (.C(clk_i),
        .CE(p_0_in[23]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[21]),
        .Q(gpio_o[21]));
  FDCE \gpio_o_reg[22] 
       (.C(clk_i),
        .CE(p_0_in[23]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[22]),
        .Q(gpio_o[22]));
  FDCE \gpio_o_reg[23] 
       (.C(clk_i),
        .CE(p_0_in[23]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[23]),
        .Q(gpio_o[23]));
  FDCE \gpio_o_reg[24] 
       (.C(clk_i),
        .CE(p_0_in[31]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[24]),
        .Q(gpio_o[24]));
  FDCE \gpio_o_reg[25] 
       (.C(clk_i),
        .CE(p_0_in[31]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[25]),
        .Q(gpio_o[25]));
  FDCE \gpio_o_reg[26] 
       (.C(clk_i),
        .CE(p_0_in[31]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[26]),
        .Q(gpio_o[26]));
  FDCE \gpio_o_reg[27] 
       (.C(clk_i),
        .CE(p_0_in[31]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[27]),
        .Q(gpio_o[27]));
  FDCE \gpio_o_reg[28] 
       (.C(clk_i),
        .CE(p_0_in[31]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[28]),
        .Q(gpio_o[28]));
  FDCE \gpio_o_reg[29] 
       (.C(clk_i),
        .CE(p_0_in[31]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[29]),
        .Q(gpio_o[29]));
  FDCE \gpio_o_reg[2] 
       (.C(clk_i),
        .CE(p_0_in[7]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[2]),
        .Q(gpio_o[2]));
  FDCE \gpio_o_reg[30] 
       (.C(clk_i),
        .CE(p_0_in[31]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[30]),
        .Q(gpio_o[30]));
  FDCE \gpio_o_reg[31] 
       (.C(clk_i),
        .CE(p_0_in[31]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[31]),
        .Q(gpio_o[31]));
  FDCE \gpio_o_reg[3] 
       (.C(clk_i),
        .CE(p_0_in[7]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[3]),
        .Q(gpio_o[3]));
  FDCE \gpio_o_reg[4] 
       (.C(clk_i),
        .CE(p_0_in[7]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[4]),
        .Q(gpio_o[4]));
  FDCE \gpio_o_reg[5] 
       (.C(clk_i),
        .CE(p_0_in[7]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[5]),
        .Q(gpio_o[5]));
  FDCE \gpio_o_reg[6] 
       (.C(clk_i),
        .CE(p_0_in[7]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[6]),
        .Q(gpio_o[6]));
  FDCE \gpio_o_reg[7] 
       (.C(clk_i),
        .CE(p_0_in[7]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[7]),
        .Q(gpio_o[7]));
  FDCE \gpio_o_reg[8] 
       (.C(clk_i),
        .CE(p_0_in[15]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[8]),
        .Q(gpio_o[8]));
  FDCE \gpio_o_reg[9] 
       (.C(clk_i),
        .CE(p_0_in[15]),
        .CLR(\bram_rdata_o[31]_i_2_n_0 ),
        .D(bram_wdata_i[9]),
        .Q(gpio_o[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
