// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Sep 14 04:19:44 2026
// Host        : Yiannis-XPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/yiann/Desktop/gits/processor/fpga/design/blocks/design_1/ip/design_1_bram_controller_1_0/design_1_bram_controller_1_0_sim_netlist.v
// Design      : design_1_bram_controller_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_bram_controller_1_0,bram_controller,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "bram_controller,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module design_1_bram_controller_1_0
   (clk_i,
    resetn_i,
    addr_i,
    wdata_i,
    rdata_o,
    wr_en_i,
    rd_en_i,
    wr_byte_en_i,
    bram_en_o,
    bram_rdata_i,
    bram_wdata_o,
    bram_byte_wr_en_o,
    bram_addr_o,
    bram_clk_o);
  input clk_i;
  input resetn_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT ABUS" *) input [31:0]addr_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITEDBUS" *) input [31:0]wdata_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT READDBUS" *) output [31:0]rdata_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT WRITESTROBE" *) input wr_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT READSTROBE" *) input rd_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:lmb:1.0 S_LMB_PORT BE" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_LMB_PORT, ADDR_WIDTH 32, DATA_WIDTH 32, READ_WRITE_MODE READ_WRITE, PROTOCOL STANDARD" *) input [3:0]wr_byte_en_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A EN" *) output bram_en_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DOUT" *) input [31:0]bram_rdata_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A DIN" *) output [31:0]bram_wdata_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A WE" *) output [3:0]bram_byte_wr_en_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A ADDR" *) output [12:0]bram_addr_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 BRAM_PORT_A CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME BRAM_PORT_A, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output bram_clk_o;

  wire [31:0]addr_i;
  wire [12:8]\^bram_addr_o ;
  wire [3:0]bram_byte_wr_en_o;
  wire \bram_byte_wr_en_o[3]_INST_0_i_1_n_0 ;
  wire bram_en_o;
  wire [31:0]bram_rdata_i;
  wire [31:0]bram_wdata_o;
  wire clk_i;
  wire rd_en_i;
  wire [31:0]rdata_o;
  wire resetn_i;
  wire [31:0]wdata_i;
  wire [3:0]wr_byte_en_i;
  wire wr_en_i;

  assign bram_addr_o[12:8] = \^bram_addr_o [12:8];
  assign bram_addr_o[7:0] = addr_i[9:2];
  assign bram_clk_o = clk_i;
  LUT4 #(
    .INIT(16'h0400)) 
    \bram_byte_wr_en_o[0]_INST_0 
       (.I0(addr_i[0]),
        .I1(wr_byte_en_i[0]),
        .I2(addr_i[1]),
        .I3(wr_en_i),
        .O(bram_byte_wr_en_o[0]));
  LUT5 #(
    .INIT(32'h54040000)) 
    \bram_byte_wr_en_o[1]_INST_0 
       (.I0(addr_i[1]),
        .I1(wr_byte_en_i[1]),
        .I2(addr_i[0]),
        .I3(wr_byte_en_i[0]),
        .I4(wr_en_i),
        .O(bram_byte_wr_en_o[1]));
  LUT6 #(
    .INIT(64'h33E200E200000000)) 
    \bram_byte_wr_en_o[2]_INST_0 
       (.I0(wr_byte_en_i[2]),
        .I1(addr_i[1]),
        .I2(wr_byte_en_i[0]),
        .I3(addr_i[0]),
        .I4(wr_byte_en_i[1]),
        .I5(wr_en_i),
        .O(bram_byte_wr_en_o[2]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \bram_byte_wr_en_o[3]_INST_0 
       (.I0(wr_byte_en_i[3]),
        .I1(addr_i[1]),
        .I2(wr_byte_en_i[1]),
        .I3(addr_i[0]),
        .I4(\bram_byte_wr_en_o[3]_INST_0_i_1_n_0 ),
        .I5(wr_en_i),
        .O(bram_byte_wr_en_o[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \bram_byte_wr_en_o[3]_INST_0_i_1 
       (.I0(wr_byte_en_i[0]),
        .I1(addr_i[1]),
        .I2(wr_byte_en_i[2]),
        .O(\bram_byte_wr_en_o[3]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    bram_en_o_INST_0
       (.I0(wr_en_i),
        .I1(rd_en_i),
        .O(bram_en_o));
  LUT3 #(
    .INIT(8'h04)) 
    \bram_wdata_o[0]_INST_0 
       (.I0(addr_i[1]),
        .I1(wdata_i[0]),
        .I2(addr_i[0]),
        .O(bram_wdata_o[0]));
  LUT4 #(
    .INIT(16'h00B8)) 
    \bram_wdata_o[10]_INST_0 
       (.I0(wdata_i[2]),
        .I1(addr_i[0]),
        .I2(wdata_i[10]),
        .I3(addr_i[1]),
        .O(bram_wdata_o[10]));
  LUT4 #(
    .INIT(16'h00B8)) 
    \bram_wdata_o[11]_INST_0 
       (.I0(wdata_i[3]),
        .I1(addr_i[0]),
        .I2(wdata_i[11]),
        .I3(addr_i[1]),
        .O(bram_wdata_o[11]));
  LUT4 #(
    .INIT(16'h00B8)) 
    \bram_wdata_o[12]_INST_0 
       (.I0(wdata_i[4]),
        .I1(addr_i[0]),
        .I2(wdata_i[12]),
        .I3(addr_i[1]),
        .O(bram_wdata_o[12]));
  LUT4 #(
    .INIT(16'h00B8)) 
    \bram_wdata_o[13]_INST_0 
       (.I0(wdata_i[5]),
        .I1(addr_i[0]),
        .I2(wdata_i[13]),
        .I3(addr_i[1]),
        .O(bram_wdata_o[13]));
  LUT4 #(
    .INIT(16'h00B8)) 
    \bram_wdata_o[14]_INST_0 
       (.I0(wdata_i[6]),
        .I1(addr_i[0]),
        .I2(wdata_i[14]),
        .I3(addr_i[1]),
        .O(bram_wdata_o[14]));
  LUT4 #(
    .INIT(16'h00B8)) 
    \bram_wdata_o[15]_INST_0 
       (.I0(wdata_i[7]),
        .I1(addr_i[0]),
        .I2(wdata_i[15]),
        .I3(addr_i[1]),
        .O(bram_wdata_o[15]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \bram_wdata_o[16]_INST_0 
       (.I0(wdata_i[8]),
        .I1(addr_i[0]),
        .I2(wdata_i[0]),
        .I3(addr_i[1]),
        .I4(wdata_i[16]),
        .O(bram_wdata_o[16]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \bram_wdata_o[17]_INST_0 
       (.I0(wdata_i[9]),
        .I1(addr_i[0]),
        .I2(wdata_i[1]),
        .I3(addr_i[1]),
        .I4(wdata_i[17]),
        .O(bram_wdata_o[17]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \bram_wdata_o[18]_INST_0 
       (.I0(wdata_i[10]),
        .I1(addr_i[0]),
        .I2(wdata_i[2]),
        .I3(addr_i[1]),
        .I4(wdata_i[18]),
        .O(bram_wdata_o[18]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \bram_wdata_o[19]_INST_0 
       (.I0(wdata_i[11]),
        .I1(addr_i[0]),
        .I2(wdata_i[3]),
        .I3(addr_i[1]),
        .I4(wdata_i[19]),
        .O(bram_wdata_o[19]));
  LUT3 #(
    .INIT(8'h04)) 
    \bram_wdata_o[1]_INST_0 
       (.I0(addr_i[1]),
        .I1(wdata_i[1]),
        .I2(addr_i[0]),
        .O(bram_wdata_o[1]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \bram_wdata_o[20]_INST_0 
       (.I0(wdata_i[12]),
        .I1(addr_i[0]),
        .I2(wdata_i[4]),
        .I3(addr_i[1]),
        .I4(wdata_i[20]),
        .O(bram_wdata_o[20]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \bram_wdata_o[21]_INST_0 
       (.I0(wdata_i[13]),
        .I1(addr_i[0]),
        .I2(wdata_i[5]),
        .I3(addr_i[1]),
        .I4(wdata_i[21]),
        .O(bram_wdata_o[21]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \bram_wdata_o[22]_INST_0 
       (.I0(wdata_i[14]),
        .I1(addr_i[0]),
        .I2(wdata_i[6]),
        .I3(addr_i[1]),
        .I4(wdata_i[22]),
        .O(bram_wdata_o[22]));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \bram_wdata_o[23]_INST_0 
       (.I0(wdata_i[15]),
        .I1(addr_i[0]),
        .I2(wdata_i[7]),
        .I3(addr_i[1]),
        .I4(wdata_i[23]),
        .O(bram_wdata_o[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \bram_wdata_o[24]_INST_0 
       (.I0(wdata_i[0]),
        .I1(wdata_i[16]),
        .I2(addr_i[0]),
        .I3(wdata_i[8]),
        .I4(addr_i[1]),
        .I5(wdata_i[24]),
        .O(bram_wdata_o[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \bram_wdata_o[25]_INST_0 
       (.I0(wdata_i[1]),
        .I1(wdata_i[17]),
        .I2(addr_i[0]),
        .I3(wdata_i[9]),
        .I4(addr_i[1]),
        .I5(wdata_i[25]),
        .O(bram_wdata_o[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \bram_wdata_o[26]_INST_0 
       (.I0(wdata_i[2]),
        .I1(wdata_i[18]),
        .I2(addr_i[0]),
        .I3(wdata_i[10]),
        .I4(addr_i[1]),
        .I5(wdata_i[26]),
        .O(bram_wdata_o[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \bram_wdata_o[27]_INST_0 
       (.I0(wdata_i[3]),
        .I1(wdata_i[19]),
        .I2(addr_i[0]),
        .I3(wdata_i[11]),
        .I4(addr_i[1]),
        .I5(wdata_i[27]),
        .O(bram_wdata_o[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \bram_wdata_o[28]_INST_0 
       (.I0(wdata_i[4]),
        .I1(wdata_i[20]),
        .I2(addr_i[0]),
        .I3(wdata_i[12]),
        .I4(addr_i[1]),
        .I5(wdata_i[28]),
        .O(bram_wdata_o[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \bram_wdata_o[29]_INST_0 
       (.I0(wdata_i[5]),
        .I1(wdata_i[21]),
        .I2(addr_i[0]),
        .I3(wdata_i[13]),
        .I4(addr_i[1]),
        .I5(wdata_i[29]),
        .O(bram_wdata_o[29]));
  LUT3 #(
    .INIT(8'h04)) 
    \bram_wdata_o[2]_INST_0 
       (.I0(addr_i[1]),
        .I1(wdata_i[2]),
        .I2(addr_i[0]),
        .O(bram_wdata_o[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \bram_wdata_o[30]_INST_0 
       (.I0(wdata_i[6]),
        .I1(wdata_i[22]),
        .I2(addr_i[0]),
        .I3(wdata_i[14]),
        .I4(addr_i[1]),
        .I5(wdata_i[30]),
        .O(bram_wdata_o[30]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \bram_wdata_o[31]_INST_0 
       (.I0(wdata_i[7]),
        .I1(wdata_i[23]),
        .I2(addr_i[0]),
        .I3(wdata_i[15]),
        .I4(addr_i[1]),
        .I5(wdata_i[31]),
        .O(bram_wdata_o[31]));
  LUT3 #(
    .INIT(8'h04)) 
    \bram_wdata_o[3]_INST_0 
       (.I0(addr_i[1]),
        .I1(wdata_i[3]),
        .I2(addr_i[0]),
        .O(bram_wdata_o[3]));
  LUT3 #(
    .INIT(8'h04)) 
    \bram_wdata_o[4]_INST_0 
       (.I0(addr_i[1]),
        .I1(wdata_i[4]),
        .I2(addr_i[0]),
        .O(bram_wdata_o[4]));
  LUT3 #(
    .INIT(8'h04)) 
    \bram_wdata_o[5]_INST_0 
       (.I0(addr_i[1]),
        .I1(wdata_i[5]),
        .I2(addr_i[0]),
        .O(bram_wdata_o[5]));
  LUT3 #(
    .INIT(8'h04)) 
    \bram_wdata_o[6]_INST_0 
       (.I0(addr_i[1]),
        .I1(wdata_i[6]),
        .I2(addr_i[0]),
        .O(bram_wdata_o[6]));
  LUT3 #(
    .INIT(8'h04)) 
    \bram_wdata_o[7]_INST_0 
       (.I0(addr_i[1]),
        .I1(wdata_i[7]),
        .I2(addr_i[0]),
        .O(bram_wdata_o[7]));
  LUT4 #(
    .INIT(16'h00B8)) 
    \bram_wdata_o[8]_INST_0 
       (.I0(wdata_i[0]),
        .I1(addr_i[0]),
        .I2(wdata_i[8]),
        .I3(addr_i[1]),
        .O(bram_wdata_o[8]));
  LUT4 #(
    .INIT(16'h00B8)) 
    \bram_wdata_o[9]_INST_0 
       (.I0(wdata_i[1]),
        .I1(addr_i[0]),
        .I2(wdata_i[9]),
        .I3(addr_i[1]),
        .O(bram_wdata_o[9]));
  design_1_bram_controller_1_0_bram_controller inst
       (.addr_i({addr_i[14:10],addr_i[1:0]}),
        .bram_addr_o(\^bram_addr_o ),
        .bram_rdata_i(bram_rdata_i),
        .clk_i(clk_i),
        .rd_en_i(rd_en_i),
        .rdata_o(rdata_o),
        .resetn_i(resetn_i));
endmodule

(* ORIG_REF_NAME = "bram_controller" *) 
module design_1_bram_controller_1_0_bram_controller
   (rdata_o,
    bram_addr_o,
    bram_rdata_i,
    rd_en_i,
    addr_i,
    clk_i,
    resetn_i);
  output [31:0]rdata_o;
  output [4:0]bram_addr_o;
  input [31:0]bram_rdata_i;
  input rd_en_i;
  input [6:0]addr_i;
  input clk_i;
  input resetn_i;

  wire [6:0]addr_i;
  wire [4:0]bram_addr_o;
  wire \bram_addr_o[12]_INST_0_i_1_n_0 ;
  wire \bram_addr_o[8]_INST_0_i_1_n_0 ;
  wire \bram_addr_o[8]_INST_0_i_2_n_0 ;
  wire \bram_addr_o[8]_INST_0_i_3_n_0 ;
  wire \bram_addr_o[8]_INST_0_n_0 ;
  wire \bram_addr_o[8]_INST_0_n_1 ;
  wire \bram_addr_o[8]_INST_0_n_2 ;
  wire \bram_addr_o[8]_INST_0_n_3 ;
  wire \bram_raddr_d1r[1]_i_1_n_0 ;
  wire [31:0]bram_rdata_i;
  wire clk_i;
  wire [4:3]p_0_in;
  wire rd_en_i;
  wire [31:0]rdata_o;
  wire resetn_i;
  wire [3:0]\NLW_bram_addr_o[12]_INST_0_CO_UNCONNECTED ;
  wire [3:1]\NLW_bram_addr_o[12]_INST_0_O_UNCONNECTED ;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \bram_addr_o[12]_INST_0 
       (.CI(\bram_addr_o[8]_INST_0_n_0 ),
        .CO(\NLW_bram_addr_o[12]_INST_0_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_bram_addr_o[12]_INST_0_O_UNCONNECTED [3:1],bram_addr_o[4]}),
        .S({1'b0,1'b0,1'b0,\bram_addr_o[12]_INST_0_i_1_n_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \bram_addr_o[12]_INST_0_i_1 
       (.I0(addr_i[6]),
        .O(\bram_addr_o[12]_INST_0_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \bram_addr_o[8]_INST_0 
       (.CI(1'b0),
        .CO({\bram_addr_o[8]_INST_0_n_0 ,\bram_addr_o[8]_INST_0_n_1 ,\bram_addr_o[8]_INST_0_n_2 ,\bram_addr_o[8]_INST_0_n_3 }),
        .CYINIT(1'b0),
        .DI({addr_i[5:3],1'b0}),
        .O(bram_addr_o[3:0]),
        .S({\bram_addr_o[8]_INST_0_i_1_n_0 ,\bram_addr_o[8]_INST_0_i_2_n_0 ,\bram_addr_o[8]_INST_0_i_3_n_0 ,addr_i[2]}));
  LUT1 #(
    .INIT(2'h1)) 
    \bram_addr_o[8]_INST_0_i_1 
       (.I0(addr_i[5]),
        .O(\bram_addr_o[8]_INST_0_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \bram_addr_o[8]_INST_0_i_2 
       (.I0(addr_i[4]),
        .O(\bram_addr_o[8]_INST_0_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \bram_addr_o[8]_INST_0_i_3 
       (.I0(addr_i[3]),
        .O(\bram_addr_o[8]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \bram_raddr_d1r[1]_i_1 
       (.I0(resetn_i),
        .O(\bram_raddr_d1r[1]_i_1_n_0 ));
  FDCE \bram_raddr_d1r_reg[0] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\bram_raddr_d1r[1]_i_1_n_0 ),
        .D(addr_i[0]),
        .Q(p_0_in[3]));
  FDCE \bram_raddr_d1r_reg[1] 
       (.C(clk_i),
        .CE(rd_en_i),
        .CLR(\bram_raddr_d1r[1]_i_1_n_0 ),
        .D(addr_i[1]),
        .Q(p_0_in[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata_o[0]_INST_0 
       (.I0(bram_rdata_i[24]),
        .I1(bram_rdata_i[8]),
        .I2(p_0_in[3]),
        .I3(bram_rdata_i[16]),
        .I4(p_0_in[4]),
        .I5(bram_rdata_i[0]),
        .O(rdata_o[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \rdata_o[10]_INST_0 
       (.I0(bram_rdata_i[18]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[26]),
        .I3(p_0_in[4]),
        .I4(bram_rdata_i[10]),
        .O(rdata_o[10]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \rdata_o[11]_INST_0 
       (.I0(bram_rdata_i[19]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[27]),
        .I3(p_0_in[4]),
        .I4(bram_rdata_i[11]),
        .O(rdata_o[11]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \rdata_o[12]_INST_0 
       (.I0(bram_rdata_i[20]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[28]),
        .I3(p_0_in[4]),
        .I4(bram_rdata_i[12]),
        .O(rdata_o[12]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \rdata_o[13]_INST_0 
       (.I0(bram_rdata_i[21]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[29]),
        .I3(p_0_in[4]),
        .I4(bram_rdata_i[13]),
        .O(rdata_o[13]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \rdata_o[14]_INST_0 
       (.I0(bram_rdata_i[22]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[30]),
        .I3(p_0_in[4]),
        .I4(bram_rdata_i[14]),
        .O(rdata_o[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \rdata_o[15]_INST_0 
       (.I0(bram_rdata_i[23]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[31]),
        .I3(p_0_in[4]),
        .I4(bram_rdata_i[15]),
        .O(rdata_o[15]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \rdata_o[16]_INST_0 
       (.I0(bram_rdata_i[24]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[16]),
        .I3(p_0_in[4]),
        .O(rdata_o[16]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \rdata_o[17]_INST_0 
       (.I0(bram_rdata_i[25]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[17]),
        .I3(p_0_in[4]),
        .O(rdata_o[17]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \rdata_o[18]_INST_0 
       (.I0(bram_rdata_i[26]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[18]),
        .I3(p_0_in[4]),
        .O(rdata_o[18]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \rdata_o[19]_INST_0 
       (.I0(bram_rdata_i[27]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[19]),
        .I3(p_0_in[4]),
        .O(rdata_o[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata_o[1]_INST_0 
       (.I0(bram_rdata_i[25]),
        .I1(bram_rdata_i[9]),
        .I2(p_0_in[3]),
        .I3(bram_rdata_i[17]),
        .I4(p_0_in[4]),
        .I5(bram_rdata_i[1]),
        .O(rdata_o[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \rdata_o[20]_INST_0 
       (.I0(bram_rdata_i[28]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[20]),
        .I3(p_0_in[4]),
        .O(rdata_o[20]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \rdata_o[21]_INST_0 
       (.I0(bram_rdata_i[29]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[21]),
        .I3(p_0_in[4]),
        .O(rdata_o[21]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \rdata_o[22]_INST_0 
       (.I0(bram_rdata_i[30]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[22]),
        .I3(p_0_in[4]),
        .O(rdata_o[22]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h00B8)) 
    \rdata_o[23]_INST_0 
       (.I0(bram_rdata_i[31]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[23]),
        .I3(p_0_in[4]),
        .O(rdata_o[23]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \rdata_o[24]_INST_0 
       (.I0(p_0_in[4]),
        .I1(bram_rdata_i[24]),
        .I2(p_0_in[3]),
        .O(rdata_o[24]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \rdata_o[25]_INST_0 
       (.I0(p_0_in[4]),
        .I1(bram_rdata_i[25]),
        .I2(p_0_in[3]),
        .O(rdata_o[25]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \rdata_o[26]_INST_0 
       (.I0(p_0_in[4]),
        .I1(bram_rdata_i[26]),
        .I2(p_0_in[3]),
        .O(rdata_o[26]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \rdata_o[27]_INST_0 
       (.I0(p_0_in[4]),
        .I1(bram_rdata_i[27]),
        .I2(p_0_in[3]),
        .O(rdata_o[27]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \rdata_o[28]_INST_0 
       (.I0(p_0_in[4]),
        .I1(bram_rdata_i[28]),
        .I2(p_0_in[3]),
        .O(rdata_o[28]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \rdata_o[29]_INST_0 
       (.I0(p_0_in[4]),
        .I1(bram_rdata_i[29]),
        .I2(p_0_in[3]),
        .O(rdata_o[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata_o[2]_INST_0 
       (.I0(bram_rdata_i[26]),
        .I1(bram_rdata_i[10]),
        .I2(p_0_in[3]),
        .I3(bram_rdata_i[18]),
        .I4(p_0_in[4]),
        .I5(bram_rdata_i[2]),
        .O(rdata_o[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \rdata_o[30]_INST_0 
       (.I0(p_0_in[4]),
        .I1(bram_rdata_i[30]),
        .I2(p_0_in[3]),
        .O(rdata_o[30]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \rdata_o[31]_INST_0 
       (.I0(p_0_in[4]),
        .I1(bram_rdata_i[31]),
        .I2(p_0_in[3]),
        .O(rdata_o[31]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata_o[3]_INST_0 
       (.I0(bram_rdata_i[27]),
        .I1(bram_rdata_i[11]),
        .I2(p_0_in[3]),
        .I3(bram_rdata_i[19]),
        .I4(p_0_in[4]),
        .I5(bram_rdata_i[3]),
        .O(rdata_o[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata_o[4]_INST_0 
       (.I0(bram_rdata_i[28]),
        .I1(bram_rdata_i[12]),
        .I2(p_0_in[3]),
        .I3(bram_rdata_i[20]),
        .I4(p_0_in[4]),
        .I5(bram_rdata_i[4]),
        .O(rdata_o[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata_o[5]_INST_0 
       (.I0(bram_rdata_i[29]),
        .I1(bram_rdata_i[13]),
        .I2(p_0_in[3]),
        .I3(bram_rdata_i[21]),
        .I4(p_0_in[4]),
        .I5(bram_rdata_i[5]),
        .O(rdata_o[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata_o[6]_INST_0 
       (.I0(bram_rdata_i[30]),
        .I1(bram_rdata_i[14]),
        .I2(p_0_in[3]),
        .I3(bram_rdata_i[22]),
        .I4(p_0_in[4]),
        .I5(bram_rdata_i[6]),
        .O(rdata_o[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \rdata_o[7]_INST_0 
       (.I0(bram_rdata_i[31]),
        .I1(bram_rdata_i[15]),
        .I2(p_0_in[3]),
        .I3(bram_rdata_i[23]),
        .I4(p_0_in[4]),
        .I5(bram_rdata_i[7]),
        .O(rdata_o[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \rdata_o[8]_INST_0 
       (.I0(bram_rdata_i[16]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[24]),
        .I3(p_0_in[4]),
        .I4(bram_rdata_i[8]),
        .O(rdata_o[8]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \rdata_o[9]_INST_0 
       (.I0(bram_rdata_i[17]),
        .I1(p_0_in[3]),
        .I2(bram_rdata_i[25]),
        .I3(p_0_in[4]),
        .I4(bram_rdata_i[9]),
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
