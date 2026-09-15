//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Mon Sep 14 04:17:51 2026
//Host        : Yiannis-XPS running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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

  wire clk_i;
  wire [31:0]gpio_i;
  wire [31:0]gpio_o;
  wire resetn_i;
  wire run_req_i;

  design_1 design_1_i
       (.clk_i(clk_i),
        .gpio_i(gpio_i),
        .gpio_o(gpio_o),
        .resetn_i(resetn_i),
        .run_req_i(run_req_i));
endmodule
