// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Sep 16 05:22:55 2026
// Host        : Yiannis-XPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/yiann/Desktop/gits/processor/fpga/design/blocks/design_1/ip/design_1_lmb_mux_0_0/design_1_lmb_mux_0_0_sim_netlist.v
// Design      : design_1_lmb_mux_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_lmb_mux_0_0,lmb_mux,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "lmb_mux,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module design_1_lmb_mux_0_0
   (addr_i,
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
  wire [31:0]dccm_rdata_a_i;
  wire rd_en_i;
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
  assign rdata_o[31:0] = dccm_rdata_a_i;
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
