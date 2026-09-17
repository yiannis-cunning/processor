// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Sep 17 07:15:08 2026
// Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode funcsim
//               /home/cunningy/Desktop/gits/processor/fpga/design/blocks/design_v2/ip/design_v2_lmb_mux_0_0/design_v2_lmb_mux_0_0_sim_netlist.v
// Design      : design_v2_lmb_mux_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_v2_lmb_mux_0_0,lmb_mux,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "lmb_mux,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module design_v2_lmb_mux_0_0
   (clk_i,
    resetn_i,
    addr_i,
    wdata_i,
    rdata_o,
    wr_en_i,
    rd_en_i,
    wr_byte_en_i,
    dccm_addr_a_o,
    dccm_wdata_a_o,
    dccm_rdata_a_i,
    dccm_wr_en_a_o,
    dccm_rd_en_a_o,
    dccm_wr_byte_en_a_i,
    dccm_addr_b_o,
    dccm_wdata_b_o,
    dccm_rdata_b_i,
    dccm_wr_en_b_o,
    dccm_rd_en_b_o,
    dccm_wr_byte_en_b_i);
  input clk_i;
  input resetn_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT ABUS" *) input [31:0]addr_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITEDBUS" *) input [31:0]wdata_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT READDBUS" *) output [31:0]rdata_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITESTROBE" *) input wr_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT READSTROBE" *) input rd_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT BE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_LMB_PORT, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD" *) input [3:0]wr_byte_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A ABUS" *) output [31:0]dccm_addr_a_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A WRITEDBUS" *) output [31:0]dccm_wdata_a_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A READDBUS" *) input [31:0]dccm_rdata_a_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A WRITESTROBE" *) output dccm_wr_en_a_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A READSTROBE" *) output dccm_rd_en_a_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_A BE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_LMB_PORT_A, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD" *) output [3:0]dccm_wr_byte_en_a_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B ABUS" *) output [31:0]dccm_addr_b_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B WRITEDBUS" *) output [31:0]dccm_wdata_b_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B READDBUS" *) input [31:0]dccm_rdata_b_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B WRITESTROBE" *) output dccm_wr_en_b_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B READSTROBE" *) output dccm_rd_en_b_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 M_LMB_PORT_B BE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_LMB_PORT_B, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD" *) output [3:0]dccm_wr_byte_en_b_i;

  wire [31:0]addr_i;
  wire clk_i;
  wire [31:0]dccm_rdata_a_i;
  wire [31:0]dccm_rdata_b_i;
  wire rd_en_i;
  wire [31:0]rdata_o;
  wire resetn_i;
  wire [31:0]wdata_i;
  wire [3:0]wr_byte_en_i;
  wire wr_en_i;

  assign dccm_addr_a_o[31:0] = addr_i;
  assign dccm_addr_b_o[31:0] = addr_i;
  assign dccm_rd_en_a_o = rd_en_i;
  assign dccm_rd_en_b_o = rd_en_i;
  assign dccm_wdata_a_o[31:0] = wdata_i;
  assign dccm_wdata_b_o[31:0] = wdata_i;
  assign dccm_wr_byte_en_a_i[3:0] = wr_byte_en_i;
  assign dccm_wr_byte_en_b_i[3:0] = wr_byte_en_i;
  assign dccm_wr_en_a_o = wr_en_i;
  assign dccm_wr_en_b_o = wr_en_i;
  design_v2_lmb_mux_0_0_lmb_mux inst
       (.addr_i(addr_i[31:7]),
        .clk_i(clk_i),
        .dccm_rdata_a_i(dccm_rdata_a_i),
        .dccm_rdata_b_i(dccm_rdata_b_i),
        .rd_en_i(rd_en_i),
        .rdata_o(rdata_o),
        .resetn_i(resetn_i));
endmodule

(* ORIG_REF_NAME = "lmb_mux" *) 
module design_v2_lmb_mux_0_0_lmb_mux
   (rdata_o,
    rd_en_i,
    addr_i,
    clk_i,
    resetn_i,
    dccm_rdata_a_i,
    dccm_rdata_b_i);
  output [31:0]rdata_o;
  input rd_en_i;
  input [24:0]addr_i;
  input clk_i;
  input resetn_i;
  input [31:0]dccm_rdata_a_i;
  input [31:0]dccm_rdata_b_i;

  wire [24:0]addr_i;
  wire clk_i;
  wire [31:0]dccm_rdata_a_i;
  wire [31:0]dccm_rdata_b_i;
  wire [31:7]raddr_d1r;
  wire \raddr_d1r[31]_i_1_n_0 ;
  wire rd_en_i;
  wire [31:0]rdata_o;
  wire \rdata_o[31]_INST_0_i_1_n_0 ;
  wire \rdata_o[31]_INST_0_i_2_n_0 ;
  wire \rdata_o[31]_INST_0_i_3_n_0 ;
  wire \rdata_o[31]_INST_0_i_4_n_0 ;
  wire \rdata_o[31]_INST_0_i_5_n_0 ;
  wire \rdata_o[31]_INST_0_i_6_n_0 ;
  wire \rdata_o[31]_INST_0_i_7_n_0 ;
  wire resetn_i;

  LUT1 #(
    .INIT(2'h1)) 
    \raddr_d1r[31]_i_1 
       (.I0(resetn_i),
        .O(\raddr_d1r[31]_i_1_n_0 ));
  FDCE \raddr_d1r_reg[10] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[3]),
        .Q(raddr_d1r[10]));
  FDCE \raddr_d1r_reg[11] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[4]),
        .Q(raddr_d1r[11]));
  FDCE \raddr_d1r_reg[12] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[5]),
        .Q(raddr_d1r[12]));
  FDCE \raddr_d1r_reg[13] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[6]),
        .Q(raddr_d1r[13]));
  FDCE \raddr_d1r_reg[14] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[7]),
        .Q(raddr_d1r[14]));
  FDCE \raddr_d1r_reg[15] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[8]),
        .Q(raddr_d1r[15]));
  FDCE \raddr_d1r_reg[16] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[9]),
        .Q(raddr_d1r[16]));
  FDCE \raddr_d1r_reg[17] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[10]),
        .Q(raddr_d1r[17]));
  FDCE \raddr_d1r_reg[18] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[11]),
        .Q(raddr_d1r[18]));
  FDCE \raddr_d1r_reg[19] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[12]),
        .Q(raddr_d1r[19]));
  FDCE \raddr_d1r_reg[20] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[13]),
        .Q(raddr_d1r[20]));
  FDCE \raddr_d1r_reg[21] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[14]),
        .Q(raddr_d1r[21]));
  FDCE \raddr_d1r_reg[22] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[15]),
        .Q(raddr_d1r[22]));
  FDCE \raddr_d1r_reg[23] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[16]),
        .Q(raddr_d1r[23]));
  FDCE \raddr_d1r_reg[24] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[17]),
        .Q(raddr_d1r[24]));
  FDCE \raddr_d1r_reg[25] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[18]),
        .Q(raddr_d1r[25]));
  FDCE \raddr_d1r_reg[26] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[19]),
        .Q(raddr_d1r[26]));
  FDCE \raddr_d1r_reg[27] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[20]),
        .Q(raddr_d1r[27]));
  FDCE \raddr_d1r_reg[28] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[21]),
        .Q(raddr_d1r[28]));
  FDCE \raddr_d1r_reg[29] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[22]),
        .Q(raddr_d1r[29]));
  FDCE \raddr_d1r_reg[30] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[23]),
        .Q(raddr_d1r[30]));
  FDCE \raddr_d1r_reg[31] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[24]),
        .Q(raddr_d1r[31]));
  FDCE \raddr_d1r_reg[7] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[0]),
        .Q(raddr_d1r[7]));
  FDCE \raddr_d1r_reg[8] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[1]),
        .Q(raddr_d1r[8]));
  FDCE \raddr_d1r_reg[9] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\raddr_d1r[31]_i_1_n_0 ),
        .D(addr_i[2]),
        .Q(raddr_d1r[9]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[0]_INST_0 
       (.I0(dccm_rdata_a_i[0]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[0]),
        .O(rdata_o[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[10]_INST_0 
       (.I0(dccm_rdata_a_i[10]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[10]),
        .O(rdata_o[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[11]_INST_0 
       (.I0(dccm_rdata_a_i[11]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[11]),
        .O(rdata_o[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[12]_INST_0 
       (.I0(dccm_rdata_a_i[12]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[12]),
        .O(rdata_o[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[13]_INST_0 
       (.I0(dccm_rdata_a_i[13]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[13]),
        .O(rdata_o[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[14]_INST_0 
       (.I0(dccm_rdata_a_i[14]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[14]),
        .O(rdata_o[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[15]_INST_0 
       (.I0(dccm_rdata_a_i[15]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[15]),
        .O(rdata_o[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[16]_INST_0 
       (.I0(dccm_rdata_a_i[16]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[16]),
        .O(rdata_o[16]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[17]_INST_0 
       (.I0(dccm_rdata_a_i[17]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[17]),
        .O(rdata_o[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[18]_INST_0 
       (.I0(dccm_rdata_a_i[18]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[18]),
        .O(rdata_o[18]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[19]_INST_0 
       (.I0(dccm_rdata_a_i[19]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[19]),
        .O(rdata_o[19]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[1]_INST_0 
       (.I0(dccm_rdata_a_i[1]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[1]),
        .O(rdata_o[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[20]_INST_0 
       (.I0(dccm_rdata_a_i[20]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[20]),
        .O(rdata_o[20]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[21]_INST_0 
       (.I0(dccm_rdata_a_i[21]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[21]),
        .O(rdata_o[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[22]_INST_0 
       (.I0(dccm_rdata_a_i[22]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[22]),
        .O(rdata_o[22]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[23]_INST_0 
       (.I0(dccm_rdata_a_i[23]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[23]),
        .O(rdata_o[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[24]_INST_0 
       (.I0(dccm_rdata_a_i[24]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[24]),
        .O(rdata_o[24]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[25]_INST_0 
       (.I0(dccm_rdata_a_i[25]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[25]),
        .O(rdata_o[25]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[26]_INST_0 
       (.I0(dccm_rdata_a_i[26]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[26]),
        .O(rdata_o[26]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[27]_INST_0 
       (.I0(dccm_rdata_a_i[27]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[27]),
        .O(rdata_o[27]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[28]_INST_0 
       (.I0(dccm_rdata_a_i[28]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[28]),
        .O(rdata_o[28]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[29]_INST_0 
       (.I0(dccm_rdata_a_i[29]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[29]),
        .O(rdata_o[29]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[2]_INST_0 
       (.I0(dccm_rdata_a_i[2]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[2]),
        .O(rdata_o[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[30]_INST_0 
       (.I0(dccm_rdata_a_i[30]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[30]),
        .O(rdata_o[30]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[31]_INST_0 
       (.I0(dccm_rdata_a_i[31]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[31]),
        .O(rdata_o[31]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \rdata_o[31]_INST_0_i_1 
       (.I0(\rdata_o[31]_INST_0_i_2_n_0 ),
        .I1(\rdata_o[31]_INST_0_i_3_n_0 ),
        .I2(\rdata_o[31]_INST_0_i_4_n_0 ),
        .I3(\rdata_o[31]_INST_0_i_5_n_0 ),
        .I4(\rdata_o[31]_INST_0_i_6_n_0 ),
        .I5(\rdata_o[31]_INST_0_i_7_n_0 ),
        .O(\rdata_o[31]_INST_0_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rdata_o[31]_INST_0_i_2 
       (.I0(raddr_d1r[23]),
        .I1(raddr_d1r[22]),
        .I2(raddr_d1r[25]),
        .I3(raddr_d1r[24]),
        .O(\rdata_o[31]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rdata_o[31]_INST_0_i_3 
       (.I0(raddr_d1r[27]),
        .I1(raddr_d1r[26]),
        .I2(raddr_d1r[29]),
        .I3(raddr_d1r[28]),
        .O(\rdata_o[31]_INST_0_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \rdata_o[31]_INST_0_i_4 
       (.I0(raddr_d1r[15]),
        .I1(raddr_d1r[14]),
        .I2(raddr_d1r[16]),
        .I3(raddr_d1r[17]),
        .O(\rdata_o[31]_INST_0_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rdata_o[31]_INST_0_i_5 
       (.I0(raddr_d1r[19]),
        .I1(raddr_d1r[18]),
        .I2(raddr_d1r[21]),
        .I3(raddr_d1r[20]),
        .O(\rdata_o[31]_INST_0_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \rdata_o[31]_INST_0_i_6 
       (.I0(raddr_d1r[11]),
        .I1(raddr_d1r[10]),
        .I2(raddr_d1r[13]),
        .I3(raddr_d1r[12]),
        .O(\rdata_o[31]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \rdata_o[31]_INST_0_i_7 
       (.I0(raddr_d1r[7]),
        .I1(raddr_d1r[30]),
        .I2(raddr_d1r[31]),
        .I3(raddr_d1r[9]),
        .I4(raddr_d1r[8]),
        .O(\rdata_o[31]_INST_0_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[3]_INST_0 
       (.I0(dccm_rdata_a_i[3]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[3]),
        .O(rdata_o[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[4]_INST_0 
       (.I0(dccm_rdata_a_i[4]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[4]),
        .O(rdata_o[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[5]_INST_0 
       (.I0(dccm_rdata_a_i[5]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[5]),
        .O(rdata_o[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[6]_INST_0 
       (.I0(dccm_rdata_a_i[6]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[6]),
        .O(rdata_o[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[7]_INST_0 
       (.I0(dccm_rdata_a_i[7]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[7]),
        .O(rdata_o[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[8]_INST_0 
       (.I0(dccm_rdata_a_i[8]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[8]),
        .O(rdata_o[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \rdata_o[9]_INST_0 
       (.I0(dccm_rdata_a_i[9]),
        .I1(\rdata_o[31]_INST_0_i_1_n_0 ),
        .I2(dccm_rdata_b_i[9]),
        .O(rdata_o[9]));
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
