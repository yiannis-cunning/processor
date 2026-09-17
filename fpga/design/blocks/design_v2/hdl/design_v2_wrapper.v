//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
//Date        : Thu Sep 17 07:13:48 2026
//Host        : DESKTOP-7L9HO1V running 64-bit Debian GNU/Linux 12 (bookworm)
//Command     : generate_target design_v2_wrapper.bd
//Design      : design_v2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_v2_wrapper
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

  design_v2 design_v2_i
       (.clk_i(clk_i),
        .gpio_i(gpio_i),
        .gpio_o(gpio_o),
        .resetn_i(resetn_i),
        .run_req_i(run_req_i));
endmodule
