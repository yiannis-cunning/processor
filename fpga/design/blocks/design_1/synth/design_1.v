//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Wed Sep 16 04:48:34 2026
//Host        : Yiannis-XPS running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=6,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk_i,
    gpio_i,
    gpio_o,
    resetn_i,
    run_req_i);
  input clk_i;
  input [31:0]gpio_i;
  output [31:0]gpio_o;
  input resetn_i;
  input run_req_i;

  wire [12:0]bram_controller_0_BRAM_PORT_A_ADDR;
  wire bram_controller_0_BRAM_PORT_A_CLK;
  wire [31:0]bram_controller_0_BRAM_PORT_A_DIN;
  wire [31:0]bram_controller_0_BRAM_PORT_A_DOUT;
  wire bram_controller_0_BRAM_PORT_A_EN;
  wire [3:0]bram_controller_0_BRAM_PORT_A_WE;
  wire [12:0]bram_controller_1_BRAM_PORT_A_ADDR;
  wire bram_controller_1_BRAM_PORT_A_CLK;
  wire [31:0]bram_controller_1_BRAM_PORT_A_DIN;
  wire [31:0]bram_controller_1_BRAM_PORT_A_DOUT;
  wire bram_controller_1_BRAM_PORT_A_EN;
  wire [3:0]bram_controller_1_BRAM_PORT_A_WE;
  wire [4:0]bram_controller_2_BRAM_PORT_A_ADDR;
  wire bram_controller_2_BRAM_PORT_A_CLK;
  wire [31:0]bram_controller_2_BRAM_PORT_A_DIN;
  wire [31:0]bram_controller_2_BRAM_PORT_A_DOUT;
  wire bram_controller_2_BRAM_PORT_A_EN;
  wire [3:0]bram_controller_2_BRAM_PORT_A_WE;
  wire [31:0]bram_gpio_0_gpio_o;
  wire clk_i_0_1;
  wire [31:0]cpu_top_0_DCCM_LMB_M_ABUS;
  wire [3:0]cpu_top_0_DCCM_LMB_M_BE;
  wire [31:0]cpu_top_0_DCCM_LMB_M_READDBUS;
  wire cpu_top_0_DCCM_LMB_M_READSTROBE;
  wire [31:0]cpu_top_0_DCCM_LMB_M_WRITEDBUS;
  wire cpu_top_0_DCCM_LMB_M_WRITESTROBE;
  wire [31:0]cpu_top_0_ICCM_LMB_M_ABUS;
  wire [3:0]cpu_top_0_ICCM_LMB_M_BE;
  wire [31:0]cpu_top_0_ICCM_LMB_M_READDBUS;
  wire cpu_top_0_ICCM_LMB_M_READSTROBE;
  wire [31:0]cpu_top_0_ICCM_LMB_M_WRITEDBUS;
  wire cpu_top_0_ICCM_LMB_M_WRITESTROBE;
  wire [31:0]gpio_i_0_1;
  wire [31:0]lmb_mux_0_M_LMB_PORT_A_ABUS;
  wire [3:0]lmb_mux_0_M_LMB_PORT_A_BE;
  wire [31:0]lmb_mux_0_M_LMB_PORT_A_READDBUS;
  wire lmb_mux_0_M_LMB_PORT_A_READSTROBE;
  wire [31:0]lmb_mux_0_M_LMB_PORT_A_WRITEDBUS;
  wire lmb_mux_0_M_LMB_PORT_A_WRITESTROBE;
  wire [31:0]lmb_mux_0_M_LMB_PORT_B_ABUS;
  wire [3:0]lmb_mux_0_M_LMB_PORT_B_BE;
  wire [31:0]lmb_mux_0_M_LMB_PORT_B_READDBUS;
  wire lmb_mux_0_M_LMB_PORT_B_READSTROBE;
  wire [31:0]lmb_mux_0_M_LMB_PORT_B_WRITEDBUS;
  wire lmb_mux_0_M_LMB_PORT_B_WRITESTROBE;
  wire resetn_i_0_1;
  wire run_req_i_0_1;

  assign clk_i_0_1 = clk_i;
  assign gpio_i_0_1 = gpio_i[31:0];
  assign gpio_o[31:0] = bram_gpio_0_gpio_o;
  assign resetn_i_0_1 = resetn_i;
  assign run_req_i_0_1 = run_req_i;
  design_1_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(bram_controller_0_BRAM_PORT_A_ADDR),
        .clka(bram_controller_0_BRAM_PORT_A_CLK),
        .dina(bram_controller_0_BRAM_PORT_A_DIN),
        .douta(bram_controller_0_BRAM_PORT_A_DOUT),
        .ena(bram_controller_0_BRAM_PORT_A_EN),
        .wea(bram_controller_0_BRAM_PORT_A_WE));
  design_1_blk_mem_gen_0_1 blk_mem_gen_1
       (.addra(bram_controller_1_BRAM_PORT_A_ADDR),
        .clka(bram_controller_1_BRAM_PORT_A_CLK),
        .dina(bram_controller_1_BRAM_PORT_A_DIN),
        .douta(bram_controller_1_BRAM_PORT_A_DOUT),
        .ena(bram_controller_1_BRAM_PORT_A_EN),
        .wea(bram_controller_1_BRAM_PORT_A_WE));
  design_1_bram_controller_0_0 bram_controller_0
       (.addr_i(cpu_top_0_ICCM_LMB_M_ABUS),
        .bram_addr_o(bram_controller_0_BRAM_PORT_A_ADDR),
        .bram_byte_wr_en_o(bram_controller_0_BRAM_PORT_A_WE),
        .bram_clk_o(bram_controller_0_BRAM_PORT_A_CLK),
        .bram_en_o(bram_controller_0_BRAM_PORT_A_EN),
        .bram_rdata_i(bram_controller_0_BRAM_PORT_A_DOUT),
        .bram_wdata_o(bram_controller_0_BRAM_PORT_A_DIN),
        .clk_i(clk_i_0_1),
        .rd_en_i(cpu_top_0_ICCM_LMB_M_READSTROBE),
        .rdata_o(cpu_top_0_ICCM_LMB_M_READDBUS),
        .resetn_i(resetn_i_0_1),
        .wdata_i(cpu_top_0_ICCM_LMB_M_WRITEDBUS),
        .wr_byte_en_i(cpu_top_0_ICCM_LMB_M_BE),
        .wr_en_i(cpu_top_0_ICCM_LMB_M_WRITESTROBE));
  design_1_bram_controller_1_0 bram_controller_1
       (.addr_i(lmb_mux_0_M_LMB_PORT_A_ABUS),
        .bram_addr_o(bram_controller_1_BRAM_PORT_A_ADDR),
        .bram_byte_wr_en_o(bram_controller_1_BRAM_PORT_A_WE),
        .bram_clk_o(bram_controller_1_BRAM_PORT_A_CLK),
        .bram_en_o(bram_controller_1_BRAM_PORT_A_EN),
        .bram_rdata_i(bram_controller_1_BRAM_PORT_A_DOUT),
        .bram_wdata_o(bram_controller_1_BRAM_PORT_A_DIN),
        .clk_i(clk_i_0_1),
        .rd_en_i(lmb_mux_0_M_LMB_PORT_A_READSTROBE),
        .rdata_o(lmb_mux_0_M_LMB_PORT_A_READDBUS),
        .resetn_i(resetn_i_0_1),
        .wdata_i(lmb_mux_0_M_LMB_PORT_A_WRITEDBUS),
        .wr_byte_en_i(lmb_mux_0_M_LMB_PORT_A_BE),
        .wr_en_i(lmb_mux_0_M_LMB_PORT_A_WRITESTROBE));
  design_1_bram_controller_2_0 bram_controller_2
       (.addr_i(lmb_mux_0_M_LMB_PORT_B_ABUS),
        .bram_addr_o(bram_controller_2_BRAM_PORT_A_ADDR),
        .bram_byte_wr_en_o(bram_controller_2_BRAM_PORT_A_WE),
        .bram_clk_o(bram_controller_2_BRAM_PORT_A_CLK),
        .bram_en_o(bram_controller_2_BRAM_PORT_A_EN),
        .bram_rdata_i(bram_controller_2_BRAM_PORT_A_DOUT),
        .bram_wdata_o(bram_controller_2_BRAM_PORT_A_DIN),
        .clk_i(clk_i_0_1),
        .rd_en_i(lmb_mux_0_M_LMB_PORT_B_READSTROBE),
        .rdata_o(lmb_mux_0_M_LMB_PORT_B_READDBUS),
        .resetn_i(resetn_i_0_1),
        .wdata_i(lmb_mux_0_M_LMB_PORT_B_WRITEDBUS),
        .wr_byte_en_i(lmb_mux_0_M_LMB_PORT_B_BE),
        .wr_en_i(lmb_mux_0_M_LMB_PORT_B_WRITESTROBE));
  design_1_bram_gpio_0_0 bram_gpio_0
       (.bram_addr_i(bram_controller_2_BRAM_PORT_A_ADDR),
        .bram_byte_wr_en_i(bram_controller_2_BRAM_PORT_A_WE),
        .bram_clk_i(bram_controller_2_BRAM_PORT_A_CLK),
        .bram_en_i(bram_controller_2_BRAM_PORT_A_EN),
        .bram_rdata_o(bram_controller_2_BRAM_PORT_A_DOUT),
        .bram_wdata_i(bram_controller_2_BRAM_PORT_A_DIN),
        .clk_i(clk_i_0_1),
        .gpio_i(gpio_i_0_1),
        .gpio_o(bram_gpio_0_gpio_o),
        .resetn_i(resetn_i_0_1));
  design_1_cpu_top_0_0 cpu_top_0
       (.clk_i(clk_i_0_1),
        .dccm_addr_o(cpu_top_0_DCCM_LMB_M_ABUS),
        .dccm_rd_en_o(cpu_top_0_DCCM_LMB_M_READSTROBE),
        .dccm_rdata_i(cpu_top_0_DCCM_LMB_M_READDBUS),
        .dccm_wdata_o(cpu_top_0_DCCM_LMB_M_WRITEDBUS),
        .dccm_wr_byte_en_i(cpu_top_0_DCCM_LMB_M_BE),
        .dccm_wr_en_o(cpu_top_0_DCCM_LMB_M_WRITESTROBE),
        .iccm_data_i(cpu_top_0_ICCM_LMB_M_READDBUS),
        .iccm_rd_en_o(cpu_top_0_ICCM_LMB_M_READSTROBE),
        .iccm_wdata_o(cpu_top_0_ICCM_LMB_M_WRITEDBUS),
        .iccm_word_raddr_o(cpu_top_0_ICCM_LMB_M_ABUS),
        .iccm_wr_byte_en_i(cpu_top_0_ICCM_LMB_M_BE),
        .iccm_wr_en_o(cpu_top_0_ICCM_LMB_M_WRITESTROBE),
        .resetn_i(resetn_i_0_1),
        .run_req_i(run_req_i_0_1));
  design_1_lmb_mux_0_0 lmb_mux_0
       (.addr_i(cpu_top_0_DCCM_LMB_M_ABUS),
        .dccm_addr_a_o(lmb_mux_0_M_LMB_PORT_A_ABUS),
        .dccm_addr_b_o(lmb_mux_0_M_LMB_PORT_B_ABUS),
        .dccm_rd_en_a_o(lmb_mux_0_M_LMB_PORT_A_READSTROBE),
        .dccm_rd_en_b_o(lmb_mux_0_M_LMB_PORT_B_READSTROBE),
        .dccm_rdata_a_i(lmb_mux_0_M_LMB_PORT_A_READDBUS),
        .dccm_rdata_b_i(lmb_mux_0_M_LMB_PORT_B_READDBUS),
        .dccm_wdata_a_o(lmb_mux_0_M_LMB_PORT_A_WRITEDBUS),
        .dccm_wdata_b_o(lmb_mux_0_M_LMB_PORT_B_WRITEDBUS),
        .dccm_wr_byte_en_a_i(lmb_mux_0_M_LMB_PORT_A_BE),
        .dccm_wr_byte_en_b_i(lmb_mux_0_M_LMB_PORT_B_BE),
        .dccm_wr_en_a_o(lmb_mux_0_M_LMB_PORT_A_WRITESTROBE),
        .dccm_wr_en_b_o(lmb_mux_0_M_LMB_PORT_B_WRITESTROBE),
        .rd_en_i(cpu_top_0_DCCM_LMB_M_READSTROBE),
        .rdata_o(cpu_top_0_DCCM_LMB_M_READDBUS),
        .wdata_i(cpu_top_0_DCCM_LMB_M_WRITEDBUS),
        .wr_byte_en_i(cpu_top_0_DCCM_LMB_M_BE),
        .wr_en_i(cpu_top_0_DCCM_LMB_M_WRITESTROBE));
endmodule
